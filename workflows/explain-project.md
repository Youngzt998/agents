# Workflow: explain or describe a project

Trigger: user asks what a project does, asks for a summary, README intro, status update, or the AI needs to describe the project in any output.

## If a project card exists (`glossary/projects/<name>.md`)

1. Read it.
2. Copy phrasing. Do not rephrase.
3. If the request needs more detail than the card has, read the code, then propose additions to the card before answering. Answer from the updated card.
4. If the code contradicts the card, say so first, then answer from the code, and propose the card fix.

## If no project card exists

1. Read: README, top-level module list, build file, recent git log, any theorem or test entry points.
2. Fill `glossary/projects/_template.md` as a draft. Mark every uncertain field TODO.
3. For "what is verified": open each main theorem or test. Check for `sorry`, `axiom`, `admit`, skipped tests. Do not write "proven" for anything you did not open.
4. Show the draft card. Ask the user to approve or edit.
5. Only then answer the original question, from the card.

## Verbs

Follow `rules/30-terminology.md`. "proves" needs a theorem name. "implements" means code exists. "planned" means not done.
