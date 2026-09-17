# Global Agent Rules — Ziteng Yang

Personal global rules for AI coding agents, shared across machines and models
(Claude Code, Codex). Claude Code loads `CLAUDE.md`, which imports `rules/`
eagerly; agents without an import mechanism read the files below by path.

## 0. Precedence

Project-level rules files add to these and never override them. An overlay
repo — a private rules repo whose entry file reads this one, e.g. an
employer-internal repo — adds on top of these rules; where they genuinely
conflict, the overlay wins and the conflict is reported.

## 1. Rules read at the start of every session, in order

1. `~/.agents/rules/00-communication.md`
2. `~/.agents/rules/05-terminal-output.md`
3. `~/.agents/rules/10-writing-docs.md`
4. `~/.agents/rules/20-code-design.md`
5. `~/.agents/rules/30-terminology.md`
6. `~/.agents/rules/40-evidence-levels.md`

## 2. On-demand rules (routing table)

Before working in one of the areas below, read the corresponding file first.
Claude Code loads the skills automatically; agents without a skill mechanism
read them by path.

| Area | File |
|---|---|
| Describing or naming anything about a project | `~/.agents/glossary/GLOSSARY.md` and `glossary/projects/<project>.md` |
| Terms the user no longer needs explained | `~/.agents/glossary/known-terms.md` |
| Any document longer than a paragraph | `~/.agents/workflows/write-doc.md` |
| Adding a module, abstraction, or interface | `~/.agents/workflows/design-note.md` |
| Before the final message of a task | `~/.agents/workflows/review-output.md` |
| The user says the output was wrong | `~/.agents/workflows/feedback.md` |
| Checking a paper draft before review or submission | `~/.agents/workflows/paper-quality.md` |
| Writing or changing code, in any language | `~/.agents/skills/coding/SKILL.md` |
| Proof assistants | `~/.agents/skills/proof-assistant/SKILL.md` |
| Academic writing | `~/.agents/skills/paper-writing/SKILL.md` |
| Tech blog posts | `~/.agents/skills/tech-blog/SKILL.md` |
| Slides | `~/.agents/skills/slides/SKILL.md` |
