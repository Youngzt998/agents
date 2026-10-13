# kernel-tv (project card)

Status: draft. Last reviewed: not yet.

Use this card verbatim when describing the project. Do not rephrase.

## Purpose (2-3 sentences)

An SMT equivalence checker for Triton TTIR. Given two TTIR functions, it proves
them semantically equivalent or produces an input on which they differ. Its
near-term aim is to find and reproduce a real Triton compilation bug.

## What exists

- `kernel-smt` core: tensor semantics over Z3 (types, Abstract FP, byte-addressed memory, tile operations, equivalence at a witness address). `semantics/`
- MLIR builder: walks a function and dispatches each op to the core; `scf.if`, `scf.for` and `scf.while` dispatch to stubs. `builder/mlir/`
- Triton builder: handlers for 7 `tt` ops (`get_program_id`, `make_range`, `splat`, `addptr`, `load`, `store`, `reduce`); the MLIR builder adds 12 `arith` ops and `math.exp`. `builder/triton/`
- `triton-tv`: the validator binary; two positional input files and no flags; FP mode fixed to Abstract; exit 0 EQUIVALENT, 1 NOT EQUIVALENT, 2 UNKNOWN. `bin/triton-tv.cpp`
- `PrebuiltTriton.cmake`: builds the Triton backend against an already-built Triton checkout named by `TRITON_ROOT`. `cmake/`
- Unit tests: 5 Z3-only core tests (`KernelSmt*`) and 2 builder tests (`EnvTest`, `StateTest`) that need Triton. `semantics/test/`, `test/validator/`
- Validator gates and the pass-permutation bug hunt: `run_eval.py` (pairs, inequal, compile-options) and `permute_passes.py`. `eval/`
- Equivalence fuzzer driving `triton-opt`. `eq_fuzzing/`
- Kernel corpora: 636 hand-written kernels and a TorchInductor kernel generator. `benchmark/`
- Reports from a separate differential fuzzing campaign: 41 confirmed compiler bugs, 31 in Triton and 10 in TileLang. `bug-report/`
- Design documents; `doc/ttir-modeling.md` (2026-09-16) is the newest specification. `doc/`

## What is verified

- The 5 core unit tests pass at commit `67d0cc6` with Z3 5.1.0 (confidence level 2, run on 2026-10-13).
- The core has no MLIR or LLVM include and no `mlir::` symbol (confidence level 3, grep of `semantics/`).
- Validator gates: pairs 4/4, inequal 6/6, compile-options 9/9; all 259 one-, two- and three-pass TTIR permutations of `add_kernel` and of `softmax` report EQUIVALENT (confidence level 4, `CLAUDE.md` section 5, not re-run). Scope: Stage 1 kernels only.

## What is trusted or unfinished

Trusted:
- Z3, and the MLIR parser of the Triton build it links.
- The Abstract FP model: opaque bitvector values, uninterpreted operations, and five axioms (the five special constants are distinct; add, mul and max commute; neg is involutive). Associativity, NaN propagation and zero identities are withheld. Every EQUIVALENT verdict holds relative to this model.
- Pointer arguments do not alias, the kernel is race-free, and one program instance is modeled.

Unfinished:
- Control flow: `scf.if`, `scf.for` and `scf.while` reach `llvm_unreachable` (`builder/mlir/State.cpp:169,179,184`).
- An unmodeled op reaches `llvm_unreachable` (`builder/mlir/State.cpp:148`); the specification asks for exit 2 UNKNOWN.
- No handler for the Stage 1 ops `tt.broadcast` and `tt.expand_dims`, or for `tt.dot`.
- No solver timeout, FP axiom profile or loop-model flag.
- FPA encoding: the sort mapping and memory conversion exist (`semantics/Types.cpp`, `semantics/Memory.cpp`), `triton-tv` fixes the mode to Abstract (`bin/triton-tv.cpp:229-230`), and every FP operation goes through `AbstractFp`.
- Input errors exit 1, the NOT EQUIVALENT code.
- Open decisions: the loop model and the FP axiom profiles (`doc/ttir-modeling.md` section 4).
- Bug catching: the validator has caught no compiler bug yet; the mechanism study of the four TTIR-level reports (`doc/ttir-modeling.md` section 3.1) has no commits.
- Atomics are out of scope; the plan is for them to report UNSUPPORTED.

## Abbreviations allowed

| Abbreviation | Expansion |
|---|---|
| SMT | satisfiability modulo theories |
| MLIR | Multi-Level Intermediate Representation, the compiler framework Triton is built on |
| TTIR | Triton IR, the `tt` dialect level |
| TTGIR | Triton GPU IR, the `ttg` dialect level |
| FP | floating point |
| FPA | the floating-point arithmetic theory of Z3, IEEE-754 exact |
| SAT / UNSAT | satisfiable / unsatisfiable |
| GPU | graphics processing unit |

## Names

| Term | Meaning | Do not use |
|---|---|---|
| kernel-tv | The project: this repository, the `triton-tv` binary, the CMake project and its build helpers | tile-smt |
| kernel-smt | The SMT semantic model under kernel-tv: the core library, the `kernel_smt` namespace, the `kernel-smt-builder-*` layers | tile-smt |
| core | `semantics/`, the MLIR-free part of kernel-smt | |
| builder | `builder/`, the per-language mapping of ops onto the core | |
| witness address | The symbolic address at which the two final memories are compared | |
| Abstract mode | The FP encoding with opaque values and uninterpreted operations | |
| Stage 1, 2, 3a, 3b | Coverage milestones in `doc/ttir-modeling.md` section 2 | |
| M, T, V numbering | Development, testing and validation work items in `doc/roadmap.md` | |
