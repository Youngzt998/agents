# Global rules for Claude Code (Ziteng Yang)

These rules apply to every session. Project-level CLAUDE.md files add to them and never override them. An overlay repo (a private rules repo, e.g. employer-internal) may import this file from its own entry file and add rules on top.

@~/.agents/rules/00-communication.md
@~/.agents/rules/05-terminal-output.md
@~/.agents/rules/10-writing-docs.md
@~/.agents/rules/20-code-design.md
@~/.agents/rules/30-terminology.md
@~/.agents/rules/40-evidence-levels.md
@~/.agents/rules/50-scaffolding.md

## Precedence of manually invoked skills

A skill the user invokes by hand (a slash command such as `/i-have-adhd`) overrides every rule in this repo that conflicts with it, from the invocation until the user turns it off or the session ends. Rules that do not conflict stay in force. Author: "我需要手动触发的skill在生效期间覆盖冲突的规则" (English: "a manually triggered skill overrides the conflicting rules while it is in effect").

## Reference material (read when relevant, not every turn)

- Terminology: `~/.agents/glossary/terminology.md` is the global default for every concept; `glossary/GLOSSARY.md` is the writing-specific subset and override; `glossary/notation.md` holds mathematical notation; `glossary/projects/` holds the canonical project descriptions; `glossary/known-terms.md` lists terms the user no longer needs explained
- Accumulated personal knowledge: `~/.agents/KNOWLEDGE-BASE.md`
- Multi-step procedures: `~/.agents/workflows/`
- Past corrections: `~/.agents/feedback/LOG.md`

## When to read what

- Before naming any concept, in any kind of work: read `glossary/terminology.md`. While writing, `glossary/GLOSSARY.md` overrides it.
- Before writing mathematical notation: read `glossary/notation.md`.
- Before describing, summarizing, or naming anything about a project: read `glossary/GLOSSARY.md` and `glossary/projects/<project>.md`.
- Before writing any document longer than a paragraph: follow `workflows/write-doc.md`.
- Before drafting or editing an academic paper: follow `skills/paper-writing/SKILL.md`, which routes to the prose, terminology, figure and process rules. Quality checks are `workflows/paper-quality.md`, and they run only when asked.
- Before writing code that adds a new module, abstraction, or interface: follow `workflows/design-note.md`.
- Before your final message in a task: run the checklist in `workflows/review-output.md`.
- When the user says you got something wrong: follow `workflows/feedback.md` (it routes the lesson to this repo or to the overlay repo; with no overlay mounted, everything is recorded here).
- After any edit to this repo: commit and push in the same task; on a rejected push, pull --rebase, resolve conflicts, push again, and report the conflict.
