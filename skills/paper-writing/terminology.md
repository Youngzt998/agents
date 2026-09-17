# Paper terminology

Entries specific to an academic paper. The general rules in
`~/.agents/rules/30-terminology.md` apply first.

## T1. A narrow-field term gets a parenthetical, not a tutorial

A term belonging to one field is defined in a brief parenthetical at first use and
nothing more: *"a scratchpad (fast on-chip memory the program fills and empties
itself)"*. Enough to carry on reading. Reserve a full sentence, or a paragraph,
for the few terms the argument itself turns on.

Define uncommon terms paper-wide, and expect them to cluster in the evaluation.

Author: "这种单领域的术语在首次出现的时候用括号简略定义一下就行" (English: "a term
from one narrow field just needs a short parenthetical definition at first use").

## T4. One protagonist carries the examples

Every concrete part, number and worked case is one vendor's. The other vendor
appears as the corresponding concept, named once so the reader knows what maps to
what, and never as a second column of numbers.

- *"228 KB per SM on H100 and Blackwell, 164 KB on A100, 64 KB per CU on CDNA 3
  and 160 KB on CDNA 4"* → *"carved from the SM's 228 KB of capacity"*, with
  "AMD's local data share" left standing earlier in the sentence as the
  corresponding name.

Four capacities across two vendors and four generations asks the reader to hold a
table in their head to learn one idea. Breadth of coverage is claimed by the
evaluation, and the background keeps one protagonist so the reader stays oriented.

Author: "这篇文章叙事主角（也就凡是遇到举例的时候）都用nvidia GB300为主，AMD提一下
corresponding concepts即可" (English: "the narrative protagonist of this paper,
wherever an example is needed, is NVIDIA GB300; for AMD it is enough to mention
the corresponding concepts").

## T5, worked: count the objects before you name them

One section had three names for the same object in four sentences: the reduction
was a *tree*, the bits depended on the *grouping*, and the formal definition gave
a *parenthesization*.

The repair was to work out how many objects there really are and give each exactly
one name:

- a **reduction order** is the mathematical relation, which values are added
  together and in what association;
- a **reduction tree** is the data structure that records that relation;
- **equivalent trees** are two trees differing only in the order of a node's two
  children, which hold the same relation.

*Grouping* and *parenthesization* were retired because each was a second name for
an object that already had one.

Collapsing two real objects into one name is the same fault as splitting one
object across two names. The author's correction on the first attempt is the
lesson: "reduction order 和 tree 不是一个概念，order 是数学关系，tree 是数据结构。
数据结构记录数学关系" (English: "reduction order and tree are not one concept; the
order is a mathematical relation and the tree is a data structure; the data
structure records the relation").

The rule is `~/.agents/rules/30-terminology.md` T5.
