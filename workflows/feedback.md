# Workflow: record feedback

Trigger: the user says the output was wrong, unclear, or badly worded, or invokes `/feedback`.

## Step 0: route the lesson

Two rule repos may be mounted: this general repo (`~/.agents`) and an overlay repo, meaning a private rules repo whose entry file imports this one (for example an employer-internal repo). Decide where the lesson belongs before writing anything:

- The lesson holds for any project (a communication habit, a formatting rule, a word-choice rule): record it in `~/.agents/feedback/LOG.md`. Before writing, replace every private identifier in the entry — internal project names, internal paths, internal terms — with a generic description that preserves the lesson.
- The lesson only makes sense inside the overlay's projects (a project vocabulary decision, a domain rule): record it in the overlay repo's feedback log, and update the overlay's glossary or project card there.
- When in doubt, ask the user one question: "general or internal?"

The same routing applies to rule changes in step 5: general rules change in `~/.agents/rules/`, overlay rules change in the overlay repo.

## Steps

1. Restate the complaint in one sentence, in the user's words. Confirm you understood before writing anything.
2. Find the root cause. Not "I was unclear" but "I used an adjective with no referent" or "I described the theorem without checking its scope". If you cannot find one, say so.
3. Check the target log for an existing entry with the same root cause. If found, add a dated "recurrence" line under it instead of a new entry.
4. Otherwise append an entry:

```
### <short title>
- Date: YYYY-MM-DD
- Symptom: what the user saw, one or two sentences
- Root cause: why it happened
- Rule: which file/section should change, or "none yet"
- Status: open
```

5. If the root cause has appeared twice or more, propose the exact rule text to add to the routed repo's rules. Show the diff. Apply only after the user accepts.
6. If the complaint was about a word, also add a glossary entry or a "do not use" line, in the routed repo's glossary.

Do not apologize in the log. Record facts.

## A silent deletion is feedback

A correction is not always spoken. Before acting on a new instruction, diff the
working tree against the last commit. Text the user cut without mentioning it is a
rejection of what was written.

1. Find what was cut. `git diff` against the last commit, and read the removals.
2. Name the habit that produced the cut text. The cut itself is the evidence: what
   did the removed words have in common with the words the user has removed
   before?
3. Write the habit down as an entry, in this repo or in the overlay repo, by the
   routing rule above.
4. Stop producing it.

Ask about a silent cut only when the habit behind it is genuinely unclear.
Otherwise infer it and act. Recorded as `rules/00-communication.md`, section
"Editing what the user wrote".
