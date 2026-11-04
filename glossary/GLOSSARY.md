# Glossary

Writing-specific terminology. The global default for every concept is
`glossary/terminology.md`; an entry here is a subset of it, or an override that
applies while writing.

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

### design repo
A project's personal git repository: documents, slides, paper drafts and AI workflows. The project repo is checked out inside its working directory and gitignored. Rule in `rules/60-project-repos.md`.

### project repo
The git repository that holds a project's code. Locally it is checked out inside the project's design repo.

## Compiler scheduling vocabulary

### ASAP timing
The earliest start cycle of each instruction computed from dependence latencies alone, with no resource limits. Used as a timing estimate before real scheduling.

### basic block
A straight-line instruction sequence with one entry and one exit. Local scheduling works on one basic block at a time.

### functional unit
A hardware execution resource, such as a multiplier, an adder, or a load/store unit, that executes one instruction of its class per issue cycle.

### list scheduling
A greedy scheduler that keeps the ready instructions in a priority queue, repeatedly picks the highest-priority one, and places it in the earliest legal cycle on a compatible functional unit.

### register pressure
The number of values live at the same time at a program point, measured against the register count. Excess pressure forces spills to memory.

### VLIW (very long instruction word)
An architecture whose instruction word carries several operations issued in the same cycle; the compiler decides which operations run in parallel.

### megakernel
One device program that runs a whole sequence of operators (a decoder layer, several layers, or a full forward step) as a single kernel. The work of every operator is scheduled inside the program and the operators synchronize through on-device signals (semaphores, flags, or queues), so no kernel boundary drains the device between operators. The GPU form is a persistent kernel with an on-device scheduler; on Trainium the NKI form is one kernel whose engine instruction streams cover all the operators.
Do not use: "fused kernel" for the multi-operator program (fusion names the compiler transformation, the megakernel names the program).

## Assistant tooling vocabulary

### Model Context Protocol (MCP)
An open protocol by which an AI assistant discovers and calls tools exposed by a separate server process, over stdio or HTTP. Each client lists its servers in its own config (Claude Code: `mcpServers` in `~/.claude.json`). Write the term in full; "MCP" is not on the abbreviation allowlist.

### hook (Claude Code)
A command, listed under `hooks` in a Claude Code settings file, that Claude Code runs at a named point of a session (a Stop hook at the end of each assistant turn, a SubagentStop hook when a subagent finishes, a PreToolUse hook before a tool call). Claude Code reads the hook list when a session starts, so a change applies to sessions started afterwards. Hook scripts of this repo live in `hooks/` and are symlinked into `~/.claude/hooks/` by `install.sh`.

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
