# Feedback log

Append-only. One entry per correction. Newest at the bottom. Format and routing in `workflows/feedback.md`: general lessons live here with private identifiers rewritten as generic descriptions; lessons tied to an overlay repo's projects live in that repo's log.

Status values: `open` (recorded), `promoted` (turned into a rule; say which), `wontfix` (decided not to act).

Review weekly. Any pattern with two or more `open` entries gets promoted.

---

## 2026-09-10 — seed entries from youngzt's initial complaints

### Unreadable explanations
- Symptom: AI messages use abstract adjectives ("systematic", "extensible") with no concrete referent; user cannot tell what changed.
- Root cause: no rule forcing concrete nouns after quality adjectives.
- Rule: `rules/00-communication.md` § Words, do-not-use list in glossary.
- Status: promoted

### Inconsistent project descriptions
- Symptom: each time AI describes the project it uses different phrasing and different verbs for the same facts; "verified" and "implemented" get mixed.
- Root cause: no single source of truth for project descriptions.
- Rule: project cards in `glossary/projects/`, `rules/30-terminology.md`.
- Status: promoted

### Human-unreadable docs
- Symptom: docs are bullet walls, label-style headers, passive voice, details before purpose.
- Root cause: AI drafts prose directly without an audience statement or outline.
- Rule: `rules/10-writing-docs.md`, `workflows/write-doc.md` (outline gate).
- Status: promoted

### Non-extensible code design
- Symptom: new cases added by copy-paste of siblings; no declared extension point; switches not exhaustive.
- Root cause: AI codes before naming the axis of change.
- Rule: `rules/20-code-design.md`, `workflows/design-note.md` (design gate).
- Status: promoted

### Inconsistent terminology in output
- Symptom: same component called by three names across one document.
- Root cause: no glossary; AI invents names per session.
- Rule: `glossary/GLOSSARY.md`, `rules/30-terminology.md` § "stop and propose".
- Status: promoted

## 2026-09-10 — terminal output rules requested by youngzt

### Terms not explained up front
- Symptom: messages use project terms the user has to look up mid-read.
- Rule: `rules/05-terminal-output.md` rule 1 (Terms block), `glossary/known-terms.md`.
- Status: promoted
- Recurrence 2026-09-11: wrote "Terms: 无新术语" and then used two coined phrases for concrete things (a numbering assignment and its injectivity requirement). User asked what the numbers are and what "conflict" means. Root cause: I coined a summary word for a concrete definition and treated my own coinage as not being a term. Rule 6 of `05-terminal-output.md` already bans this; the check "did I coin anything in this message" was not run.
- Recurrence 2026-09-16 (same day, again): a work report compressed a saved note into a chain of three self-coined labels with zero definitions, content the user had not asked to have summarized. Root cause unchanged (coined labels treated as shared vocabulary), plus a work-report violation: the "what changed" bullet introduced compressed technical claims and should have named the file and topic.
- Recurrence 2026-09-16: used a coined Chinese word for a domain concept across several messages with a Terms-block definition in only one of them; the example message that mattered lacked it. Fix: added the English term to the project card; conversation uses the English word.
- Recurrence 2026-09-11 (same day, third time): used a translated term across many messages without ever defining it; the user could not tell what it denotes here. Root cause: terms defined in my head from reading the README were treated as shared vocabulary. Rule 1 requires the Terms block in every message to cover every project-specific term the message uses, including ones used in earlier messages. Rule text added to `workflows/review-output.md` and `rules/05-terminal-output.md` rule 1 on 2026-09-11; also created the project card with the terms of that project.

### Work reports unstructured, plus unasked answers and "want me to" offers
- Rule: `rules/05-terminal-output.md` rule 2.
- Status: promoted

### Contrast phrasing ("X, not Y")
- Rule: `rules/05-terminal-output.md` rule 3, `rules/10-writing-docs.md` rule 1.
- Status: promoted

### Tables without legend
- Rule: `rules/05-terminal-output.md` rule 4.
- Status: promoted
- Recurrence 2026-09-16 (again, same day): a data-structure word was shortened and used bare; the Terms line defined it only by what it stores, never the mechanism that makes it that structure. A definition must cover the mechanism when the word imports a data structure.
- Recurrence 2026-09-16: a resource-budget table used six bare single letters in cells; the legend described rows and columns but not the symbols inside cells. Rule 4 compliance must cover every symbol appearing in cells, and the standalone rule applies to single-letter symbols from earlier messages. One earlier-defined term was also used without its definition being repeated in that message.

