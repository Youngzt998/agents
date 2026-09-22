# Writing documents

Goal: a reader who knows the field but not this project can follow the document top to bottom without asking anyone.

## Rule 1: positive descriptions only

Describe what a thing is. Contrast forms are banned: "X, not Y", "X rather than Y", "X instead of Y", "X as opposed to Y", "is not a Y". The only exception is when the negation is the point of the sentence, such as a limitations section saying what the tool does not handle. Rewrite "the mapper is a table, not a switch" as "the mapper is a table".

## Rule 2: define before use; plain words outside computing

Non-technical words: the simplest everyday word. Computing words: the standard term of the field or subfield. A term is standard if practitioners of that field or subfield recognize it without explanation.

- Every computing term that is not standard in the field (project-specific, coined, or used in a codebase-specific sense) is defined in the document before its first use. Definitions go in a "Terms" section near the top or in the sentence that introduces the term, never after the term has already been used.
- Standard terms may be used without definition, but if the reader named in the audience line would not know one, define it.
- Literary words and all metaphors or analogies are banned. Say what the thing does. "The cache sits between the engine and memory and keeps recent values" is allowed. "The cache is the bridge to memory" is banned.

## Before writing

- Classify the document first, and say the class to yourself before the first sentence: (a) code-adjacent (README, module doc — repo paths allowed), (b) agent or personal working note (paths allowed), (c) standalone document for human readers (design doc, report, wiki page, anything to be pasted elsewhere). A class-(c) document is self-contained end to end: no local file paths, no references to material the reader cannot open from where they sit; inline the content or link a reachable URL instead. It also contains no agent-layer material: none of these rules, no writing conventions, no evidence-level tags, no notes about how the text was produced.

- Name the reader in one line at the top: who they are, what they already know, what they need to do after reading.
- Write the outline first. Show it to the user. Do not draft prose before the outline is accepted. (Procedure: `workflows/write-doc.md`)

## Structure

- Open with two to four sentences: what this is, why it exists, what the reader will be able to do.
- Order: problem, then approach, then details, then limitations. Never details first.
- Each section answers one question. Put that question in your head when you write the header.
- Every code block, table, or diagram has one sentence before it saying what to look at.

## Sentences

- One idea per sentence. About 20 words. Concrete subject, active verb.
- Say "X does Y" not "Y is done by X" not "the doing of Y is handled".
- No sentence may contain more than one of: parenthetical, semicolon, em-dash, nested clause. Split it.
- Define a term the first time it appears, in the same sentence or the next. Then use exactly that term. Never a synonym.

## Content

- Say what a thing is before what it is not.
- State limitations and unproven parts explicitly in their own section. Do not bury them in a footnote or a "note that".
- Prefer one worked example over three abstract sentences.
- Numbers, versions, and names go in tables, not in prose.

## Anti-patterns

- Wall of bullets with no sentences between them. Bullets are for parallel items, not for avoiding paragraphs.
- Headers that are labels ("Implementation", "Details") instead of statements of content ("How the allocator picks a semaphore").
- Restating the code in English line by line. Explain why, not what.
- Passive voice hiding who or what acts: "it is ensured that", "is handled".
- Words that sound precise but are not: "leverages", "seamlessly", "robust", "various", "etc."

## Self-check before delivering

Run `workflows/review-output.md`, section "Documents".

---

# Corrections from the author

Each entry below was written the moment a correction was given, and is kept with
the sentence that prompted it. The example is what makes the rule usable; a rule
stated without the sentence that caused it decays into a platitude. The author's
own words close each entry, with an English rendering after them.

Entries carry the code they had in their source file, so a correction can be
traced back. Codes P1 to P25 are prose, T1 to T5 terminology.

### P2. A paragraph break has to earn itself

Two breaks that buy a blank line each and nothing else become one paragraph.

### P3. Segment a long paragraph with i), ii), iii)

When one paragraph carries several parallel items, label them inline. Four
levels of a hierarchy read as i) grid, ii) block, iii) warp, iv) above the grid.

### P4. Keep an added aside short

An extra level or a side point gets the space it needs and stops there. Two
sentences is the usual size.

Author: "不要讲太多" (English: "do not say too much about it").

### P5. Every sentence at its shortest honest length

Test each sentence against a shorter version of itself. The shorter one wins
only when it loses no information and is no harder to read at one pass.

The failure mode to watch is a contrast compressed until one side of it is gone.
"How long a part is has to be recorded as a length rather than a count of parts"
carries its reason; cut the second half and "how long a part is has to be
recorded as a length" is a tautology. When a sentence stops making sense under
trimming, the cut went through the load: put the contrast back and spend the
words on making it land in one pass.

### P6. Get the outside facts right, and keep a framing consistent with itself

A vendor-specific framing is never presented as the general definition. Defining
a GPU kernel as "code written for a single thread" was wrong twice over: it is
how one language expresses a kernel, and the same section's own explainer two
paragraphs later says the programmer writes what a block does.

