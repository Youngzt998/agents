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
- Recurrence 2026-11-05: a design document's summary bullet described a public proof artifact's scope partly by what it leaves out ("the basic algorithms at two granularities, none of the optimizations of the internal versions"), and the same bullet said "no hardware or internal detail". The user had the clause removed and stated the rule in its absolute form. User: 把"none of the optimizations of the internal versions) is formally verified as of 11-05-2026" 移除。写文档永远不要讲什么没做，只讲做了什么 (English: "remove the clause ...; in documents never say what was not done, only what was done"). Root cause: a scope statement written as an exclusion, the habit rule 1 names; rule 1's limitations exception does not cover a summary bullet. Proposed: a correction entry in `rules/10-writing-docs.md` making the rule absolute for documents (pending the user's acceptance).

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

- Recurrence 2026-10-01: resource reports included internal analysis and verification details, and a table was proposed after the user requested individual colon-separated lines. The publication format must follow the latest explicit request. The user also prohibited intermediate verification hashes in documents and code comments unless the task itself requires them, such as dependency version pinning. The accepted hash rule was added to `rules/10-writing-docs.md`; the output-shape reinforcement remains a proposal.
- Recurrence 2026-10-01: dependency domains, access records, and reconstruction details were embedded in final program comments because private validation scripts consumed them. Intermediate analysis must live in a separate working file even when validation needs it; update those readers and exclude the analysis from final deliverables and review diffs. Preserve execution evidence separately. The user explicitly required the split; no additional global rule change was requested.

### Undictated TODO sections written into a user-led document
- Date: 2026-09-22
- Symptom: a user-led theory document acquired a "Storage and update points" section, two TODO sections, and a granularity section the user never asked for; the user had asked only for the loop example and its symbol annotations.
- Root cause: scaffolding habit applied to a user-led document. In a user-led document even a placeholder needs the user's instruction; open questions belong in the assistant's memory, from where they can be raised in conversation.
- Rule: `rules/50-scaffolding.md`, added same day per the user's dictated behavior.
- Status: promoted 2026-09-22

### Working-process notes written into a real design document
- Date: 2026-09-22
- Symptom: the algorithm design document carried a "Status: working draft, the assistant fills details only on instruction" line, "(new)/(proposed)/confirmed before use" markers, "deferred/TODO" process remarks, and an annotation-style paragraph about how the assistant writes thresholds. The user deleted them all and banned the habit: DO NOT PUT any WORKING NOTES / LOGS INTO ACTUAL design docs / papers.
- Root cause: recurrence of the class-(c) rule (agent-layer material in standalone documents), in a new form: process metadata (status lines, confirmation markers, collaboration protocol) rather than paths or conventions.
- Rule: `rules/10-writing-docs.md` class-(c) clause extended same day: no status lines, no draft/process markers, no confirmation tags, no notes on the collaboration protocol; working records live in the assistant's memory or the user's notes directory only.
- Status: promoted 2026-09-22

### Justifying clause appended to a stated fact
- Date: 2026-09-23
- Symptom: a setting sentence stated "n >= m holds by construction" and the assistant appended ", since p sits inside every shared level"; the user cut the since-clause silently in the working tree.
- Root cause: the habit of attaching a proof sketch to a fact the reader can check in one step. The document needed the fact; the justification had already been given in conversation and belongs there.
- Rule: covered by `rules/10-writing-docs.md` P25 (name the parameters, do not teach the arithmetic) read broadly: a one-step justification clause is the same habit as taught arithmetic. No new rule text added.
- Status: logged 2026-09-23

### LaTeX math written into terminal messages
- Date: 2026-09-23
- Symptom: terminal replies used $...$ inline math (symbols like $N_{L,e}$); the terminal renders markdown only, so the user saw raw dollar-sign source.
- Root cause: the document's formula convention (LaTeX for VS Code preview) carried over into terminal conversation, a channel whose renderer does not parse LaTeX.
- Rule: `rules/05-terminal-output.md` rule 7, added same day per the user's dictated behavior.
- Status: promoted 2026-09-23

### Explaining with material the reader has not reached
- Date: 2026-09-23
- Symptom: an abstract-notation question was answered with the document's running-example loop names; the user had not yet read the example section (their ready-to-read marker sat above it) and had already once asked for pure-prose explanation.
- Root cause: reaching for the concrete example as the default explanation device, ignoring where the reader currently is in the document.
- Rule: none yet; second occurrence gets rule text per the workflow.
- Status: open

### Proof burden treated as an algorithm-design criterion
- Date: 2026-09-23
- Symptom: a storage-scheme comparison listed "the refinement's proof obligation" as one of the two trade-off axes; the user corrected: the axes are register cost and extra computation; how the correctness proof goes is not part of algorithm design.
- Root cause: verification-project habit of weighing proof engineering in every decision; the user separates the two concerns: design first on runtime costs, prove whatever was designed.
- Rule: none yet.
- Status: open
- Recurrence 2026-10-27: one of the reasons I gave on 2026-10-25 for keeping a faster counting scheme out of a compiler iteration was that it would change the correctness proof's invariant; the author's correction of that exclusion (entry "An order's target read as a limit on methods") makes this the second occurrence, so a rule is proposed.

### "Move to the doc" read as cut when the source was a coordination draft
- Date: 2026-09-23
- Symptom: asked to move coordinated draft content into the document, the assistant copied it and then deleted it from the scratch draft; the user corrected: move meant copy-paste, the draft stays.
- Root cause: "move" taken in the file-operation sense, copy then delete; a working draft the user keeps editing is a record, and promotion into the artifact leaves it in place.
- Rule: none yet; first occurrence.
- Status: open

