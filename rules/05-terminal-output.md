# Terminal output (shared, every session, every message)

These rules apply to every message shown in the terminal. They override the general communication rules where they conflict.

## 1. Terms block first

Start every message with a block that defines each project-specific term or concept the message uses. One line per term. Format:

```
Terms: IR2 = the compiler's mid-level intermediate representation, between the frontend AST and machine code. lowering = the pass that turns IR2 into machine instructions.
```

- Take definitions from `glossary/`. If the glossary lacks the term, write a one-line definition and add it to the glossary in the same task.
- Skip a term only if it is listed in `glossary/known-terms.md`. The user adds terms there by saying "this concept needs no more explanation". When the user says that, append the term to `known-terms.md` immediately.
- If the message uses no project-specific term, omit the block.
- Every message stands alone. A term defined in an earlier message of the same conversation is defined again in this message's Terms block, or the message is rewritten to avoid it. The only exemption is `glossary/known-terms.md`.
- Before writing "Terms: 无新术语", run the term scan in `workflows/review-output.md`. A summary word I coined in this message counts as a term.

## 2. Work-command report format

When the message reports on a task the user asked you to do (code change, file edit, build, experiment, setup), use exactly this shape:

1. One sentence: what task was completed.
2. Bullets, one sentence each, in this order:
   - what you did
   - which files changed, described in words (what each file is for and how it changed), not just paths
   - why you did it that way
3. One sentence: the overall effect. What is now true that was not before.

Do not include:
- answers to questions the user did not ask
- offers or questions of the form "want me to X?", "should I X?", "let me know if"
- next-step lists, unless the user asked what to do next

If part of the task is unfinished, say which part and why, inside the bullets.

## 3. Positive descriptions only

Describe what a thing is. Do not describe it by contrast.

- Banned patterns: "X, not Y", "X rather than Y", "X instead of Y", "X as opposed to Y", "this is not a Y".
- Exception: the negation is itself the point the user asked about, such as "does this theorem cover Z?" answered "it does not cover Z".
- Rewrite: "the mapper is a table, not a switch" becomes "the mapper is a table".

This rule also applies to written documents (see `rules/10-writing-docs.md` rule 1).

## 4. Tables need a full legend

In coding tasks, Q&A, code analysis, and evaluation or experiment reports: every table is preceded by a paragraph that explains what each row represents and what each column means, including units and how each value was obtained.

- One sentence per column. One sentence for what a row is.
- The legend covers every symbol that appears inside cells, including single letters.
- Exception: the user has said this table shape needs no legend. Record such waivers in `glossary/known-terms.md` under "Tables".

## 5. Abbreviations are allowlisted per project

Write every term in full unless the abbreviation appears on the allowlist for the project the message is about.

- Allowlists live in each project card under "Abbreviations allowed" (`glossary/projects/<name>.md`). Cross-project abbreviations live in `glossary/GLOSSARY.md` under "Abbreviations allowed everywhere".
- An abbreviation that is on no list is written out in full every time, even if it is common in the codebase or the industry.
- To add one: propose the abbreviation, its expansion, and the project. Add it only after the user accepts.
- The first use of an allowlisted abbreviation in a message still gets its expansion in the Terms block (rule 1) unless it is in `glossary/known-terms.md`.

## 6. Word choice: plain words outside computing, standard words inside it

Two kinds of words, two rules.

**Non-technical words** (verbs, connectives, descriptions of what happened): use the simplest everyday word. "use" beats "utilize", "start" beats "initiate", "check" beats "validate" when no technical meaning is intended.

**Computing words**: use the term the field uses. A term counts as standard if practitioners of that field, or of the small subfield the code belongs to, would recognize it without explanation. Examples: "hash table", "semaphore", "SSA", "pattern match", "monad" in a Lean codebase.

- A computing word that is standard in the field may be used freely. Its first use in a message still appears in the Terms block (rule 1) unless it is in `glossary/known-terms.md`.
- A computing word that is project-specific, or that you coined, or that only this codebase uses that way, must be defined in the Terms block at the top of the message before it appears in the body. Never define it inline halfway through.
- Banned everywhere: literary or ornamental words ("elegant", "graceful", "orchestrate", "weave", "journey", "landscape", "under the hood") and metaphors or analogies of any kind ("acts as a gatekeeper", "the glue between", "a bridge to", "like a traffic light"). Say what the thing does.
- Rewrite: "the scheduler orchestrates the workers" becomes "the scheduler decides which worker runs next and when".
- Codes and shorthand defined only in this rules repo count as coined terms. The one approved shorthand is the evidence level, written "(置信等级-N)" per `rules/40-evidence-levels.md`. Any other private code is written out in plain words.
