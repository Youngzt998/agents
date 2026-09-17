# Paper prose

Entries specific to an academic paper. The general rules in
`~/.agents/rules/10-writing-docs.md` apply first.

## P13. In a survey, open on the goal, not on the approach

When several approaches are described in turn, each one opens with the problem it
set out to solve, then says who did what: *to achieve X, Y did Z*. An opener that
announces the approach itself reads as a verdict on its importance, and the reader
takes the first item listed for the main one.

- *"One line of work removes the problem from the arithmetic. Make the
  accumulator wide enough..."*
- → *"To keep a sum from depending on the order it is taken in, numerical analysts
  widened the accumulator..."*

`rules/10-writing-docs.md` P15 bounds this: once a heading has already given the
goal, the goal sentence is repetition and goes.

Author: "读者会误以为这个就是最重要的方法。用to sovle xxx，xxx干了什么什么这样的
结构" (English: "the reader will take that one for the most important method; use
the shape 'to solve X, Y did Z'").

## P17. Cite a named system at its name

When a passage is about a named work, the citation goes on the name, at its first
appearance, so the reader knows immediately what is being discussed and where it
comes from. Leaving it to the end of the passage makes the reader hold several
claims unattributed and then collect them all at once.

- → *"\textbf{DeepSeek-V4}~\cite{deepseekv4} makes a frontier training stack
  bitwise batch-invariant and deterministic end to end."*

The other placement stays valid for the other case: a citation supporting one
particular claim belongs on that claim. Name-first when the work is the subject;
claim-first when the source is evidence.

Author: "关于它的citation应该接在名字出现之后" (English: "the citation for it
should come right after the name appears").

## Keep a citation on the clause it actually supports

A source about non-associativity backs an ordering claim. It does not back the
neighbouring claims about precision, contraction or rounding, and stretching it
over them is the citation failure that reads as success. Split the sentence, or
cite each clause.

This is the paper-side half of `rules/10-writing-docs.md` P10.

## P22. Name what a thing determines, rather than what only a run has

Bits are produced by running something. A kernel, a configuration, a compiler pass
or a driver has no bits of its own, so nothing can move, hold or change *its*
bits. What such a thing has is **bit semantics**: what it determines about the
bits its runs will produce.

- *"a driver update can move the bits of a program that has not changed"*
- → *"a driver update can change the bit semantics of a program that has not
  changed"*

The construction that is always safe names the producing: *the bits they produce*,
*the same descriptor owes the same bits*, *whether they produce the same bits*.

The general form: a property that only an execution has is never attributed to the
artifact that determines it. Name the determination instead.

Author: "一个kernel本身没有bit的，只有bit semantics" (English: "a kernel has no
bits of its own, only bit semantics").

## P24. Raw measurements belong to the evaluation, footnotes included

A mechanism section explains how the thing works. The moment it cites corpus sizes
and class counts, the reader is handed evaluation material in the wrong chapter,
and a footnote does not launder it.

- A mechanism section claimed two matrix instructions are bitwise equivalent at
  fp16 and bf16 and part at fp8, and hung a footnote on it carrying 7,263
  configurations, 5,805 of one instruction and 1,458 of the other, with the class
  counts. All of it belonged to the evaluation.
- The repair kept the footnote and threw the data out of it. A footnote in a
  mechanism chapter may carry the **fact** the body has no room for, here which
  two instructions part and at which type. It may not carry the **evidence**,
  which is the evaluation's.

The test: strip a footnote to the fact. If nothing is left, the body already said
it and the footnote goes. If what is left is a corpus size, it was a table in the
wrong chapter.

**A section carries only what its own job needs.** The mechanism chapters state
how the thing works; the evaluation owns every measurement, every count and every
configuration total.

Author: "你在理论章节里冒一个实验的 raw data 干什么啊 ... 这一章又不是
evaluation，是在跟读者讲原理的部分" (English: "why put raw experimental data in a
theory chapter? this chapter is explaining the mechanism to the reader, it is not
the evaluation").

## P1 in a figure label

Say it positively, and a label has less room than a sentence, so a negation wastes
more of it.

- *"derived, not measured"* → *"offline derived"*. Half the width, and it says
  what happened.

The rule itself is `rules/05-terminal-output.md` § 3 and
`rules/10-writing-docs.md` rule 1.

Author: "以后所有的文字生成，不要使用否定表达，默认只说干了什么" (English: "in all
future text, do not use negative constructions; by default say only what was
done").