### New notation invented while explaining, instead of writing the thing
- Date: 2026-09-24
- Symptom: explaining one stored value, the assistant introduced angle-bracket addressing, then a fresh S_k(p) symbol; the user rejected both: write what the value is, add no symbols.
- Root cause: reaching for compact notation as the default explanation device; in a step-by-step comprehension session the phrase itself ("total child rounds at the start of parent round p") is the clearer operand.
- Rule: covered by rules/00-communication.md Words ("do not invent names during a session"); occurrence noted, symbols also count.
- Status: logged 2026-09-24

### File pointers without the owning project's name
- Date: 2026-09-25
- Symptom: replies pointed at files with bare repo-relative paths or bare filenames ("Allocator.lean:203"), while several repositories were in play; the user could not tell which project root a path hangs off, and one filename existed in two repos at once.
- Root cause: path style copied from single-repo sessions, where repo-relative is unambiguous; with multiple checkouts the root must be named.
- Rule: rules/05-terminal-output.md rule 8, added same day per the user's dictated format.
- Status: promoted 2026-09-25

### Capability gap and policy gate merged into one summary label
- Date: 2026-09-25
- Symptom: a tool's limits were summarized as "half missing capability, half deliberate withholding" without saying which piece of information each half applies to; the user had to ask whether the tool computes the full answer and drops it, or never computes it.
- Root cause: summarizing mechanism-level findings by their effect (no output) instead of by the data object each mechanism touches; the two mechanisms act on different objects (the full vector is never computed; the direction fact is computed and suppressed).
- Recurrence: 2026-09-25, same session: "never computed" itself left two rungs merged (capability absent from the codebase vs present but never invoked); the user named the family: distinctions to keep when reporting code-analysis results.
- Rule: rules/05-terminal-output.md rule 9 (ability rungs), accepted 2026-09-25.
- Status: promoted 2026-09-25

### Term glossed inline instead of defined in the Terms block
- Date: 2026-09-28
- Symptom: "golden" appeared across several messages (and in the last one only as a mid-body parenthesis); the user had to ask what it means.
- Root cause: treating an industry-common word as self-evident and glossing it inline on first use; the Terms-block rule requires every project-specific or codebase term defined at the top, never halfway through.
- Rule: covered by rules/05-terminal-output.md rules 1 and 6; occurrence noted.
- Status: logged 2026-09-28

### Coined nouns banned outright (P26)
- Date: 2026-09-28
- Symptom: repeated coinages across the project (a temporary symbol, a summary word, an industry word used as if defined); the user dictated a closed vocabulary: general computing terms, terms they asked to define, terms already in the project context; everything else is described, never named.
- Root cause: same family as the two entries above; the propose-a-name path itself was the loophole.
- Rule: rules/00-communication.md P26, added same day per the user's dictated behavior; the Words bullet's propose-a-name path removed.
- Status: promoted 2026-09-28
- Recurrence 2026-10-07: a benchmark state report used two self-made labels for configurations ("with device loop" and a word for "flat") without defining them in the Terms block; the user asked what both meant. The fix is a description: a configuration whose L0 still contains loops, and one whose loops were all unrolled by the compiler.
- Recurrence 2026-10-22: a status page grouped twenty-six measured kernels under a self-made group name built from the word the session had used for its real-machine measurement sessions; the user asked what the group was. The fix names the set by the directory it was delivered from.

### Omitted steps in dependency explanations
- Date: 2026-09-29
- Symptom: A compressed statement about replacing a cross-loop wait did not identify which instruction waits for which, so the user could not follow the explanation.
- Root cause: Collapsed a transitive ordering chain into a noun phrase, omitting the existing prerequisite that makes the replacement valid.
- Rule: none yet
- Status: open

### Replacing complete program examples with prose
- Date: 2026-09-30
- Symptom: The user requested complete simplified before-and-after loop examples after receiving operation lists and dependency arrows.
- Root cause: Treated simpler prose as a substitute for a complete program example, leaving loop nesting and the exact changed statement invisible.
- Rule: rules/00-communication.md P20 (existing requested-scope rule)
- Status: open

### Historical artifacts treated as the current project objective
- Date: 2026-09-30
- Symptom: Recommended hardware for an earlier experimental target; the user clarified that the current work must support two newer architecture generations.
- Root cause: Inferred the current objective from existing build artifacts instead of separating past experiments from the user's forward-looking requirements.
- Rule: none yet
- Status: open

### Representation conventions listed without an interpretation
- Date: 2026-09-30
- Symptom: The user asked what vector dimension order and boundary conventions mean after they were listed as artifact requirements.
- Root cause: Named the metadata without showing how one vector identifies an earlier operation instance and how the program handles boundary instances.
- Rule: none yet
- Status: open

### Markdown blockquotes around review text
- Date: 2026-10-01
- Symptom: A drafted review was wrapped in a Markdown blockquote; the user asked that future replies omit this formatting.
- Root cause: Used quotation formatting to separate text intended for copying, although the user wanted the prose directly.
- Rule: none yet; follow the user's instruction to avoid Markdown blockquotes in future replies.
- Status: open