### Unlisted abbreviations
- Date: 2026-09-10
- Symptom: messages use abbreviations the user has to decode.
- Rule: `rules/05-terminal-output.md` rule 5; allowlists in GLOSSARY.md and each project card.
- Status: promoted

### Literary words and metaphors in technical explanation
- Date: 2026-09-10
- Correction 2026-09-10: first version demanded child-level words for computing terms too. Corrected: plain words for non-technical vocabulary, standard field terms for computing, non-standard computing terms defined up front.
- Rule: `rules/05-terminal-output.md` rule 6, `rules/10-writing-docs.md` rule 2.
- Status: promoted

### Facts stated without saying how they are known
- Date: 2026-09-10
- Rule: `rules/40-evidence-levels.md`, review checklist item.
- Status: promoted

## 2026-09-11

### Private notation (level codes) shown in terminal output
- Date: 2026-09-11
- Symptom: every fact in terminal messages carried a tag such as "(L4: `Foo.lean` line 297)". The user had to ask what L4 and L5 mean. Complaint in the user's words: 除非明确要求，在terminal输出时不要用你本地自定义的符号来表示概念。没人能记得住那么多符号.
- Root cause: `rules/40-evidence-levels.md` § "How to write it" said to put the level code right after the fact, and no rule distinguished the code (a private notation of this rules repo) from the fact it encodes. Rule 6 of `rules/05-terminal-output.md` bans coined computing terms without definition, but the level codes were treated as exempt because they come from the rules repo itself.
- Rule: `rules/40-evidence-levels.md` § "How to write it"; `rules/05-terminal-output.md` rule 6; `glossary/GLOSSARY.md`; `workflows/review-output.md`; `README.md`.
- Status: promoted 2026-09-11
- Refinement 2026-09-11 (same complaint): youngzt chose the terminal form "(置信等级-N)" in parentheses right after the fact, N being the level number. Decision 2026-09-11: renumbered to 0 to 6, 0 is the most trusted. The old level codes are a do-not-use entry in the glossary.

### Technical terms force-translated into Chinese in terminal output
- Date: 2026-09-14
- Symptom: messages rendered standard domain terms (in-flight, issue, commit, retire) as invented Chinese translations. User: 术语性质的词汇即使中文对话也不要强行翻译.
- Root cause: `rules/00-communication.md` already says standard computing terms stay in English inside Chinese sentences; I treated translating a term as defining it and built a parallel Chinese vocabulary.
- Rule: `rules/00-communication.md` § Language (already covers it); the project card got a "keep in English" list; the paper terminology file's conversation column switched to English terms.
- Recurrence 2026-09-14 (same day): two more machine names translated. Added to the card's keep-in-English list.
- Status: open

### "忠实/诚实/faithful" used as a quality word
- Date: 2026-09-15
- Symptom: messages said "忠实转写""忠实性" for the relation between an encoding and the condition it encodes. User banned 忠实, 诚实, and faithful everywhere.
- Root cause: an evaluative adjective substituted for the concrete property; "faithful" names no checkable statement. The precise content was "the check is equivalent to the dependency condition / the behavior sets coincide".
- Rule: `glossary/GLOSSARY.md` do-not-use list (added); replacement is to state the property itself.
- Status: open

### Pronoun with two candidate referents
- Date: 2026-09-16
- Superseded: folded into "Ambiguous referring expressions" below (same root cause, per youngzt 2026-09-16).

### Ambiguous referring expressions (generalized from the 它 and 组 cases)
- Date: 2026-09-16
- Symptom: a classifier ("每组的…") could bind to either of two axes in context; earlier a pronoun ("它…时") could bind to either of two instructions.
- Root cause (corrected by youngzt same day): not any particular word. Any abstract referring expression — pronoun (它/那个), classifier (组/这种), or back-reference (之前说的) — whose candidate referents in the live context number more than one. The fix is never a word ban; it is naming the object outright.
- Correction 2026-09-16: my first fix banned the single word 组; youngzt rejected that framing. The pronoun entry of 2026-09-16 is the same root cause; treat both as instances of this entry.
- Rule: proposal for `rules/00-communication.md` § Words shown to youngzt 2026-09-16, pending acceptance. Refinement same day: the rule must cover Chinese and English expressions alike, and must be stated as the open class (any context-bound expression), with the listed words as illustrations only.
- Status: open
