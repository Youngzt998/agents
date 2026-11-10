# Workflow: the project's decision document

Trigger: a question is about to be put to the user, or the user has just made a
decision, in any project.

Every project keeps one decision document in its design repo, at the top of its
notes directory (for example `notes/author-decisions.md`). It records every
decision the user has explicitly made: a standard, an acceptance criterion, an
order, a ruling, a naming decision, a correction that fixes how the project works.
It records the user's decisions only, never the agent's own choices.

## Before asking the user for a decision

1. Search the decision document for the matter (the standard it concerns, the
   object it concerns, the words the user used).
2. If a recorded decision covers the matter, apply it and say so in one sentence
   ("applied the decision of <date>: ..."); do not ask.
3. If a recorded decision covers the matter only in part, apply the covered part
   and put the uncovered part to the user as one self-contained paragraph
   (`rules/00-communication.md` P27), naming the recorded decision it builds on.
4. Ask only when nothing in the document covers the matter.

## When the user makes a decision

1. The same day, add an entry to the decision document: the date, one sentence
   stating the decision in plain English, one sentence of scope or how to apply
   when the user gave it, and the source (the message, or the memory file that
   holds the user's words). An entry has at most three sentences.
2. Keep the entry under the section of its area; order entries by date; when a
   decision supersedes an earlier one, record the latest state and name the
   earlier entry as superseded.
3. Keep a last section "Open decisions awaiting the user": one line per question
   put to the user and not yet answered, with the date it was first asked.

## Starting a project

`/init-project` copies the template `skills/init-project/template/docs/author-decisions.md`
(the headings and the usage paragraph); the project fills it as decisions arrive.

Author (2026-11-10): "你专门做一个决策文档，记录我已经显示决策过的事情，不要老是反复问我（也写进agents rule的general 项目开发workflow方式里，就是agent要有一个专门的项目级决策文档，每次问决策的时候先检查文档里是否已经决定过了）" (English: "make a dedicated decision document that records what I have already explicitly decided, and stop asking me again and again; also write it into the general project-development workflow of the agent rules: the agent keeps a dedicated project-level decision document and, every time before asking for a decision, checks whether it was already decided there").
