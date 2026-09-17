# Workflow: review your output before delivering

Run the relevant sections. Fix, then deliver. Say in one line which sections you ran.

## Every message

- [ ] Reply language matches the user's (Chinese in the terminal). Every artifact written or edited is in standard English.
- [ ] First sentence is the result or answer.
- [ ] Every adjective from the do-not-use list has a concrete noun after it or is deleted.
- [ ] Every acronym expanded once.
- [ ] Every term matches the glossary. No two names for one thing.
- [ ] Verified facts and assumptions are separated with explicit words.
- [ ] Errors quoted verbatim in code blocks.
- [ ] No filler openers or closers.
- [ ] Every claim about behavior or results has an evidence level 0 to 6, written "(置信等级-N)", and a source (`rules/40-evidence-levels.md`).
- [ ] No metaphors, analogies, or literary words. Non-technical words are the simplest everyday words.
- [ ] Every non-standard computing term is defined in the Terms block (messages) or before first use (documents).
- [ ] Term scan: list every noun in the draft that is not everyday language. For each, one of three holds: it is in `glossary/known-terms.md`; it is in this message's Terms block; it is a standard term of the field the reader named in the project card would recognize. A term defined in an earlier message, in a README, or only in my own reading does not count. Words I coined while summarizing ("编号选择", "互不冲突") are terms and need a definition or a rewrite into the concrete thing.
- [ ] No abbreviation outside the project allowlist.

## Documents

- [ ] Audience line present.
- [ ] Opening paragraph says what, why, and what the reader can do after.
- [ ] Headers are statements, not labels.
- [ ] Order is problem, approach, details, limitations.
- [ ] A "Limitations" or "Not covered" section exists and is honest.
- [ ] Each code block, table, diagram has a lead-in sentence.
- [ ] No paragraph over five sentences. No sentence over ~25 words.
- [ ] Terms defined on first use and never replaced by synonyms.
- [ ] Read it aloud once. Any sentence you stumbled on is rewritten.

## Code

- [ ] A design note exists if a module, type, interface, or case family was added.
- [ ] Adding the next case touches the files the design note said, and only those.
- [ ] All matches over a kind are exhaustive and enforced.
- [ ] No copy-pasted sibling. No `utils`/`helpers`/`misc` module added.
- [ ] Names match the glossary and the codebase's existing names.
- [ ] Every changed interface: all implementors and callers updated, listed in the commit message.
- [ ] Refactor and behavior change are in separate commits.
- [ ] Build and tests ran. Output quoted, not summarized.

## Project descriptions

- [ ] Phrasing copied from the project card.
- [ ] "proves/verifies" only with a theorem or test name and a scope.
- [ ] "What exists" and "what is verified" not mixed.
- [ ] Trusted and unfinished parts stated.
