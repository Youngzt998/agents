# Workflow: write a document

Trigger: any document longer than a paragraph: README, design doc, report, wiki page, thesis section, commit message over five lines.

## Step 1: audience line (one line, then stop and confirm)

Write: "Reader: <who>. Knows: <what>. After reading, can: <what>." Show it. Wait for confirmation.

## Step 2: outline (then stop and confirm)

- Headers as statements of content, not labels. "How the allocator picks a semaphore", not "Allocator".
- Under each header, one sentence saying what the section will claim.
- Mark where each example, table, or diagram goes.
- Mark the "Limitations" or "What is not covered" section. It is mandatory.

Show it. Wait for confirmation. Do not write prose yet.

## Step 3: terms

List every project-specific term the doc will use. Check each against `glossary/`. Unknown terms: stop and propose.

## Step 4: draft

Follow `rules/10-writing-docs.md`. Write the opening paragraph last, after the body exists.

## Step 5: self-review

Run `workflows/review-output.md` § Documents. Fix everything it catches. Then deliver with one line saying what you checked.

## Skipping steps

The user may say "skip the outline" for short docs. Never skip step 3 or step 5.
