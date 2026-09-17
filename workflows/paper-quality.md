# Workflow: paper quality self-check

Trigger: the user asks for a quality check on a paper draft.

These checks run **only when the user asks for them**: never after an edit, never
before a section is declared final, never on your own initiative
(`~/.agents/skills/paper-writing/process.md`). Each check is a standing rule
rather than a one-off task. When it is run, it is run in full.

**How to run one.** Read the check's *Procedure*, apply it to the whole draft or
to the named files, and record the outcome in the paper's own repository: the
date, what was scanned, and every violation found with a file and line reference.
Never record "pass" for a check that was only partially applied; say what was
skipped.

Below, "the draft" is the manuscript source, "the outline" is the planning
document prose is written from, and "the glossary" is the paper's term list.

---

## Q1. No undefined uncommon terms

**Rule.** Every term the target reader may not know is defined at its first use,
and the definition matches the glossary.

**Why.** An undefined term costs the reader the sentence it appears in and often
the paragraph after it.

**Procedure.**
1. Read the draft in order, front to back. First use is a property of reading
   order, so grepping cannot do this.
2. Collect every term that is not ordinary English and not universally known to
   the target audience: jargon of this work; vocabulary common inside the field
   and not outside it; numerics vocabulary such as associativity, rounding mode,
   ulp, denormal; any identifier lifted from code or from a vendor API.
3. For each, check three things. **Defined?** A definition in plain words at or
   before first use. A term used in the abstract is either self-explanatory there
   or avoided, since the abstract is no place to define. **Consistent?** The
   wording matches the glossary, and no banned synonym appears anywhere.
   **Defined once?** A term redefined in a later section signals that the sections
   were written independently.
4. Anything missing from the glossary is itself a violation: add it there, then
   fix the prose.

**Scope.** The draft. While the paper is still an outline, the outline too, since
wording set there survives into the prose.

---

## Q2. Every citation is real, and says what we say it says

**Rule.** Every citation resolves to an entry describing a real, findable
publication, the metadata is right, and the cited work supports the sentence
citing it.

**Why.** An invented reference ends a review. So does a real paper cited for a
claim it never makes: the reviewer who knows that paper will find it, and every
other citation becomes suspect. This is the failure mode assisted drafting
produces most readily, so it is checked rather than assumed.

**Procedure.**
1. Build two lists: every cite key used in the draft, and every entry in the
   bibliography. A key with no entry is a build error; an entry no one cites is
   dead weight. Report both.
2. For each entry, verify the work exists against a source independent of your own
   notes: the DOI resolves, or the exact title plus authors is findable on the
   publisher's site, arXiv or DBLP. Record which one was used.
3. Check the metadata against that source: authors, title, venue, year. A real
   paper carrying the wrong venue or year is still a defect.
4. Check the claim. For each place the key is cited, open the cited work and
   confirm it supports *that sentence*. Record the pair: your sentence, and the
   passage in the source that carries it. A key is never cleared once and for all;
   it can be right in one place and wrong in another, so every site is checked
   separately. Watch for the two failures that look like success: the source says
   something adjacent but weaker than claimed, and the source says it about a
   different generation, vendor or configuration. Claims carrying no citation
   belong to Q6.
5. Check the note: the one-line description in the outline matches the entry, so
   the keyword key, the note and the bibliography entry stay tied together.
6. Anything unverifiable is removed, or the claim is rewritten to something the
   source does support. Never leave a citation because it looks plausible.
7. **A summarizer's "not present" is not evidence of absence.** Asking a tool
   whether a document discusses something can return a confident no while the
   document carries a whole subsection on it. Extract the text and search it
   yourself before concluding that a source says nothing about a topic.

**Scope.** The draft, the bibliography, the outline.

---

## Q3. No machine-written tells

**Rule.** The prose does not read as model-generated.

**Why.** Reviewers notice, and it costs credibility before the argument is weighed.
The tells also correlate with vagueness: removing them usually forces a real claim
into the sentence, so this check improves the content as well as the style.

