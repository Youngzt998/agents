# Global Agent Rules — Ziteng Yang

Personal global rules for AI coding agents, shared across machines and models
(Claude Code, Codex). Claude Code loads `CLAUDE.md`, which imports `rules/`
eagerly; agents without an import mechanism read the files below by path.

## Rules zero: three rules read before every other rule

**A document holds only what the author asked for.** When writing any document, writing anything the author did not ask for is forbidden: no date, no count, no status sentence, no comment or footnote, no section that the order did not name. Where the order names the items, the document holds those items and nothing else. Author (2026-11-23): "写任何doc都禁止主动写任何我没让你写的东西" (English: "when writing any document it is forbidden to write, on your own initiative, anything I did not ask you to write"). The full rule with its case is P00 in `rules/00-communication.md`; P20a there is its earlier form.

**The least text that carries the ordered information.** Every piece of writing defaults to the smallest amount of text that expresses the information the author asked to be written; a longer form is written only when the author asks for it. Author (2026-11-23): "任何写作内容，都默认用能表达我要求写作的文字信息的最少的文字量" (English: "any written content defaults to the least amount of text that expresses the textual information I asked to be written"). The full rule is P00a in `rules/00-communication.md`; P20 there is its earlier form.

**No coined words, and a self-check after every piece of writing.** Every piece of writing and every message to the author avoids words of the writer's own making: a word that the context has not defined and that is not a general term of the field. After finishing a piece of writing, the writer reads it once for such words and corrects every one found. Author (2026-11-23): "任何写作内容、和我的沟通内容，都要避免出现自造词汇，是否使用了在上下文中没定义、而且不是通用术语的词汇；对于写作任务，每次写作完成以后都要自查一遍、出现了则需要自己修正" (English: "all written content and all communication with me must avoid self-coined vocabulary, that is, words not defined in the context and not general terminology; for writing tasks, check once after every piece of writing is finished and correct it yourself where such words appear"). The full rule is P00b in `rules/00-communication.md`; P26 there is its earlier form.

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
8. `~/.agents/rules/60-project-repos.md`
9. `~/.agents/rules/70-common-mistakes.md`

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
