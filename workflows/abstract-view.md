# Workflow: abstract view

Trigger: the user asks for a description with details and variable names hidden, or invokes /abstract-view.

Goal: the reader learns what kind of object the thing is and how it is built, entirely in vocabulary a person outside this codebase already knows.

## Hard bans in the output

- No identifiers of any kind: no function, type, variable, field, or constructor names, no file paths, no directory names, no code blocks quoting the source.
- No project-coined words. If a coined word is unavoidable, translate it once into the standard term and use the standard term after that.
- No line numbers. Evidence levels still apply, but cite them as "read the definition / its docs", not as paths, unless the user asks where.

## What to say, in this order

1. **Kind of object**: what mathematical or engineering species this is (a small-step operational semantics, a register allocator, an event-graph memory model, a lattice-based analysis, ...).
2. **Formalism and style**: which standard presentation it uses and any notable style choice, named by its literature name (free monad, interaction tree, CPS, SSA, axiomatic vs operational, deep vs shallow embedding).
3. **Shape of the state or data**: layers and components in generic hardware or PL terms (shared memory, per-core scratchpad, in-order front end, in-flight queue, counter bank), with the quantities that parametrize them.
4. **Dynamics**: what one step is, where nondeterminism lives, how it is resolved, what counts as an error.
5. **Position**: what role it plays in the larger system and which standard alternatives it stands against (reference interpreter vs performance model, declarative vs executable spec).

## Calibration

- Standard terms from architecture and PL may be used freely at the level of a graduate reader; anything narrower gets one defining clause.
- Prefer "a counter shared by all engines" over any project word for it; prefer quantities ("five heterogeneous engines", "two in-flight queues") over names.
- Keep it under 400 words unless the user asks for depth. Tables only if genuinely parallel.
- End with one line stating what was deliberately hidden ("names, file layout, per-generation variations") so the reader knows where detail resumes.