**Procedure.** Read the draft and remove each of these on sight.
1. **Formulaic connectives and openers**: "Moreover", "Furthermore",
   "Additionally", "In conclusion", "It is worth noting that", "It is important to
   note that", "In this section, we will".
2. **Section openers that restate the section title**, and closing paragraphs that
   summarise what was just said instead of advancing the argument.
3. **Filler intensifiers and vague verbs**: "plays a crucial role", "significantly
   improves", "a wide range of", "various", "leverage", "utilize", "delve into",
   "robust" where it means nothing, "seamlessly", "comprehensive".
4. **Manufactured symmetry**: every list has three items, every paragraph runs the
   same length, every section has the same internal shape. Real arguments are
   uneven; a list that has three items because three felt right gets cut or
   extended.
5. **Sentences built around a negation** (`rules/10-writing-docs.md` rule 1).
   Rewrite affirmatively. Also flag em dashes used where a comma or a full stop
   would do (`rules/00-communication.md`, P19).
6. **Claims with nothing behind them**: a sentence asserting an improvement, an
   importance or a difficulty with no number, no citation and no mechanism. Attach
   one of the three, or delete the sentence.
7. **Hedging stacks**: "may potentially", "could possibly", "generally tends to".
   Say it or do not.
8. **A whole argument run through one sentence**
   (`rules/10-writing-docs.md` P16).

**Scope.** The draft, and prose in the outline, since wording set there survives
into the draft.

---

## Q4. Originality screening

**Rule.** Before a section is declared final, its claims are checked against
existing work: nothing presented as new has already been done, and the closest
prior work is cited and positioned against.

**Why.** The fastest reject is a reviewer who names the paper that already did it.
Finding that paper yourself turns a rejection into a positioning sentence.

**Procedure.**
1. For each contribution and each section-level claim, search for prior work on the
   claim itself, in the venues this paper is aimed at and in the neighbouring
   fields where the problem also lives.
2. Search in **other people's vocabulary**. The same idea will be written under
   several names; searching only for your own terms finds nothing and proves
   nothing.
3. Record every near miss: keyword key, title and a one-line description in the
   outline, the bibliography entry under the same key, and one sentence saying how
   this work differs.
4. If prior work already makes a claim, narrow yours and say so plainly. Do not
   restate a known result as new.
5. Check for text overlap as well as idea overlap: no sentence should be reusable
   verbatim from a source.

**Scope.** The contributions list, and each section as it is finalized.

---

## Q5. No unresolved markers

**Rule.** A section declared final contains no TODO, no placeholder and no
unresolved marker of any kind, and every marker still standing elsewhere names the
task that will close it.

**Why.** Two different failures share one symptom. A placeholder that prints, such
as a dummy conference block or a figure slot with no figure, reaches the reviewer.
A marker that does not print is invisible instead, and invisible unfinished work is
the kind that ships. Counting them is also the cheapest measure of how far the
draft is from done.

**Procedure.**
1. Scan for the whole marker vocabulary: `TODO`, `TBD`, `FIXME`, `XXX`, `VERIFY`,
   "fill in", "placeholder", "write here", angle-bracket slots, and the dummy
   values templates ship with (a placeholder DOI, a placeholder ISBN, a generic
   conference name, "City, Country").
2. Sort what turns up into three piles. **Prints**: anything reaching the built
   document. Blocks a section from being final. **Tracked**: a comment carrying a
   task number and saying what is missing. Allowed while a section is in draft,
   gone before it is final. **Untracked**: a marker naming no task. Create the
   task, then rewrite the marker to name it. An untracked marker is lost work, and
   is a violation even in a section nobody has called final.
3. Check the glossary alongside: a term used in a section being finalized carries
   no unresolved definition, and a term still marked unresolved appears in no
   prose.
4. Before submission, tighten to zero: no marker anywhere, the front matter
   carrying the real venue, year, DOI and ISBN, and the review and anonymity
   options decided rather than left as they were.
