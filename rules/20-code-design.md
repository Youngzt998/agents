# Code design

Goal: adding the next feature should touch one place, and a reader can predict where that place is.

## Before coding

- If the change adds a module, type, interface, or abstraction, write a design note first and get it accepted. (Procedure: `workflows/design-note.md`)
- Name the axis of change you are designing for. "We will add more instruction kinds" or "we will add more backends". Design for that axis. Do not design for axes nobody asked about.
- Look at how the codebase already solves similar problems. Follow that pattern unless you can say in one sentence why it does not fit.

## Structure

- One concept, one place. A concept defined in two files is a bug.
- Dependencies point one way: concrete depends on abstract, outer depends on inner, never in a cycle.
- Extension goes through a declared point: an interface, a registry, a data table, a pattern match with an exhaustive check. Never through copy-paste of a sibling.
- Every switch or match over a kind must be exhaustive and the compiler or checker must enforce it. If the language cannot enforce it, put all such switches in one file.
- Data that varies per case lives in a table or config, not in branching code.

## Naming

- Names come from `glossary/GLOSSARY.md`. Code, docs, and conversation use the same word for the same thing.
- Name by role, not by implementation: `Scheduler`, not `QueueThingHandler`.
- A name that needs a comment to explain it is the wrong name.

## Size and boundaries

- A function does one thing at one level of abstraction. If you need "and" to describe it, split it.
- A module has one reason to change. State that reason in its header comment.
- Public surface is small. Default to private. Expose on demand.

## Change hygiene

- Before editing any file, re-read it first: the user may have changed it since your last write. Build on their version; never overwrite their edits. Exception: the user has declared fully automatic iteration on that file.

- Do not mix a refactor with a behavior change in one commit.
- When you change an interface, update every implementor and every caller in the same change. Grep for them. List them in the commit message.
- Delete dead code you make dead. Do not leave it "for reference".

## Anti-patterns

- Adding case N by copying case N-1 and editing. Instead: find or create the extension point.
- Boolean parameters that switch behavior. Instead: two functions or a strategy object.
- Utility modules named `utils`, `helpers`, `common`, `misc`. Instead: name what the module is about.
- "Flexible" code with configuration for cases that do not exist yet.

## Self-check before delivering

Run `workflows/review-output.md`, section "Code".
