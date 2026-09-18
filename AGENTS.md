# Global Agent Rules — Ziteng Yang

Personal global rules for AI coding agents, shared across machines and models
(Claude Code, Codex). Claude Code loads `CLAUDE.md`, which imports `rules/`
eagerly; agents without an import mechanism read the files below by path.

## 0. Precedence

Project-level rules files add to these and never override them. An overlay
repo — a private rules repo whose entry file reads this one, e.g. an
employer-internal repo — adds on top of these rules; where they genuinely
conflict, the overlay wins and the conflict is reported.

A skill the user invokes by hand (a slash command) overrides every rule here
that conflicts with it, from the invocation until the user turns it off or the
session ends. Rules that do not conflict stay in force. Author: "我需要手动触发
的skill在生效期间覆盖冲突的规则" (English: "a manually triggered skill overrides
the conflicting rules while it is in effect").

## 1. Rules read at the start of every session, in order

1. `~/.agents/rules/00-communication.md`
2. `~/.agents/rules/05-terminal-output.md`
3. `~/.agents/rules/10-writing-docs.md`
4. `~/.agents/rules/20-code-design.md`
5. `~/.agents/rules/30-terminology.md`
6. `~/.agents/rules/40-evidence-levels.md`
7. `~/.agents/rules/50-scaffolding.md`

## 2. On-demand rules (routing table)

Before working in one of the areas below, read the corresponding file first.
Claude Code loads the skills automatically; agents without a skill mechanism
read them by path.

| Area | File |
|---|---|
| Naming any concept, in any work | `~/.agents/glossary/terminology.md` |
| Writing mathematical notation | `~/.agents/glossary/notation.md` |
| Describing or naming anything about a project | `~/.agents/glossary/GLOSSARY.md` and `glossary/projects/<project>.md` |
| A fact learned before and needed again | `~/.agents/KNOWLEDGE-BASE.md` |
| Terms the user no longer needs explained | `~/.agents/glossary/known-terms.md` |
| Any document longer than a paragraph | `~/.agents/workflows/write-doc.md` |
| Adding a module, abstraction, or interface | `~/.agents/workflows/design-note.md` |
| Before the final message of a task | `~/.agents/workflows/review-output.md` |
| The user says the output was wrong | `~/.agents/workflows/feedback.md` |
| Checking a paper draft before review or submission | `~/.agents/workflows/paper-quality.md` |
| Writing or changing code, in any language | `~/.agents/skills/coding/SKILL.md` |
| Proof assistants | `~/.agents/skills/proof-assistant/SKILL.md` |
| Academic writing | `~/.agents/skills/paper-writing/SKILL.md` |
| Reviewing a paper | `~/.agents/skills/paper-review/SKILL.md` |
| Artifact evaluation review | `~/.agents/skills/artifact-evaluation/SKILL.md` |
| Tech blog posts | `~/.agents/skills/tech-blog/SKILL.md` |
| Slides | `~/.agents/skills/slides/SKILL.md` |
