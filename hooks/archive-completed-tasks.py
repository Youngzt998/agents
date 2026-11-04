#!/usr/bin/env python3
"""Claude Code hook: archive the completed tasks of the current session's task list.

Why this hook exists. When ten turns pass without a task-tool call, Claude Code
appends a reminder that lists every task of the session's task list, completed
tasks included. Claude Code clears the list on its own only once every task in
it is completed. Agents launched by the Workflow tool write to the same list,
so a list of a few thousand tasks costs 100,000 to 200,000 tokens per reminder
and the session compacts after almost every prompt.

What it does. Reads the hook payload from stdin, finds the task directory
(<config dir>/tasks/<list id>/), and, once the directory holds more than
THRESHOLD task files, moves every file whose status is "completed" into
<config dir>/tasks-archive/<list id>/<YYYY-MM-DD>/. Nothing is deleted; open
tasks, .highwatermark and .lock stay in place. One line per run goes to
<config dir>/tasks-archive/archive.log. The hook never blocks the agent: every
failure exits 0 and prints nothing.

Wired from settings/claude.settings.json as a Stop and SubagentStop hook.
"""

import fcntl
import json
import os
import re
import shutil
import sys
import time

THRESHOLD = 50  # task files; below this the list is left as it is


def config_dir():
    return os.environ.get("CLAUDE_CONFIG_DIR") or os.path.join(os.path.expanduser("~"), ".claude")


def list_id(payload):
    raw = os.environ.get("CLAUDE_CODE_TASK_LIST_ID") or payload.get("session_id") or ""
    return re.sub(r"[^a-zA-Z0-9_-]", "-", raw)


def completed_task_files(task_dir):
    names = [n for n in os.listdir(task_dir) if re.match(r"^\d+\.json$", n)]
    if len(names) <= THRESHOLD:
        return []
    done = []
    for name in names:
        try:
            with open(os.path.join(task_dir, name), encoding="utf-8") as fh:
                if json.load(fh).get("status") == "completed":
                    done.append(name)
        except (OSError, ValueError):
            continue
    return done


def archive(task_dir, archive_dir, names):
    os.makedirs(archive_dir, exist_ok=True)
    moved = 0
    for name in names:
        src = os.path.join(task_dir, name)
        dst = os.path.join(archive_dir, name)
        if os.path.exists(dst):
            dst = "%s.%d" % (dst, int(time.time()))
        try:
            shutil.move(src, dst)
            moved += 1
        except OSError:
            continue
    return moved


def main():
    try:
        payload = json.load(sys.stdin)
    except ValueError:
        payload = {}
    lid = list_id(payload)
    if not lid:
        return
    root = config_dir()
    task_dir = os.path.join(root, "tasks", lid)
    if not os.path.isdir(task_dir):
        return
    lock_path = os.path.join(task_dir, ".lock")
    lock = None
    if os.path.exists(lock_path):
        lock = open(lock_path)
        try:
            fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except OSError:
            return  # a task write is in progress; the next run archives
    try:
        names = completed_task_files(task_dir)
        if not names:
            return
        day = time.strftime("%Y-%m-%d", time.gmtime())
        archive_dir = os.path.join(root, "tasks-archive", lid, day)
        moved = archive(task_dir, archive_dir, names)
        with open(os.path.join(root, "tasks-archive", "archive.log"), "a", encoding="utf-8") as log:
            log.write("%s %s moved %d completed task files to %s\n"
                      % (time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()), lid, moved, archive_dir))
    finally:
        if lock is not None:
            lock.close()


if __name__ == "__main__":
    try:
        main()
    except Exception:
        pass
    sys.exit(0)
