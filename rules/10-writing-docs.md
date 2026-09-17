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
