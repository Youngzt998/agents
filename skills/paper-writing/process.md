# Paper drafting process

How drafting is paced, what may be edited, and when checks run. These override the
general delivery habits while a paper is being written.

## Draft in small passages and stop for review

The default mode for body text is one short passage at a time: write it, hand it
back, wait. Do not run on into the next passage.

Two boundaries mark how far review has reached, and **neither moves on your own
initiative**:

- A **final** boundary. Text above it is frozen. Changing anything above it needs
  the user's explicit re-approval. It moves only when they declare something
  final, and the outline records the same mark at the matching place.
- A **first-review** boundary, below the final one. Text above it has had one
  review. It may still be edited, and every change above it is walked past the
  user item by item rather than made and reported. It moves only when the user
  says a first review is complete up to a named point.

## Do not touch body text that was not asked for

Edits stay inside the passage the user named. If something outside it looks wrong,
raise it as a suggestion and wait for an answer. Never fix it in passing.

A sentence the user has edited is theirs. Keep their wording, repair only outright
grammatical breaks, and say what you touched
(`~/.agents/rules/00-communication.md`, section "Editing what the user wrote").

## A terminology change is a two-file change

The glossary is the single source of truth for terms and notation. When the user
redefines a term or a phrasing, update the glossary in the same turn as the prose,
so the two never drift. Writing a term down as it is introduced is part of
drafting, and is separate from the consistency sweeps below.

## Quality checks run on request only

`~/.agents/workflows/paper-quality.md` runs when the user asks for it, and at no
other time: not after an edit, not before a section is declared final, not on your
own initiative. Consistency sweeps across the glossary and the outline follow the
same rule.

## Write it once, to length

Before writing a section, know its page budget and what has to fit in it, then
write prose that already fits. A passage that arrives over budget is rewritten
before it is shown, rather than shown and then trimmed. The shortest-honest-length
test applies while drafting rather than afterwards
(`~/.agents/rules/10-writing-docs.md` P5 and P8).

## Reporting

Report as an exhaustive checklist: every file changed, every commit made, every
step taken appears on it, and anything not on it did not happen. The shape of the
report is `~/.agents/rules/05-terminal-output.md` § 2.
