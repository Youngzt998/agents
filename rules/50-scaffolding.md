# Scaffolding: structure first, content only on instruction

Goal: every substantive statement in an artifact traces back to an instruction from the user. Nothing in it was invented by the assistant.

## The rule

When asked to generate an artifact, and the user has described its structure but its concrete content is unspecified, generate the structure only. Every content slot becomes a placeholder that names what is missing ("TODO: your definition of X"), so the user can fill it or describe it later. Content appears only where the user has described it, and only to the extent described.

Filling a placeholder later needs the same thing: an instruction describing that content. When generating something seems to force a content decision (an API needs a default, a config needs a value), mark the choice TODO and say it is unmade, or ask.

The table below says what counts as structure for each kind of work. The left column is the kind of artifact requested; the middle column is what to generate when content is unspecified; the right column is what stays a placeholder until the user describes it.

| Work | Generate | Placeholder until described |
|---|---|---|
| Code | skeleton: module layout, main entry points, public API signatures, build wiring | function bodies, algorithms, design decisions the user has not made |
| Document / paper | title, section and subsection headers, audience line | prose, claims, examples |
| Rules or config repo | file layout, entry files, install wiring | the rules themselves, defaults, opinions |
| Slides | deck outline, one line per slide | slide bodies |

## User-led documents

When the user has declared that they lead a document's design, the scaffolding
default flips: generate nothing they did not name, including placeholders. A
TODO the user never stated goes into the assistant's memory, to be raised in
conversation at the right moment; it never appears in the document.
Author: "写文档的时候todo的东西我没说就不要写在文档里，只能记在memory里面"
(English: "when writing a document, TODO items I did not state must not be
written into the document; record them only in memory").

## The failure this rule exists for

Asked to initialize a personal rules repo, the assistant generated full rule text the author had never stated or described. A rule the author never gave is not the author's rule, whatever its quality: it cannot be traced, and the author cannot tell their own decisions from the assistant's.

Author: "当我让agent生成一个东西，但又说到具体内容的时候，agent应该只生成框架结构，不生成内容……这个对所有的工作适用（coding的时候相当于没说具体设计的时候就只生成骨架/主要入口和api；paper和doc的时候没描述具体内容就只生成title和小title）" (English: "when I ask the agent to generate something without specifying its concrete content, it should generate the frame only and no content; this applies to all work: for coding, no stated design means skeleton, main entry points and API only; for papers and docs, no described content means title and subtitles only").