### Generated workload size mistaken for inherent algorithmic cost
- Date: 2026-10-02
- Symptom: A small generated program contained many dependency records for the same static operation pair. The analysis had treated the resulting synchronization cost as inherent to the algorithm.
- Root cause: I assessed costs before validating and normalizing the generated workload representation. A conservative Cartesian expansion of distinct cases was conflated with irreducible dependency requirements; neither raw record counts nor the absence of exact duplicates establishes the synchronization that is actually necessary.
- Rule: none yet
- Status: open
- Refinement 2026-10-02 (same occurrence): One generator enumerated all pairs of dynamic events and retained overlapping read-after-write, write-after-read, and write-after-write conflicts, including transitively implied conflicts, without reaching-write or kill filtering. Another enumerated Cartesian products of may-alias distances. The analysis treated these unnormalized inputs as representative of intrinsic synchronization cost. A static operation pair may genuinely require multiple dependence distances. Validate and normalize the dependency relation while preserving required ordering; do not require one scalar or vector per static pair or blindly deduplicate.

### Hardware terms used in an example without definitions
- Date: 2026-10-05
- Symptom: A constructed kernel example was described with an engine abbreviation, "double buffering", and "weight tile"; the user asked what all three meant.
- Root cause: The Terms block covered only the language constructs of the example and skipped the hardware and kernel-structure words the explanation itself used, although the user had said they are new to the accelerator's hardware.
- Rule: none yet; the existing memory note on the user's background already requires defining every hardware term before use.
- Status: open

### Work report written as a dated decision log instead of the designed process
- Date: 2026-10-05
- Symptom: Asked for a maintained final work report of the work they had directed, the user received dated decision lists and state inventories per work area. They said they wanted their flowchart: the goal, then the workflow they designed, what each agent is required to do, and the product requirements, with superseded work removed and the whole kept short.
- Root cause: I read "report what I directed" as "list every directive with its date and the resulting state", so superseded decisions and progress inventories stayed in. The user's unit is the process they designed, in its current form only.
- Rule: none yet
- Status: open

### Unrequested transformation inserted into a user-defined pipeline step
- Date: 2026-10-07
- Symptom: The user had defined a benchmark route as "compile the existing kernel, disassemble, derive the dependencies". The written workflow added a step that rewrites the kernel's loops so that the output would contain nested loops, and the candidate list carried a column saying which kernels "must be rewritten". The user said the route never asked for any modification of the kernel: nested loops are present when the kernel has them and absent otherwise.
- Root cause: I inserted an input transformation to make the route's output fit the benchmark's purpose, treating the purpose as licence to change the input. A step the user defined runs on the input as given; when the input lacks the property under study, the output lacks it, and that is reported as a fact.
- Rule: none yet
- Status: open

### Proof construction mixed into a specification discussion
- Date: 2026-10-10
- Symptom: The user stated two theorems as the macro design of an executable semantics and a compiler-correctness result. My reply added how the second theorem would be proved: the witness relation's three parts, stutter steps, and the invariant tying semaphore values to counters. The user said the witness relation belongs to the proof's construction, not to the specification or the lemma design or the pass's design.
- Root cause: I treated "what must hold for the proof to go through" as part of the statement. The specification level is the statements: what the semantics computes, what the pass computes, what is asserted equal to what. How the equality is established is reasoning that belongs to the proof itself.
- Rule: In a specification or design discussion, state only the objects, the definitions and the theorem statements. Keep proof technique (witness relations, invariants, simulation diagrams, induction measures) out unless the user asks how to prove something.
- Status: open

### Workflow stage codes used in terminal messages
- Date: 2026-10-13
- Symptom: Terminal messages named the steps of a production workflow by their internal codes (S1 to S6) while the project also has a tool whose name follows the same letter-and-digit pattern; the user said the codes collide with that tool's name and asked for the concrete work each step does, with no codes of my own.
- Root cause: The stage codes live in the workflow documents, so I treated them as project vocabulary; in conversation they read as private shorthand and collide with a real product name. The existing rule against private codes covers them: a step is named by the work it does ("the compile check", "the normalization step").
- Rule: In terminal messages, name a workflow step by the work it does; never by a letter-number code, even one the workflow documents define.
- Status: open
- Recurrence: 2026-10-14. The same habit with labels of my own making: findings numbered as they were found, options lettered, helper tasks and fixes numbered, used as names in terminal messages, in a team's progress file and in a shared board. The user: "不要用finding 6 这种你自己的local数字/字母标记。沟通交流、写文本都不要" (English: "do not use local number or letter labels of your own like 'finding 6', neither in communication nor in written text"). Second occurrence; rule text proposed to the user, see `rules/05-terminal-output.md` section 6 once accepted.

### Terminal reply written in English after a Chinese message
- Date: 2026-10-13
- Symptom: The user wrote in Chinese, asking that the subagents keep a fixed model. The whole turn came back in English, both the progress lines and the final report. The user replied "terminal 沟通用中文" (English: "communicate in Chinese in the terminal").
- Root cause: The turn was the first after the user switched the main session to another model, and it followed a context summary. I wrote in the language of the summary, the tool output and the system context. I skipped the language check of the review checklist before sending.
- Rule: `rules/00-communication.md` § Language (already covers it); none new.
- Status: open

### Employer-internal details written into this repo
- Date: 2026-10-14
- Symptom: Two entries written for this log carried employer-internal details: a verbatim quote of a correction that named internal hardware generations, and an internal tool name inside a symptom sentence. The user said "你记录到rule的内容包含了company internal 信息。删除掉并且扫描是否有其它地方存在这个问题。.agents是个personal 仓库" (English: "what you recorded into the rules contains company-internal information; delete it and scan whether the problem exists elsewhere; .agents is a personal repository").
- Root cause: The convention that keeps the author's words verbatim was applied without screening the quote for internal identifiers, and an internal tool name was used in my own sentence. A lesson whose wording depends on internal terms belongs in the overlay log from the start. Same family as "Person names written into the feedback log" (2026-09-17).
- Rule: proposal, not yet accepted: `workflows/feedback.md` step 0 screens verbatim quotes like any other text, and a draft is searched for the overlay's internal identifiers before it is saved here.
- Status: open