5. Record a count and a location list: how many markers, in which files, and how
   many are tracked.

**Scope.** The draft first, and the built document, since a marker that prints is
the worse kind. Then the outline, the glossary, the bibliography, the figures.

---

## Q6. Fact check

**Rule.** Every statement the paper makes about anything other than its own results
is checked against a source, sentence by sentence. Q2 covers claims that carry a
citation; this check covers the rest, and catches the ones that should have carried
a citation and did not.

**Why.** The paper describes hardware, compilers and systems it does not own, to an
audience that includes people who do own them. A wrong constant about someone
else's machine is the cheapest way there is to lose a reviewer. The audit is per
sentence because this class of error hides inside paragraphs that are otherwise
right: a correct mechanism carrying one wrong number reads perfectly well.

**Procedure.**
1. Go through the draft in order, one sentence at a time. Reading a paragraph for
   sense does not satisfy this check; the error being hunted survives exactly that
   kind of reading.
2. Sort each sentence into one of three piles. **Ours**: a claim about your own
   design, implementation or measurements, which Q4 and the evaluation own.
   **Outside**: anything about hardware, an instruction set, a compiler, a library,
   a vendor's documented behaviour, prior work, or any number at all.
   **Connective**: prose that asserts nothing.
3. Verify every sentence in the outside pile against a source, and record which
   source. If the fact is architecture- or version-dependent, the sentence says so.
   Flatly asserting one value where several hold is an error even when the value
   quoted is one of them.
4. Give numbers their own pass. Check the unit. Check which quantity is named,
   since neighbouring quantities differ by little and mean different things. Check
   which generation and vendor it holds for. Check whether it is a hardware
   maximum, a typical value, or a measurement; a measured number carries its
   conditions, or a citation to them.
5. A claim that cannot be sourced is cut, or rewritten into one that can. It is
   never kept because it sounds right, and never softened with a hedge to make it
   survive: a hedge over an unverified claim is still an unverified claim.
6. Record per section: how many outside sentences there were, how many were
   verified, and every one that was changed or cut, with the source that settled
   it.

**Scope.** The draft, and prose in the outline, since claims written there migrate
into the draft carrying their errors with them.

---

## Q7. Every sentence at its shortest honest length

**Rule.** Each sentence is tested against a shorter version of itself. The shorter
one wins only when it loses no information **and** is no harder to read on first
pass. Shorter alone is not the test.

**Why.** The body has a page limit, so a wasted clause is taken directly from an
argument that needed the room. Slack also hides weakness: padding is where a claim
with nothing behind it survives, because a long sentence looks busy. The
reading-ease half matters as much, since a sentence compressed until it has to be
read twice has cost the reader more than it saved.

**Procedure.**
1. One sentence at a time. Write the shorter version, then judge it on both axes:
   same content, and as easy to take in at one pass. Keep it only if both hold.
2. Hunt the ordinary slack: empty openers ("It is important to", "There is / There
   are", "What this means is"); a verb buried in a noun ("performs a comparison of"
   for "compares", "in order to" for "to", "has the ability to" for "can"); doubled
   words that say one thing ("each and every", "simple and straightforward");
   relative clauses a modifier replaces ("the kernel that has been compiled" for
   "the compiled kernel"); adverbs standing in for a measurement
   ("significantly", "considerably", "substantially", "quite"); three or more
   prepositions chained together, one of which is usually idle.
3. Test the paragraph as well as the sentence. Two sentences making one point
   become one sentence. A paragraph whose last sentence restates its first loses
   the last. A subordinate clause repeated in the next sentence becomes a pronoun.
4. Some length is load-bearing: a technical qualifier, an honest hedge, a
   restatement carrying a reader across a column break. Leave these, and record
   why, so the next run does not reopen a settled sentence.
5. Record per section: sentences examined, sentences shortened, and the word count
   before and after.

