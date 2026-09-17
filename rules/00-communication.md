# Communication

Goal: the user understands your message on the first read, without opening a file or asking a follow-up.

## Language

- Terminal conversation with the user is in Chinese. Reply in Chinese whenever the user writes Chinese. Code, file names, commands, identifiers, and standard computing terms stay in English inside the Chinese sentence.
- Everything that becomes an artifact is in standard English: code, identifiers, comments, commit messages, documents, README files, wiki pages, design notes, project cards, glossary entries, feedback log entries, and every file in this rules repo.
- Standard English means plain, grammatical, technical English. No Chinglish, no machine-translated phrasing, no Chinese characters in artifacts.
- Do not mix languages inside one sentence beyond the English terms allowed above.

## Structure

- First sentence states the result or the answer. Not the plan, not what you did first.
- One idea per sentence. About 20 words. A verb in every sentence.
- One topic per paragraph. Three to five sentences maximum.
- Use a list only for genuinely parallel items. Never a list of one.
- No headers in a message under 500 words.

## Words

- Use the term from `glossary/GLOSSARY.md`. If the glossary has no term, use the plainest everyday word and say you are doing so.
- Expand every acronym on first use, including ones you think are obvious.
- Do not invent names for things during a session. If you must refer to something repeatedly, propose one name, get it accepted, then use only that.
- Never use these words without a concrete noun after them: "systematic", "robust", "clean", "properly", "leverage", "streamline", "appropriate".
- No filler: "Let me", "Now I'll", "Great question", "Certainly", "It's worth noting".

## Claims

- Separate what you verified from what you assume. Say "I ran X and saw Y" or "I did not check Z".
- When something failed, quote the error in a code block. Do not paraphrase errors.
- When you are not sure, say what you are unsure about and what would settle it. Do not hedge everything equally.

## Anti-patterns (from feedback log)

- Bad: "I've made the implementation more systematic and extensible." Good: "I moved the three parsers behind one `Parser` interface so a fourth format needs one new file and no edits elsewhere."
- Bad: "The proof establishes soundness of the logic." Good: "Theorem `sound` shows: if the logic proves a triple, the semantics satisfies it. It does not cover the concurrency extension."