### Autonomous run halted for "author decisions"
- Date: 2026-10-14
- Symptom: a team launched to prove the correctness theorem of an experimental compiler pass, with authorization to fix the bugs it found, stopped after listing three disagreements between the pass and its specification as decisions for the author, and the coordinator told the team to leave the final layer of the proof as a statement pending the author. The author had asked for autonomous iteration: fix the bug on whichever side has it (compiler, specification, or both), then prove.
- Root cause: each disagreement between the implementation and its specification was treated as a design decision reserved to the author, and the report-do-not-act rule was applied to a run the author had launched to run without intervention. Under a fix authorization a disagreement is a bug on one side; the design goals of each side decide which side, and the run continues.
- Rule: none yet (first occurrence). Candidate: `rules/00-communication.md` P22, name an asynchronous team run launched with a fix authorization as a no-intervention run.
- Status: open

### Background run relayed milestone by milestone into the terminal
- Date: 2026-10-14
- Symptom: after the user moved a long-running agent team to the background ("let it run by itself"), each of its milestone messages was re-checked and then reported in the terminal, three times within an hour. User: 你能不能让这个experiment proof自己跑，不要再发通知了，因为会占用terminal阅读 (English: "can you let the experiment run by itself and stop sending notifications; they take up terminal reading").
- Root cause: "background" was read as "the user stops directing it" while the coordinator kept its relay loop (verify every milestone, append to the record files, report). The user's intent was that the run produces no terminal text until its end; the team can write its own records.
- Rule: none yet. Candidate for `rules/00-communication.md` § Scope: when the user moves a run to the background, the coordinator reports once at its end or at a decision only the user can make; intermediate records are written by the team into its own files; any system event about the run gets at most one line.
- Status: open
- Recurrence 2026-10-16: with several background sub-workflows running, every hand-back of a sub-workflow (status report, integration done, commit id) was echoed into the terminal as a one-line or multi-line update, a dozen times in two hours, and a queue of pending decision topics was repeated at the end of every message. The user: progress of sub-workflows is not to be printed on its own; one daily summary, or an answer when asked. Second occurrence of the root cause (coordinator relays what reaches it instead of batching); rule text proposed to the user.
- Recurrence 2026-10-21: four tool agents handed back during one day and each hand-back ended the turn with a multi-paragraph report in the terminal, including situation-report items and a decision for the user. The user: the terminal keeps scrolling, assume the earlier messages were not read, only the latest one is read each time. Third occurrence; rule text P28 proposed with the diff and accepted by the user the same day (rules/00-communication.md, section "Messages the user reads one at a time").

### Feature of an experimental extension placed into the upstream tool's mainline mode
- Date: 2026-10-15
- Symptom: Asked how to get a new measurement out of a project's experimental extension of an upstream simulator, I proposed wiring the extension's mechanism into the upstream's own mode. The author corrected it: the extension is an independent entry point, new features belong to it, the upstream's mainline stays untouched, and merging is a later decision.
- Root cause: I located the feature at the code point that already had the needed mechanism, the upstream's mode, in place of the component the project owns, and did not apply the project's standing decision that the extension is standalone.
- Rule: none yet. Candidate for `rules/20-code-design.md`, section "Before coding": when a project keeps an extension of an upstream tool, a new feature of the extension goes through the extension's own entry point, and the upstream's modes change only when the author says to merge. Propose the text at the second occurrence.
- Status: open

### A bare "launch it" resolved to my queued item instead of the topic under discussion
- Date: 2026-10-20
- Symptom: After an exchange about a compiler feature left disabled on one hardware generation because its validation campaign had never been run, the user wrote a two-word imperative ("启动啊", English: "launch it"). I read it as the go-ahead for a different launch I had queued earlier (a benchmark production run the user had approved "once ready") and started that one. The user: "我说启动之前block v4上compiler ver2工作的事情" (English: "by 'launch' I meant the thing that was blocking the second-version compiler work on that generation").
- Root cause: a bare imperative with no object was bound to the task I was waiting to run, because that task was foremost in my own plan; the user's referent was the subject of the immediately preceding messages. The earlier "start once ready" approval needed no new trigger, which was a second sign that the imperative pointed elsewhere.
- Rule: none yet (first occurrence). Candidate for `rules/00-communication.md` § Claims or a new "Reading instructions" section: an instruction without an object refers to the topic of the preceding exchange; a task already approved under its own condition is not the referent; when two candidates remain, ask in one line before acting.
- Recurrence 2026-11-04: asked to restate "the differences between their compiler and ours that you compared earlier, granularity aside", I compared against the vendor compiler's older barrier lowering, the baseline of the project's design document, because that comparison was the one in my records. Earlier the same day the user had asked about the vendor compiler's newly merged nested-loop semaphore allocation, and that version was the referent. The user: 我问的是最新的neuron，他们已经做了新的nested loop non-blocking semaphore alloc，今天问过你的；你现在对比的是旧的barrair version的 (English: "I asked about the latest vendor compiler; they have done the new nested-loop non-blocking semaphore allocation, which I asked you about today; you compared against the old barrier version"). Second occurrence of the root cause: a reference with two candidates was bound to the item foremost in my own records, and the topic of the day's preceding exchange was the referent. Rule text proposed to the user on 2026-11-04.
- Status: open

