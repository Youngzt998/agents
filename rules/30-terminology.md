# Terminology and project descriptions

Goal: the same thing is called the same name everywhere: chat, docs, code, commit messages.

## The glossary is the only source

- `glossary/GLOSSARY.md` defines cross-project terms. `glossary/projects/<name>.md` is the project card: the one approved description of each project.
- When you describe a project, its components, or its results, copy phrasing from the project card. Do not rephrase, summarize creatively, or "improve" it.
- When you need a term the glossary lacks: stop, propose the term and a one-line definition, and ask the user to accept it. After acceptance, add it to the glossary in the same task.
- Never use two words for one thing in one document. If the glossary has one term, the synonym is wrong.

## Describing what a project does and does not do

- Use the four fields from the project card: purpose, what exists, what is verified, what is trusted or unfinished. Keep them separate. Mixing "what exists" and "what is verified" is the most common error.
- "Proves", "verifies", "shows" mean a machine-checked or tested fact. "Implements", "models", "defines" mean code exists. "Intends", "aims", "will" mean it is not done. Pick the right verb.
- State scope: "for programs without X", "for the fragment covered by Y". A claim without scope is wrong by default.

## Keeping the glossary alive

- When the user corrects a word choice, add the correction to the glossary as a "do not use" entry with the correct term.
- When a project card goes stale (you find code that contradicts it), say so and propose the edit. Do not silently describe the code differently.

## Corrections from the author

**T2. Never define a word with itself.** A glossary that defines shared memory as
"an SM scratchpad" tells a reader who lacks the word nothing at all. The
definition uses words the reader already has.

**T3. One concept, several vendor names: pick one and say so in a parenthesis.**
Name the alternatives once, commit to one, and tell the reader you have
committed, so the other names do not reappear unexplained.

- → *"threads are cut into fixed groups (**warp** from here on): a warp of 32
  threads on NVIDIA, a wavefront of 64 on AMD's CDNA accelerators..."*

Keeping a neutral umbrella word in circulation alongside the chosen one makes the
reader carry two vocabularies. An earlier draft alternated between "group" and
"warp" for the same thing.

Author: "我们不要一直用group这个词，而是在group后写括号标注'之后都用warp来指代'"
(English: "stop using the word 'group' throughout; put a parenthesis after it
saying that 'warp' is the word from here on").

**T5. One concept, one name.** Already stated above under "The glossary is the
only source": one thing gets one name and keeps it. Do not stack synonyms in
apposition or in a gloss. Where the field itself has more than one name, pick the
one most common in the literature the work sits in, use that everywhere, and
spend at most one sentence bridging to the other name. A distinction the document
never uses is no reason for a second name: state it once as a property of the
thing already named. The worked example is in
`skills/paper-writing/terminology.md`.

Author: "对一个概念的时候应该只用一个名字，避免名称堆叠，除非领域本身就有多种说法
（即使这样，写作应该选用一个最常用的）" (English: "use one name per concept and
avoid stacking names, unless the field itself has several, and even then pick the
most common one").
