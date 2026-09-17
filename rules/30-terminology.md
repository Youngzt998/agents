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