### Decision put to the user without its premises
- Date: 2026-10-21
- Symptom: A measurement finding from a tool agent (a rewritten reference program costs 0.95 percent more simulated cycles than the compiler's original program) was put to the user as a choice between two options, in the agent's vocabulary, with the facts it rested on left in the previous message. The user: "你这个让我决策的内容没有上下文，我不知道你在说什么" (English: "the item you asked me to decide has no context, I do not know what you are talking about").
- Root cause: the "every message stands alone" rule was applied to terms only; the decision's premises (what is compared with what, which number changes, what each option changes for the user's goals) were assumed read from an earlier message, and the wording was the agent's design-note vocabulary relayed as it came.
- Rule: rules/00-communication.md P27 (section "Messages the user reads one at a time"), added 2026-10-21 with the user's acceptance.
- Status: open

### File pointers in the project-relative form after the author switched to absolute paths
- Date: 2026-10-21
- Symptom: while asking for the path of one delivered benchmark kernel, the author added that every file pointer from now on is an absolute path ("以后都给我absolute path"). Messages until then followed the author's earlier instruction, the project-name's relative/path form of rule 8.
- Root cause: none on the assistant's side; the author changed the required form. The earlier form made the author resolve the project root themselves before opening a file.
- Rule: rules/05-terminal-output.md rule 8 rewritten the same day (absolute paths for every file pointer in a terminal message; artifact path rules unchanged).
- Status: closed, rule in place

### A mathematical answer given through symbols when the author wanted words
- Date: 2026-10-22
- Symptom: Asked whether, mathematically, fine-grained synchronization beats a per-round barrier in many situations, I answered with a formula over named quantities (per-engine work per round, sums and maxima, a cost constant). The author: "你的这些符号暂时不要暴露给我，过于混乱影响思考，再用普通文字描述一次" (English: "do not expose these symbols to me for now, they are too confusing and get in the way of thinking; describe it again in plain words").
- Root cause: "mathematically" was read as a request for notation; the author wanted the mathematical argument itself, which plain sentences carry without symbols. Symbols cost the author a decoding step on every line.
- Rule: none yet (first occurrence). Candidate for `rules/05-terminal-output.md`: in a terminal message an argument is given in words first; a symbol or formula appears only when the author asks for notation, and then after the words.
- Status: open

### Parallel production run on the whole set, problems found on the whole set
- Date: 2026-10-22
- Symptom: a benchmark production workflow ran all twelve of its kernels in parallel behind a tool self-test gate; a stale call in one tool failed the gate for every kernel and the whole run (about one hour, 25 agents) was repeated; the two earlier runs of the set had the same shape (all kernels at once, problems found on all, full relaunch after the fix). The author asked whether the workflow pilots a few kernels first and ruled that it must.
- Root cause: the workflow had a tool self-test gate and no end-to-end pilot; tool edits between runs were not followed by a local run of the gate before the relaunch; parallelism was treated as free.
- Rule: rules/60-parallel-production.md (new, 2026-10-22): two members end to end, then four, doubling until the set is covered; a failing round stops the expansion until the method is fixed and the round passes.
- Status: closed, rule in place

### Author-designed page filled with unrequested prose and columns
- Date: 2026-10-22
- Symptom: A status page the user had specified as three sections of tables carried, in its compiler section, a legend paragraph, a paragraph describing the measurement and a paragraph on a regression check, a column with the measurement spread in parentheses, and two columns (outputs equal, validation) that hold by construction. The user: "compiler pass表把文字都删了。我没让你写过那么多文字。" (English: "delete all the text of the compiler pass table; I never asked you to write that much text") and "outputs equal和validation不要写，那是默认成立的事情" (English: "do not write outputs equal and validation; those hold by default").
- Root cause: I applied the terminal rule that every table needs a legend, and the report habit of stating what was measured and checked, to an artifact whose shape the user had fixed. For a page the user designed, the user's column list is the specification; a check that passes by construction (the correctness gate) is a precondition of the row's existence and gets no column; a legend goes in only when the user asks for one.
- Rule: `rules/00-communication.md` P20 already covers it; `rules/05-terminal-output.md` rule 4 (tables need a legend) applies to terminal messages and to reports the assistant shapes, and should say so.
- Status: open

### A list titled "optimization ideas" carried the baseline mechanisms as implemented ideas
- Date: 2026-10-22
- Symptom: a status page's "Current optimization idea / Implemented" list named the first compiler version's three mechanisms (its base algorithm, its grouping choices, its placement of one wait in the instruction header) beside the later versions' optimizations. The author: "这个header wait不算是optimization idea吧，算是反面的，造成performance issue的原因？你这个list要区分，不要把implemented thing和implemented thing that help optimization搞混了" (English: "the header wait is no optimization idea; it is the opposite, a cause of the performance issue; the list has to distinguish implemented things from implemented things that help optimization"), and named the first version "the naive compiler without optimization".
- Root cause: the list was filled from the version history (what each version contains) instead of from the list's own title (what improves performance). A mechanism that creates the cost the optimizations remove passed the first test and failed the second.
- Rule: none yet (first occurrence). Candidate for `rules/10-writing-docs.md`: a list's title is its membership test; every item satisfies the title's predicate, and items that give the baseline the optimizations are measured against go in a separately titled group.
- Status: open

