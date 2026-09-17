# Paper figures

Conventions for the paper's own artwork, its captions and its table notes.

## F0. Bold a name once; italicise a list heading

The name of a work, a model or a library is bold at its **first occurrence in the
paper** and plain thereafter, so a reader meeting it can see that it is a name:
**cuBLAS**, **DeepSeek-V4**, **RepDL**, **oneMKL**.

Headings inside an `enumerate` are italic rather than bold, so they sit under the
section headings instead of competing with them.

Languages, platforms, instruction sets and intermediate representations are not
works and stay plain: CUDA, PTX, SASS, AMDGCN, TTIR.

Author: "某个工作/模型/库的名称首次出现的时候用粗体字（全文适用）；enumerte小标题
改成斜体字" (English: "bold the name of a work, model or library at its first
occurrence, paper-wide; make enumerate sub-headings italic").

## F1. Black and white first, tint only where a distinction must show

White nodes, black borders, black connecting lines heavier than a slide would use.
A light wash of colour goes on a node only where a difference has to be visible.
No default palette and no coloured outlines: identity lives in the fill.

Author: "基础图片就用黑白风格，白色节点+黑色边框+黑色连线（要比现在的更粗一点）"
(English: "keep the base figures black and white: white nodes, black borders,
black connecting lines, and thicker than they are now").

## F2. One hardware level, one colour, across the whole paper

A reader who learns thread, warp and shared memory in one figure must not have to
relearn them in the next.

## F3. Shape says kind, fill says place

A datum is a square with sharp corners; an operation is a circle. The two channels
stay orthogonal: a hardware level is never encoded in a shape, and a kind is never
encoded in an outline.

Author: "数据节点用方形（不要curved corner），运算节点用圆形" (English: "use
squares for data nodes, with no curved corners, and circles for operation nodes").

## F4. Nothing sits above a panel

A panel opens with the drawing. No title block, no standfirst, no description.
Inside it, only fragments that label parts of the drawing. Below it, one line: its
subtitle.

## F5. The caption is a title

One line naming the figure, and it is not set in bold. What each panel shows and
what follows from it is argued in the body text where the figure is referenced.

**A caption is one sentence.** The title of a figure or a table says what the
reader is looking at and stops. The sample size, how the rows are grouped, what an
outlier means, which column is the baseline: all of it goes in a note set below
the artwork or under the table body, where a reader who wants it will find it and
a reader skimming will not pay for it. A caption that runs to three or four
sentences is a note written in the wrong place.

Author: "大figure里不要放文字解释了，只留一个title；具体的解释写文章的时候再说"
(English: "stop putting explanatory text inside the big figures; leave just a
title, and give the explanation in the body when the paper is written").

## F6. A subtitle names what is drawn

A few concrete words, so a reader who sees only the subtitle knows what is in the
picture: *"Two layouts, one reduction tree"*. A rhetorical stage name such as
*"The problem"*, *"The mechanism"* or *"The payoff"* describes the shape of the
argument rather than the drawing, and reads as filler.

Author: "小图的title不要用the problem the mechanism 这种ai风格太重的方式" (English:
"do not title the small figures 'the problem', 'the mechanism' and so on; that
style reads far too much like AI").

## F7. A caveat that qualifies the drawing lives inside the figure

A count that is illustrative rather than measured is captioned in the figure, so
it cannot be separated from what it qualifies.

## Where the artwork lives

Paper artwork lives in the paper's own figures directory. Approved talk artwork is
a separate holding and is not edited from the paper; a figure that starts from a
slide is copied across and re-sized first.