Author: "我感觉你对gpu kernel的解释哪里不对" (English: "something in your
explanation of a GPU kernel is off").

### P7. Mark what ended, so a fact and its qualification do not collide

When a statement still holds and a related one stopped holding, say which one
stopped, and say it in the past tense. Attach the past tense to the claim that
actually expired.

- *"The group is the unit of instruction issue... Since Volta each thread carries
  its own program counter, so a warp's threads diverge at any instruction."* The
  reader is told the group acts as one, then that its threads do not.
- → *"The warp is the unit of instruction issue... A warp used to advance in step
  as well: before Volta its 32 threads shared one program counter."*

Author: "第一句话会让读者觉得前后矛盾（应该说used to be，让读者知道某时开始 warp
内也可以diverge了）" (English: "the first sentence reads as a contradiction; say
'used to be', so the reader learns when divergence inside a warp began").

### P8. Write it once, to length

Know the page budget before writing, and write prose that already fits. Drafting
long and cutting afterwards produces text that reads like it was cut: the
argument keeps the shape it had at twice the length, and the trimming shows. A
passage that arrives over budget is rewritten before it is shown.

Author: "现在不用以前那个一下子都写，再做删减的写作模式了；我们争取一遍过"
(English: "drop the old mode of writing it all out and then trimming; aim to get
it right in one pass").

### P9. Open on the subject, not on the approach to it

The first words of a section name what it is about. The illustration follows,
once the reader knows what it illustrates.

- *"A large language model asked the same question twice, with the same weights
  and the same seed, can answer differently."*
- → *"Numerical determinism is now a requirement of the systems that train and
  serve large models: the same computation, the same bits, whenever and wherever
  it runs. The last clause is where it fails."*

Author: "不要这么循序渐进，开头第一个词组就应该是数值的determinism" (English: "do
not ease in like that; the very first phrase should be numerical determinism").

### P10. A dominant cause is not the only cause

When one factor dominates, say that it dominates and name what sits beside it.
Prose that identifies a single cause reads as a claim that there is only one, and
a reader who knows a second will stop trusting the first.

- *"Chase any of these downward and the trail ends in the same place: a choice
  about the order of a floating-point sum."*
- → *"Which values are added together, and in what grouping, dominates; the
  precision the partial sums are held at, whether a multiply and an add were
  contracted, and where the rounding falls all move the result as well."*

Author: "fp order只是dominant 因素" (English: "floating-point order is only the
dominant factor").

### P11. Do not promote an aspiration into an established fact

If something is wanted and not yet had, say it is wanted. Calling it a
requirement claims an industry has settled on it, which a reader who works in
that industry will know is untrue.

- *"Numerical determinism is now a requirement of the systems that train and
  serve large models."*
- → *"Numerical determinism would be worth a great deal to the systems that train
  and serve large models... The other half is hard enough that these systems do
  without it."*

Author: "不是requirement，你就说他特别重要就好（因为不好实现，现在还并不是真的
requirement）" (English: "it is not a requirement; say it matters a great deal,
because it is hard to achieve and so is not actually a requirement yet").

### P14. Make the finding the subject, not the company

A sentence about prior work opens on what was found or built. The citation
already carries the attribution, and a company as grammatical subject reads as an
endorsement or a slight depending on the reader.

- *"Thinking Machines Lab traced nondeterministic LLM inference to kernels whose
  reduction order moves with batch size."*
- → *"Nondeterministic LLM inference has been traced to kernels whose reduction
  order moves with batch size."*

A system's or a model's own name is different: naming the artifact under
discussion, or a product being measured against, is the subject itself.

Author: "第一句话主语不要用thinking machine lab，换成比较中立的表述方式（不包含
公司名字）" (English: "do not make that company the subject of the first
sentence; use a neutral phrasing with no company name in it").

### P15. No summarising sentence at the head of a paragraph

Start on the first real point. A topic sentence that restates the paragraph's own
heading, or previews what the following sentence says anyway, spends a line and
delivers nothing. Write one only when asked.

The rule covers a recap of the preceding paragraphs as well. A list of items
followed by the thing that formalises them needs no sentence in between saying
the items had something in common.

This bounds P9 rather than contradicting it. Opening on the goal is right while
the goal is something the reader does not yet have. Once a heading has given it,
the goal sentence is the repetition this rule cuts.

Author: "为了精简长度，默认不在段落开头用重复信息的总结句，除非我真的想要"
(English: "to keep the length down, do not open a paragraph with a summarising
sentence that repeats information, unless I actually ask for one").

### P16. Do not run a whole argument through one sentence

A sentence that gives an instruction, drops a parenthesis of detail into the
middle of it, and then chains three consequences with *and ... so ... and* is
machine cadence. Everything is technically there and nothing is paced.

- *"Accumulate fp64 values into a fixed-point register wide enough to hold every
  magnitude they can take, 2098 bits for a sum and 4288 for a dot product, and
  every addition is exact, so rounding happens once, at the end, and the order
  before it cannot matter."*

The tell is the shape rather than the length: one clause of setup, one of
interrupted detail, then consequence upon consequence to a closing abstraction.
Put the mechanism in one sentence and the consequence in the next.

Author: "这样的句式是标准的ai句式，需要改得通人性" (English: "that sentence shape
is the standard AI one; rewrite it so it reads as a person wrote it").

### P18. Never pass on a source's vague adjective

"Negligible", "minimal", "competitive", "significant" carry no information, and
repeating one from a source launders it into your own voice. Give the number the
source gives. Where the source gives none, say the concrete thing it does say: a
comparison against a named baseline, a condition, a bound. Record that no number
exists, so the next writer does not invent one.

- *"The overhead is reported as negligible."*
- → *"Their matrix multiplication is reported to match or surpass standard
  split-K in most major scenarios."*

Author: "不要随便使用这种模糊的形容词，用文中具体的数字" (English: "do not reach
for vague adjectives like that; use the concrete numbers from the source").

### P20. Every pronoun needs one obvious referent

A pronoun is shorthand only when the reader can resolve it without stopping. Two
candidate nouns in the preceding clause, or an actor who was never named, and it
costs more than the noun would have.

- *"...and it runs only at small batch sizes, so it too ties the grouping to the
  batch. They drop it wherever they can."* Three pronouns, none anchored.
- → *"A kernel takes that path only at small batch sizes, so the grouping of the
  sum again depends on the batch, and split-K is dropped from every kernel that
  can do without it."*

Naming the actor is usually the wrong repair. Recast so the sentence does not
need one.

The same applies to an abstract noun standing in for a relation whose operands
are never given. *"Both choices avoid a comparison that cannot be made"* leaves
the reader to supply what is compared with what.

Author: "it, they 是什么都是迷惑的" (English: "what 'it' and 'they' refer to is
confusing").

### P21. Describe a replacement problem-first

"X gives way to Y", "X yields to Y", "X is replaced by Y" all put the discarded
thing in subject position, where a reader meets it first and takes it for what is
being done. Say what went wrong, then what replaced it. Giving the reason is half
the repair: a sentence that names the fault before the fix cannot be misread as
endorsing the fault.

- *"Atomic accumulation in the backward pass gives way to one buffer per
  streaming multiprocessor and a single deterministic summation over them."*
- → *"Atomic adds complete in whatever order the threads reach them, so the
  backward pass stops accumulating gradients that way: each streaming
  multiprocessor gets its own buffer, and those buffers are summed in a fixed
  order."*

Author: "怎么感觉好像在说他们用了atomic accumulation？？？" (English: "why does
this read as though they use atomic accumulation???").

### P22b. The working conversation's vocabulary is not the artifact's

Words used in chat to talk about the work, such as short, elegant, clean, clever,
simple, belong to the conversation. The artifact states the mechanism and the
evidence, and leaves its own shape unappraised. A sentence built on one of those
words imports a judgement made in passing and puts it where a claim belongs.

Author: "我说short只是我在这里跟你说的，不要随便往文章里面写" (English: "I said
'short' to you here in conversation; do not carry it into the document").

### P23. A sentence ends when its information is delivered

A finished statement gets no trailing clause. The shape that keeps appearing is a
fact, then ", and not X" or ", and no Y".

- *"...down to the ceiling of log2 n for a balanced tree, **and no tree of fan-in
  two reaches lower**"* → the sentence ends at "balanced tree". The tail restates
  a bound every reader already has.
- *"That narrows a shape to a family cheaply **and says nothing about
  arithmetic**."* → the sentence ends at "cheaply". What the instrument does
  answer is the next sentence's subject.

**The construction is banned rather than discouraged.** No sentence ends in "and
not X", "and never Y", "and no Z", "and says nothing about W". A comma is no part
of the pattern: a tail welded straight on is the same habit.

The tail is reliably one of four things: a truism, an implementation detail no
claim rests on, something said in the working conversation, or a point unrelated
to the sentence it hangs off. Where a denial carries the argument, it gets its
own sentence, where it has to stand up on its own.

Author: "你的写作长期喜欢先陈述一件事情，然后莫名其妙地接一句 '，and not xxx /
never do xxx' ... 正常情况都请只正面传达需要陈述的信息"; and later "以后我们直接
禁止这种句式，如果确实要否认什么东西（而且和写作逻辑本身有关），应当单独成句";
and on the third occurrence "不一定要有逗号才算" (English: "your writing keeps
stating something and then tacking on 'and not X / never do X'; state what has to
be said, positively"; "from now on that construction is banned outright, and a
denial that the argument genuinely needs gets its own sentence"; "it counts even
without the comma").

### P25. Name the parameters; do not teach the arithmetic

Say what decides the thing and stop. The reader can do the division.

- *"A cut records the length of a part rather than the number of parts. A count
  leaves the cut points undetermined as soon as the axis does not divide evenly
  by it, and a library configured for four parts may perform three."*
- → *"Two things decide the grouping: how many parts the axis is cut into, and
  where the cuts fall. We record the part length as span, from which the count
  follows, and the assignment as layout."*

The first version spends two sentences proving that a count does not determine a
partition, which every reader worked out before finishing the clause.

Author: "读者不是弱智，基本的小学数学是懂的，不需要解释这种级别的事情" (English:
"the reader is not stupid and knows primary-school arithmetic; there is no need
to explain at that level").