### A no-regression gate written as a hard per-member cutoff
- Date: 2026-10-23
- Symptom: I defined the acceptance condition for a cost-model change as "no measured kernel's chosen program may be more than 1% slower than before" and rejected a change under it. The author: "这个门槛会导致一个问题，就如果几个程序满了1%，其它的快10%怎么办？你还是会拒绝。但其实这种情况我是接受甚至想要的。所以这个门槛的定义不好，但我也不确定怎么去定，这是个软门槛不是硬规则" (English: "this gate causes a problem: if a few programs get 1% slower and the others 10% faster, you would still refuse, but that case I accept and even want; so the gate's definition is bad, though I am not sure how to define it either; it is a soft threshold, not a hard rule").
- Root cause: I turned the author's "no regression against the previous version" into a per-member worst-case rule because it is mechanical to check; the author's intent is a judgement over the whole set that weighs aggregate gains against individual losses. A per-member hard rule belongs only where the project has a real hard standard (here: a chosen program is never slower than the baseline the compiler can fall back to).
- Rule: none yet (first occurrence). Candidate for `rules/20-code-design.md` or a new acceptance rule: an acceptance criterion for an optimization change reports the aggregate (geometric mean of per-member ratios), the counts of members that gain and lose beyond the noise band, and the worst loss; it adopts on the aggregate and reports the individual losses as open items; a per-member cutoff is used only for the project's own hard standard.
- Status: open

### A standing directive's unmet clauses noted in a record and never scheduled
- Date: 2026-10-23
- Symptom: the author had ruled on 2026-10-19 that the compiler pass refuses a kernel only for a hardware resource shortage. Two refusal classes outside that rule appeared in the pass's results on 2026-10-22; the record listed them as "open coverage items for later rounds" and a status page listed one of them under ideas not implemented. Every later round of the compiler team was launched for an author order or a blocking defect; nobody was ever assigned to the two classes. The author: "为什么pass 能力缺失开发还停止了？" (English: "why did development of the pass's missing capabilities stop?").
- Root cause: writing an unmet clause into a result record was treated as having scheduled it. No step compared the standing directive against the current refusal list, so the gap survived five rounds of work on other things.
- Rule: none yet (first occurrence). Candidate for a new rule on standing directives: every clause of a standing directive that the current products violate is an open work item with an owner (a running agent or a dated launch); a note in a record or a page list is not an owner; the daily summary lists the directive clauses still unmet and who holds each.
- Status: open

### Ongoing work described by its mechanism instead of its effect
- Date: 2026-10-24
- Symptom: Asked for the macro picture of the benchmark work ("屏蔽细节，说宏观情况", English: "hide the details, give the macro situation"), I described the running production job as "the twelve-member re-extraction run of one route (its run id, the new simulator build and the revised extractor and barrier generator)". The author: "是什么意思？以后我没问细节的时候，就用 "xxx路线的多少kernel制作工具有问题、制作好的kernel有问题、正在跑runtime检查"这种宏观描述" (English: "what does that mean? from now on, when I have not asked for details, use macro descriptions of the form 'route X: N kernels, the production tools have a problem / the produced kernels have a problem / the runtime check is running'").
- Root cause: I named the job by how it is built (member count, run id, tool revisions), the vocabulary of the records, instead of by what it does to the author's goal (which route, how many kernels, which of three states). The identifiers carry no information for a reader who does not open the records.
- Rule: rules/05-terminal-output.md section 10 (new, 2026-10-24): an unasked description of work gives the route, the kernel count and one of three states; identifiers, tool names and stage names stay in the records.
- Status: closed, rule in place

### A self-set retry cap stopped an autonomous proof run
- Date: 2026-10-26
- Symptom: a proof workflow the user had asked to iterate to completion stopped after a round had been repeated twice, with two obligations open, and the stop was reported to the user as the run's outcome. The user: the retry cap was never theirs; the run iterates until the proof is complete, and only three things end an attempt early: the formal specification is wrong (a stop for the user, with evidence that the specification disagrees with the actual run), the implementation has a bug (the standing fix rule), or the proof method is wrong (the run changes the method on its own, without a report).
- Root cause: I built a bounded repeat count into the workflow as a safeguard of my own and treated its exhaustion as a stop condition, although the user had named the only stop conditions. A count of failed attempts is a signal to change method, which is the run's own work.
- Rule: an autonomous run stops only on the conditions the user named; a limit the assistant adds for itself (repeat counts, iteration counts) is never a stop condition, and an attempt that fails repeatedly triggers a change of method (for a proof: an informal paper proof first, then the formal attempt along its plan). Candidate for `rules/00-communication.md` or a new autonomous-run rule once it recurs.
- Status: open
- Recurrence 2026-11-02: asked how the same proof run could finish sooner, I described its structure as rounds that repeat, a per-helper time cap of 90 minutes and a phase in which the formal attempt waits for the informal paper proof. The user: none of these were theirs. "我从来没有设置过90分钟上限，不要设置上限；我也从来没有设计过'每次循环'的'循环'，我一直都是让你一下子证明完" (English: "I never set a 90-minute cap, set no caps; I never designed the 'rounds' of a 'cycle', I always told you to prove it all at once"), and the schedule is to keep every parallel slot full with nobody waiting for anybody. Same root cause: structure the assistant added for itself (time caps, rounds, a phase order) presented as the run's shape. Second occurrence, so the rule text is proposed: "An autonomous run the user asked to complete has no cap, limit, phase order or round structure beyond what the user named; every unit of work the run can start starts at once up to the machine's parallel capacity, and an attempt that fails is re-dispatched at once with what the run has learned. A structure the assistant adds (a time cap, a repeat count, a barrier between phases) is removed when found, never reported as the run's design." Pending the user's acceptance.

