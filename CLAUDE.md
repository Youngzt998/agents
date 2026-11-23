# Global rules for Claude Code (Ziteng Yang)

These rules apply to every session. Project-level CLAUDE.md files add to them and never override them. An overlay repo (a private rules repo, e.g. employer-internal) may import this file from its own entry file and add rules on top.

## Rules zero: three rules read before every other rule

**A document holds only what the author asked for.** When writing any document, writing anything the author did not ask for is forbidden: no date, no count, no status sentence, no comment or footnote, no section that the order did not name. Where the order names the items, the document holds those items and nothing else. Author (2026-11-23): "写任何doc都禁止主动写任何我没让你写的东西" (English: "when writing any document it is forbidden to write, on your own initiative, anything I did not ask you to write"). The full rule with its case is P00 in `rules/00-communication.md`; P20a there is its earlier form.

**The least text that carries the ordered information.** Every piece of writing defaults to the smallest amount of text that expresses the information the author asked to be written; a longer form is written only when the author asks for it. Author (2026-11-23): "任何写作内容，都默认用能表达我要求写作的文字信息的最少的文字量" (English: "any written content defaults to the least amount of text that expresses the textual information I asked to be written"). The full rule is P00a in `rules/00-communication.md`; P20 there is its earlier form.

**No coined words, and a self-check after every piece of writing.** Every piece of writing and every message to the author avoids words of the writer's own making: a word that the context has not defined and that is not a general term of the field. After finishing a piece of writing, the writer reads it once for such words and corrects every one found. Author (2026-11-23): "任何写作内容、和我的沟通内容，都要避免出现自造词汇，是否使用了在上下文中没定义、而且不是通用术语的词汇；对于写作任务，每次写作完成以后都要自查一遍、出现了则需要自己修正" (English: "all written content and all communication with me must avoid self-coined vocabulary, that is, words not defined in the context and not general terminology; for writing tasks, check once after every piece of writing is finished and correct it yourself where such words appear"). The full rule is P00b in `rules/00-communication.md`; P26 there is its earlier form.

@~/.agents/rules/00-communication.md
@~/.agents/rules/05-terminal-output.md
@~/.agents/rules/10-writing-docs.md
@~/.agents/rules/20-code-design.md
@~/.agents/rules/30-terminology.md
@~/.agents/rules/40-evidence-levels.md
@~/.agents/rules/50-scaffolding.md
@~/.agents/rules/60-project-repos.md
@~/.agents/rules/70-common-mistakes.md

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
- Before putting a decision to the user, and after the user decides something: follow `workflows/project-decisions.md` (the project's decision document; a recorded decision is applied, never asked again).
- When the user says you got something wrong: follow `workflows/feedback.md` (it routes the lesson to this repo or to the overlay repo; with no overlay mounted, everything is recorded here).
- After any edit to this repo: commit and push in the same task; on a rejected push, pull --rebase, resolve conflicts, push again, and report the conflict.
