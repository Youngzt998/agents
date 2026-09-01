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

Three tiers. The point is to keep always-resident context small.

| Tier | Content | Loaded |
|---|---|---|
| 0 | `AGENTS.md` | **Every session.** Must stay short. |
| 1 | `skills/*/SKILL.md` | On demand. Claude Code triggers on the frontmatter `description`; other agents follow the routing table in `AGENTS.md` and read the file by path. |
| 2 | A project's own `CLAUDE.md` / `AGENTS.md` | Inside that project. Takes precedence over this repo. |

Why the split: Claude Code inlines `@file` imports **eagerly at session start**,
so they cost context whether or not they are relevant. Splitting rules into files
and importing them is not real modularity. Genuine on-demand loading comes from
skills (Claude Code) or from a routing table plus a file read (Codex and others).
One `SKILL.md` serves both paths, so there is a single source of truth.

## What gets mounted

```
~/.claude/CLAUDE.md       -> AGENTS.md        symlink
~/.claude/skills/<name>   -> skills/<name>    symlink per entry, local skills untouched
~/.claude/agents/<x>.md   -> agents/<x>.md
~/.claude/commands/<x>.md -> commands/<x>.md
~/.claude/settings.json      merged, not symlinked -- Claude Code writes back to it
~/.codex/AGENTS.md        -> AGENTS.md        symlink
~/.codex/prompts/<x>.md   -> commands/<x>.md
~/.codex/config.toml         copied from template only if absent
```

Symlinks rather than copies: edit rules on any machine and `git -C ~/.agents diff`
shows it immediately, ready to push.

## Layout

```
AGENTS.md          tier 0, the only always-resident file
skills/            tier 1 rule library (also Claude Code skills)
commands/          slash commands (Claude commands / Codex prompts)
agents/            Claude Code subagent definitions
hooks/             hook scripts, referenced by absolute $HOME paths
settings/          claude.settings.json / codex.config.toml templates
install.sh         idempotent symlink install
```

## Note on credentials

`~/.claude/config.json` and `~/.claude/.credentials.json` hold plaintext
credentials. `.gitignore` blocks files by those names, but never place `~/.claude`
itself under version control.
