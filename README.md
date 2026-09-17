# agents

Personal global rules for AI coding agents, shared across machines and models
(Claude Code, Codex). **Private repository.**

## Bootstrap on a new machine

```bash
git clone git@github.com:<user>/agents.git ~/.agents
bash ~/.agents/install.sh
```

The repo is private, so the clone needs credentials: an SSH key on the machine,
or `gh auth login`, or an HTTPS clone with a PAT. On shared servers where you
would rather not leave a key, `gh auth login` with a short-lived token is the
least persistent option.

`install.sh` is idempotent and safe to re-run. Any real file it would replace is
backed up to `<name>.bak.<timestamp>` first.

Update (worth aliasing as `agents-sync`):

```bash
git -C ~/.agents pull --ff-only && bash ~/.agents/install.sh
```

## Design

Three tiers, plus an optional overlay.

| Tier | Content | Loaded |
|---|---|---|
| 0 | `CLAUDE.md` / `AGENTS.md` + the six files in `rules/` they import | **Every session.** Short, checkable rules with a bad/good example each. |
| 1 | `workflows/`, `glossary/`, `skills/*/SKILL.md` | On demand. Claude Code triggers skills on the frontmatter `description`; other agents follow the routing table in `AGENTS.md` and read the file by path. |
| 2 | A project's own `CLAUDE.md` / `AGENTS.md` | Inside that project. Adds to this repo, never overrides it. |

Overlay repo: a separate private rules repo (for example an employer-internal
one) whose entry file imports this repo's `rules/` and then adds its own
domain rules, glossary entries, and project cards. Its install script runs
this repo's `install.sh` first and then re-points the entry-file symlinks at
its own entry files. This repo never references the overlay by name, so it
stays free of employer-specific content. `workflows/feedback.md` routes each
recorded lesson to this repo (genericized) or to the overlay.

The `rules/` files are deliberately always-resident even though `@file`
imports load eagerly: they govern every message (language, output format,
evidence levels), so on-demand loading would defeat them. Genuinely
situational material lives in `workflows/` and `skills/` and is read on
demand.

## What gets mounted

```
~/.claude/CLAUDE.md       -> CLAUDE.md        symlink (overlay may re-point it)
~/.claude/skills/<name>   -> skills/<name>    symlink per entry, local skills untouched
~/.claude/agents/<x>.md   -> agents/<x>.md
~/.claude/commands/<x>.md -> commands/<x>.md
~/.claude/settings.json      merged, not symlinked -- Claude Code writes back to it
~/.codex/AGENTS.md        -> AGENTS.md        symlink (overlay may re-point it)
~/.codex/prompts/<x>.md   -> commands/<x>.md
~/.codex/config.toml         copied from template only if absent
```

`rules/`, `workflows/`, `glossary/`, and `feedback/` are referenced by absolute
path (`~/.agents/...`) and need no mounting.

Symlinks rather than copies: edit rules on any machine and `git -C ~/.agents diff`
shows it immediately, ready to push.

## Layout

```
CLAUDE.md          Claude Code entry point. Imports rules/ with @path
AGENTS.md          Codex entry point. Same content as a read list plus routing table
rules/             Tier 0 rules. Each one is short, checkable, and has a bad/good example
workflows/         Fixed procedures for multi-step tasks: write a doc, design note, explain a project, record feedback, self-review
glossary/          Glossary, known-terms allowlist, and one project card per project
feedback/LOG.md    Feedback log. A mistake becomes one entry; recurring entries get promoted into rules/
skills/            Tier 1 rule library (also Claude Code skills). Includes the workflow-runner skills /write-doc, /design-note, /explain-project, /feedback, /review-output
commands/          Slash commands (Claude commands / Codex prompts)
agents/            Claude Code subagent definitions
hooks/             hook scripts, referenced by absolute $HOME paths
settings/          claude.settings.json / codex.config.toml templates
install.sh         idempotent symlink install
```

## How to use it (the core loop)

1. **When the AI gets something wrong, do not only correct it in chat.** Type
   `/feedback <what went wrong>`. The AI appends an entry to the routed
   feedback log using the template and proposes which rule to change.
2. **Spend ten minutes a week on the log.** A problem that appears twice or
   more becomes a rule in `rules/`. Mark the log entry `promoted`.
3. **Write a project card before working on a new project.** Type
   `/explain-project`. The AI reads the code and drafts
   `glossary/projects/<name>.md`. Edit until you approve it.
4. **New terms go into the glossary.** When the AI meets a word the glossary
   lacks, it must stop and ask. It may not invent a word.
5. **Docs and designs go through a workflow, never straight to output.**
   `/write-doc` produces an outline first and waits. `/design-note` produces a
   design note first and waits, then writes code.
6. **Self-check before delivery.** `/review-output` checks the final output
   against `workflows/review-output.md`.

## Note on credentials

`~/.claude/config.json` and `~/.claude/.credentials.json` hold plaintext
credentials. `.gitignore` blocks files by those names, but never place `~/.claude`
itself under version control.