### A hygiene word list designed for one artifact class applied as the author's banned words
- Date: 2026-10-27
- Symptom: in a report on the design document I listed the author's own sentence "Pending inspection on real kernel & hardware." as a hygiene finding, and my working summaries had treated "pending" as a word banned in every artifact and message (to be rewritten as "provisional"). The author: "我没有设置过禁用词pending，你应该搞错了" (English: "I never set 'pending' as a banned word; you must have got it wrong").
- Root cause: the benchmark delivery check scans delivered kernel files for eight work-in-progress marker words (TODO, FIXME, draft, pending and four others), a list I designed for that one file class. My working summary stored the list beside the login and host names the author did ban, as if the author had set the whole list for every artifact, and the scope was lost at each context compaction.
- Rule: none yet (first occurrence). Candidate: a check the assistant designs is recorded with its scope (which files) and its origin (assistant-designed); only strings the author named apply to every artifact, and the author's own wording in a document is never a hygiene finding.
- Status: open

### An order's target read as a limit on methods, and the limit attributed to the author
- Date: 2026-10-27
- Symptom: the author had ordered "first bring the compiler on hardware family A to the current state of family B, except methods that cannot be done there or were useless on B". I kept out of the iteration a counting scheme that a per-kernel search tool had found for family A alone, partly because family B's compiler did not use it, and a lead agent's log then recorded the exclusion as the author's order. When I disclosed the exclusion in an answer, the author: "我并没有做这样的要求，它们应该是各自的cost model，各自根据自己的硬件选择优化方案，而不是完全保持一致的算法" (English: "I made no such requirement; each should have its own cost model and choose its optimizations by its own hardware, not keep exactly the same algorithm").
- Root cause: I read a target (reach family B's state) as a ceiling on the methods for family A, and wrote my own exclusion into the launch instructions as part of the order's interpretation, so the agents downstream could not tell the author's order from my reading of it.
- Rule: none yet (first occurrence). Candidate: an order that sets a target sets a floor, and a method beyond it stays in scope unless the author excludes it; an exclusion the session makes is recorded as the session's decision with its reason, apart from the order's text.
- Status: open

### Explanation built from hardware names when the question was conceptual
- Date: 2026-10-28
- Symptom: Asked why a barrier sequence holds so many stops and why one unit carries so many waits before it, I answered with the accelerator's instruction names (a drain instruction, the compiler source's "leaf instruction", a carrier instruction), counters by number with their thresholds, and a Terms block defining each of them. The author: "你能不能屏蔽drain，leaf这种我词汇解释，到底是什么在等什么，用抽象宏观表达（以后我没明确要求硬件细节的时候，都用抽象表达，我根本不应该被暴露在这些多余的硬件细节/命名上）" (English: "can you hide explanations of words like drain and leaf, and say what exactly is waiting for what, in abstract, macro terms? From now on, whenever I have not explicitly asked for hardware details, use abstract expression; I should not be exposed to these superfluous hardware details and names at all").
- Root cause: the explanation was written in the vocabulary of its evidence (the instruction stream and the compiler's source), and the Terms block was used to define that vocabulary when it should have been replaced by descriptions; the question asked only what waits for what. The same request had been made on 2026-10-14 for a proof finding ("explain with every hardware detail and variable name removed") and lived only in a project memory note, so it did not reach other explanations.
- Rule: rules/05-terminal-output.md section 11 (new, 2026-10-28): without an explicit request for hardware detail, an explanation stays abstract; instruction names, counter numbers, thresholds and compiler-source words stay out.
- Status: closed, rule in place

### Shortened identifier collided with a domain term
- Date: 2026-10-28
- Symptom: a formal statement in an artifact named a parameter `prefill`, the byte a simulator writes into the output buffers before a run. The user asked why the parameter exists and said the name collides with the prefill phase of model inference, which names kernels of the same project.
- Root cause: the upstream API names the value with a qualifier (output prefill); the artifact's binder dropped the qualifier, and the bare word is a standard term of the project's domain with another meaning. New identifiers were not checked against the domain's vocabulary.
- Rule: none yet (first occurrence). Candidate: a value passed through from an upstream API keeps the upstream's full name, and every new identifier in an artifact is checked against the project's domain vocabulary before it is written.


## 2026-10-13

### Project design and project code kept in two repositories
- Date: 2026-10-13
- Symptom: after one project's design files were given their own repository, with the code checkout gitignored inside it, the user asked for this arrangement to become the mode for every personal project. User: 把这个工作模式创建为我个人的所有的项目开发一种模式，就是项目设计和项目代码本身两个git repo做分离，设计repo作为personal的文档、slides making、paper writting。启动方式为在prompt里面/init-project  然后告知项目repo和设计repo的remote链接 (English: "make this way of working the mode for all of my personal projects: project design and project code are two separate git repos, and the design repo holds personal documents, slide making and paper writing; it is started by typing /init-project and giving the remotes of the project repo and the design repo").
- Root cause: none. This records a new working pattern; nothing went wrong.
- Rule: `rules/60-project-repos.md`, carried out by `workflows/init-project.md` and `skills/init-project/`; glossary entries "design repo" and "project repo".
- Status: promoted 2026-10-13

## 2026-10-20

### Answer ordered by where the facts came from, not by what depends on them
- Date: 2026-10-20
- Symptom: one design question was answered with eight equally weighted bolded sections each carrying a per-claim evidence tag, and every later batch of delegated-search results arrived as its own full-length message. The user could not locate the load-bearing part. User: 你的输出信息量过于爆炸了，结果我抓不到重点。你按照结构重要性做个排序 (English: "your output's information volume is exploding, so I cannot catch the key point; rank it by structural importance").
- Root cause: the answer took the shape of the investigation, one section per document read and one message per delegated search that returned, so supporting detail and load-bearing decisions got equal prominence and the ranking was restated three times instead of consolidated once. A design answer is ordered by how many other decisions each item forces.
- Rule: none yet.
- Status: open

## 2026-10-26

### Instructions from a design file copied onto the artifact they describe
- Date: 2026-10-26
- Symptom: asked for an HTML slide template following the user's plain-text design file, the assistant showed the file's planning lines as gray italic notes and the user's draft bullets as slide text, and titled most slides "Slide title". The notes held content instructions, bare TODO markers, "(optional, to be decided)" and a line saying which of two talks a slide is for. User: 你理解错了，我的意思是html里面是我正式要画的slides的样子，正文应该是slides' page by page，有方框的。内容先都做成place holder，每个page的title可以加。 (English: "You misunderstood. I mean the HTML shows what my real slides will look like. The body should be the slides, page by page, framed. Make all content placeholders for now; you may add a title to each page.")
- Root cause: the assistant read `rules/50-scaffolding.md` § User-led documents literally, as "use only the user's words", and the design file was the only source of such words. The file's text is addressed to whoever builds the slides, so copying that text onto the slides put instructions where content belongs. The user wanted the slides as they will be presented: one framed page per slide, a title written from the design file, and a placeholder in every content slot.
- Rule: none yet; first occurrence.

- Status: open

## 2026-11-05

### A pause of one activity was widened to a routine task that depends on it
- Date: 2026-11-05
- Symptom: eleven days after the user paused an optimization loop "to review the results so far", the user found that the routine measurement of newly delivered benchmark members with the frozen tool version had never run, and asked "I should not have ordered a stop, should I?". The gap had been listed in every daily summary as a decision awaiting the user, which the user had not read as such.
- Root cause: the pause named the optimization loop and a search tool; the assistant read the standing order "new deliveries go to the tool at once" as part of the paused loop and suspended it as well, then carried the suspended measurement as an open decision instead of restarting it when the loop ended with a frozen version. A pause covers what it names; a routine task that merely consumes the paused activity's output resumes as soon as a fixed version exists.
- Rule: none yet (first occurrence). Candidate for `rules/00-communication.md`: an order to pause names its scope; routine tasks outside the named scope continue, and a task the assistant suspended on its own reading is restarted, not listed as the user's decision.
- Status: open


## 2026-11-05 A "comment" in a document is a margin comment, never body text

Asked to add a comment to a design document, the assistant wrote a quoted paragraph beginning "Comment:" into the body. The author: "改成边批注式；我说doc写评论都指着干" (English: "change it to the margin-annotation form; whenever I say write a comment in the doc, this is what I mean"). Rule: a comment requested for a document is an annotation attached to the passage (a Word margin comment; in a PDF rendering, a footnote at the anchor), authored under the author's own name, and the body text stays as it was.

## 2026-11-09

### A figure uses symbols it never defines
- Date: 2026-11-09
- Symptom: an explanatory two-panel figure of a compiler optimization labeled its instruction boxes with the pass's own variable names (a running iteration count, a dependence distance, a tile index, a table of per-round trip counts) and defined none of them; the legend covered only the arrows and the box fills. User: 你画的这个图里面，cnt是什么， d是什么j是什么都没有解释 (English: "in this figure you drew, what cnt is, what d is, what j is, none of it is explained").
- Root cause: the box labels were carried over from the compiler records and the chat, where the names had been explained, and the figure was treated as read together with that chat. A figure is read on its own, so every identifier in a box label is defined inside the figure, in a symbols block beside the legend. The same figure also used one letter for two things (the round index and the wait-value register).
- Rule: none yet (first occurrence). Candidate for `rules/10-writing-docs.md` rule 6: the legend box is preceded by a symbols block that defines every identifier appearing in a box label, and one letter names one thing within a figure.
- Status: open

## 2026-11-10

### A tool-level question put to the author as their decision
- Date: 2026-11-10
- Symptom: a benchmark kernel's correctness check stopped because two builds of the simulator gave outputs differing by a few 1e-3 for the same unmodified kernel. I asked the author which run the check should take as its reference, in a paragraph of tool detail (the dependence extractor's new rule, a regeneration count, the records-driven run, the two simulator builds, digest comparisons) with three options named after mechanisms. The author: "不要说那么大一段我完全不了解的细节，你的整个workflow用到的工具细节都是ai 自主决策的我一个细节都没有看过，我只管最后结果拿到没有，所以先描述清楚需要我决策的细节是否出在对想要的结果描述不清楚，不清楚的话是先说清楚哪一个抽象层级的事情，否则不应该是我要决策的事情" (English: "do not give me such a big block of details I know nothing about; every tool detail of your workflow was decided by the AI on its own and I have not seen a single one; I only care whether the final result arrived; so first describe whether the detail that needs my decision comes from an unclear description of the wanted result, and if so, first say which abstraction level is unclear; otherwise it is not something I should decide").
- Root cause: the question was framed at the level where the problem was detected (which run a check compares against) and never at the level of the result the author asked for (a delivered kernel whose outputs are correct); I did not ask myself whether the wanted result was underspecified at any level before writing. At the result level the check's reference is the executor's choice (two runs under one simulator build), and the simulators' disagreement is a situation report. Same pattern as the overlay log's entry of 2026-10-19 (implementation trade-offs put to the author) and its recurrence of 2026-10-31; third occurrence.
- Rule: proposed for rules/00-communication.md as P29 (text shown to the author 2026-11-10; applied on acceptance).
- Status: open
