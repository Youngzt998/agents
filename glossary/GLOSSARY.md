# Glossary

Cross-project terms. Project-specific terms live in `projects/<name>.md`. An overlay repo (a private rules repo that imports this one) may add its own glossary; its entries add to this file and never override it. Every entry: term, one-line definition, optional "do not use" synonyms.

Format:

```
### Term
Definition in one or two sentences.
Do not use: synonym1, synonym2
```

Add entries via `/feedback` or by editing directly. Keep alphabetical within each section.

## Verification vocabulary

### proven / verified
A statement checked by a machine: a Lean theorem that compiles with no `sorry`, or a test that runs and passes. Say which.
Do not use: "shown", "established", "guaranteed" without a pointer to the theorem or test.

### trusted
A statement the project relies on but does not check: an axiom, an assumed model, an external library, a manually written spec. Always list trusted parts next to proven parts.
Do not use: "assumed" without saying what depends on it.

### modeled / defined
Code exists that represents the thing. Says nothing about correctness.
Do not use: "implemented" when talking about a formal model; "verified" when only a definition exists.

### unfinished / planned
Not done. Say what exists so far.
Do not use: "will", "aims to" in a description of current state without the word "planned".

### evidence level (0 to 6)
The trust rank of a fact, per `rules/40-evidence-levels.md`, written "(置信等级-N)" in terminal output. 0 machine-checked or settled standard, 1 large-scale tested, 2 small-scale tested, 3 code read, 4 doc read, 5 AI-generated text, 6 weaker.
Do not use: private level codes such as L1 to L7

## Writing vocabulary

### project card
The one approved description of a project, in `glossary/projects/<name>.md`. Four fields: purpose, what exists, what is verified, what is trusted or unfinished.

### design note
A short document written before code that adds a module or abstraction. Template in `workflows/design-note.md`.

### feedback entry
A dated record in `feedback/LOG.md`: what went wrong, why, and which rule should change. Template in `workflows/feedback.md`.

### overlay repo
A private rules repo whose entry file imports this repo and adds machine-local or employer-internal rules, glossary entries, and project cards on top.

## Abbreviations allowed everywhere

Per `rules/05-terminal-output.md` rule 5. Any abbreviation missing here and from the project card is written out in full.

| Abbreviation | Expansion |
|---|---|
| AI | artificial intelligence, used for the coding assistant itself |
| API | application programming interface |
| CLI | command-line interface |
| ISA | instruction set architecture |
| IR | intermediate representation, always with its level number when one exists |
| URL | uniform resource locator |

## Do-not-use list

Words banned in output unless followed by a concrete noun or pointer:

- systematic, extensible, robust, clean, elegant, proper, appropriate, seamless
- leverage, streamline, utilize, facilitate
- various, etc., and so on, among others
- "it is worth noting", "note that", "importantly"
- 忠实, 诚实, faithful (banned outright, 2026-09-15): state the concrete property instead, e.g. "the check is equivalent to the dependency condition", "the behavior sets coincide", "the model and the hardware agree on X"