This is separate from Q3. Q3 hunts a style of writing and the tells that give it
away; Q7 assumes the writing is already good and looks for slack that survives in
good prose too.

**Scope.** The draft only. The outline is a plan, and a plan may think out loud.

---

## Q8. Citation quality

**Rule.** Every cited **paper** clears a bar: it is highly cited, or it comes from
a well-known institution or lab, or it is about a well-known model or system, or it
was peer-reviewed at a strong venue. At least one of the four. A paper clearing
none is dropped, or replaced by a stronger source for the same point.

**Why.** A reference list is a claim about the company the work keeps. One weak
entry costs more than the sentence it supports is worth: a reviewer who does not
recognise a citation checks it, and a single-author preprint with no affiliation
answering a load-bearing question invites the question of what else was taken on
trust. This is separate from whether the source is real and says what you say it
says, which is Q2. A citation can be entirely honest and still not be worth making.

**Procedure.**
1. Sort the bibliography into papers and non-papers. **This check applies only to
   papers and preprints.** Documentation, vendor guides, blog posts, standards and
   repositories are cited as primary evidence about a system, and are judged by
   whether they are authoritative for the fact drawn from them, which is Q2's
   question. Do not apply a prestige bar to a vendor's own documentation of its own
   behaviour.
2. For each paper, record which of the four it satisfies, with the evidence: the
   citation count and where it was read; the venue, and whether the paper was
   accepted there rather than merely posted as a preprint; the institution or lab;
   the model or system it concerns.
3. Weigh recency against citations rather than against the bar. A paper from this
   year or last cannot be highly cited yet, so it clears the bar on institution,
   model or venue.
4. Watch for the pattern that fails all four: a single-author preprint, no stated
   affiliation, never submitted anywhere, cited for a claim the argument leans on.
   Flag each on standing when it is found.
5. A paper that fails is dropped, or replaced by a stronger source making the same
   point. If the argument cannot survive the replacement, the argument was resting
   on the weak source, which is worth knowing before a reviewer finds it.
6. Record per entry: the four boxes, which are ticked, and the decision.

**Scope.** The bibliography, restricted to papers and preprints.

---

## Q9. Spelling and grammar

**Rule.** The paper is **American English** throughout, and its grammar is read
once, as a single whole-paper pass, immediately before submission. This check runs
at that point and at no other: not per passage, not per section, not when a section
is declared final.

**Why.** A spelling sweep during drafting is work that undoes itself, because every
later passage brings the same variants back in. Grammar has a stronger reason to
wait: agreement, tense and article errors that survive a review are the ones that
span a boundary the drafter was not looking at, so they are found by reading the
paper end to end. Holding both to the end also keeps drafting review about the
argument, which is the only thing a human reviewer can do that a later pass cannot.

**Procedure.**
1. Spelling: American forms. `behavior`, `optimization`, `realize`, `modeled`,
   `analyze`. Sweep with a grep for the Oxford forms: `-ise`, `-ised`, `-ising`,
   `-isation`, plus `behaviour`, `modelled`, `labelled`, `analyse`, `colour`,
   `centre`, `favour`.
2. Two things that look like hits and are not: the title or venue name of a cited
   work keeps its source's spelling, and a term quoted from someone else's work
   keeps that work's word.
3. Grammar, read end to end: subject-verb agreement, tense consistency within a
   paragraph, dangling participles, article use, and whether the paper takes
   *data* as a mass noun or a plural, consistently.
4. Support files in the same pass, for one reason only: the glossary is the source
   of truth for terms and the outline is the prose the draft is written from, so a
   British spelling sitting in either gets copied into the paper by the next
   drafting session. Working notes are left as they are.
5. Run it last, after the final section is written and the bibliography has stopped
   growing, so that renumbering does not reopen the pass.

**Scope.** The draft and the text inside the figures; the glossary and the outline
for the reason in step 4.

---

Further checks get appended here as they are agreed. Keep the same shape: Rule /
Why / Procedure / Scope.
