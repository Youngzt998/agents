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
- Recurrence 2026-09-17: the habit reappeared inside a generated file, where rule 2 was read as covering only the terminal message. Asked for a file of mock questions ordered to follow a talk, I also wrote a framing preamble, a list of the work being presented, a roster of the people involved, per-question attribution guessing who would ask, advice on how to answer, and a contingency item about an approval that was never mentioned as something to plan for. Root cause: rule 2 bans unasked content in the report, and nothing said the same holds for the artifact. Promoted into `rules/00-communication.md` P20.

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

## 2026-09-17

### Opinions volunteered without being asked
- Date: 2026-09-17
- Symptom: a work report ranked parts of the delivered file by how dangerous the author's position was, and asserted that one item left the author no choice. The user asked for neither judgment. User: 我没有显示询问的情况严禁有自己的观点，只允许执行任务 (English: "when I have not explicitly asked, you are forbidden to hold your own opinions; you are only permitted to carry out the task").
- Root cause: risk ranking and advice were treated as added value rather than as content outside the request. No rule distinguished executing a task from assessing it.
- Rule: `rules/00-communication.md` P21, placed in the first section of the first rules file at the user's instruction.
- Status: promoted 2026-09-17

### Out-of-scope findings acted on instead of reported
- Date: 2026-09-17
- Symptom: while writing a requested file, I judged an unrelated approval dependency to be a risk and wrote a planning item for it into the file. The dependency had been given as background only.
- Root cause: a finding I was confident about was treated as authorization to act on it. The correct move is a dedicated situation report and no action.
- Rule: `rules/00-communication.md` P22.
- Status: promoted 2026-09-17

### Person names written into the feedback log
- Date: 2026-09-17
- Symptom: entries drafted for this log named individuals connected to the user's work. User: feedback到.agents的过程把人名屏蔽掉 (English: "mask person names when feedback goes into .agents").
- Root cause: `workflows/feedback.md` step 0 requires private identifiers to be genericized and lists internal project names, paths, and terms. Person names were not listed, so they were kept.
- Rule: `workflows/feedback.md` step 0, person names added to the list of identifiers to replace.
- Status: promoted 2026-09-17

### AI names allowed to appear in a byline
- Date: 2026-09-17
- Symptom: commits written on the user's behalf ended with a co-authorship trailer naming the assistant model, and no rule governed whether an assistant name may appear in any byline at all. User: 任何署名不应当包含claude / codex / chatgpt等ai名字（commit message 允许最后标注co authured with claude），只加我本人 (English: "no byline should contain AI names such as Claude, Codex or ChatGPT; a commit message is allowed a co-authored-with-Claude note at the end; put only my own name").
- Root cause: the trailer came from the coding harness default and was emitted without checking the author's position on attribution. No rules file covered authorship of any artifact.
- Rule: `rules/00-communication.md` P23.
- Status: promoted 2026-09-17

### Technical terms translated into Chinese in terminal output
- Date: 2026-09-18
- Symptom: wrote "余归纳" for coinductive in a Chinese reply. Earlier instances (recorded in the internal overlay log, 2026-09-14): translated issue/commit/retire/in-flight and spec machine/impl machine into Chinese coinages.
- Root cause: treating translation as definition. The Language rule already says standard computing terms stay in English inside Chinese sentences; translations keep slipping in for terms that have common Chinese renderings in textbooks.
- Rule: `rules/00-communication.md` § Language; strengthening proposed 2026-09-18, pending acceptance.
- Status: open

### Links written into an artifact without reachability self-check
- Date: 2026-09-18
- Symptom: a related-work section shipped with 22 embedded links, three DOIs from memory tagged "re-verify on drafting" and a closing offer asking the user whether to verify. User: verify links yourself before writing; if unverifiable, leave them out; if the agent itself is likely blocked by the site, print the link in the terminal for the user to check.
- Root cause: treated link verification as a follow-up step to offer instead of a precondition for writing.
- Rule: `rules/00-communication.md` § Claims, added same day per the user's dictated behavior: every URL written into any artifact is fetched first; unreachable or unverifiable links are not written; when the failure is plausibly a bot block, the URL goes to the terminal for the user to verify instead.
- Status: promoted 2026-09-18

### Modified a file without first checking for the user's own edits
- Date: 2026-09-18
- Symptom: repeated edits to a shared working document; the user had to warn that they edit it between my writes.
- Root cause: no re-read step before writing; stale in-context copy treated as current.
- Rule: `rules/20-code-design.md` § Change hygiene, added same day per the user's dictated behavior: before every edit to a file the user also works on, re-read it (or diff against the last-seen state) and preserve their changes; skip only when the user has declared fully automatic iteration on that file.
- Status: promoted 2026-09-18

### Local file paths in a standalone human-facing document
- Date: 2026-09-18
- Symptom: a design document destined for copy-paste into docx said "see `paper/title.md`" and listed local working files as "writing sources of truth". The reader of the standalone document cannot open those paths.
- Root cause: no classification step before writing. Three document classes exist — code-adjacent docs (local paths fine), agent working notes (paths fine), standalone documents for human readers (must be self-contained) — and the text was generated without deciding which class the target belongs to.
- Rule: `rules/10-writing-docs.md`, added same day per the user's dictated behavior.
- Status: promoted 2026-09-18
- Recurrence 2026-09-18 (same day, "Local file paths in a standalone document" root cause, second form): the agent's own operating rules (byline policy, "proved" discipline, measurement metadata, banned words) were pasted into the design document body as a "Conventions" bullet. Agent-layer material — rules, evidence tags, working conventions — never belongs in a class-(c) standalone document. Rule text in 10-writing-docs.md extended accordingly.

### Reasoning residue in generated text
- Date: 2026-09-18
- Symptom: a venue list that was asked to contain only submission dates in order also carried provenance and method clauses ("confirmed on the conference site", "from the usual round-2 month; not yet announced").
- Root cause: chain-of-thought content (how a fact was obtained, how an estimate was made) leaked into the deliverable. The task defines the content; reasoning stays out.
- Rule: `rules/00-communication.md` § Claims extension, added same day per the user's dictated behavior: generated text contains exactly what the task asked for; provenance, method notes, and verification narratives stay out of artifacts (the single word "estimated", or the user's sanctioned confidence-tag format where it applies, is the ceiling). If one-shot generation cannot guarantee this, run a self-screen pass after generating and delete every clause that answers a question the user did not ask. Applies to terminal replies and documents alike.
- Status: promoted 2026-09-18

### Undictated TODO sections written into a user-led document
- Date: 2026-09-22
- Symptom: a user-led theory document acquired a "Storage and update points" section, two TODO sections, and a granularity section the user never asked for; the user had asked only for the loop example and its symbol annotations.
- Root cause: scaffolding habit applied to a user-led document. In a user-led document even a placeholder needs the user's instruction; open questions belong in the assistant's memory, from where they can be raised in conversation.
- Rule: `rules/50-scaffolding.md`, added same day per the user's dictated behavior.
- Status: promoted 2026-09-22
