---
name: proof-assistant
description: Writing or editing formal proofs in a proof assistant (Lean, Rocq, or similar) — stating specifications, proving theorems, repairing broken proofs.
---

# Proof Assistants

## Default work mode: the specification and the proof are separate artifacts

A formal proof development has two kinds of artifact, and each is handled under
its own rule.

**Human-readable specification.** The specification states what is to be
proved, in a form the user reads and approves. It has two parts: the
specification proper (the definitions and stated properties) and the final
theorem (the statement whose machine-checked proof closes the task). Treat the
whole of it as a requirements document coming from the human, held to a
stricter standard than ordinary code. The agent never edits it on its own
authority. When the agent is highly confident the specification is wrong, it
stops and asks the user to review, stating where the problem is and what shows
it. The user decides the change.

**Machine-checked proof.** The proof is an intermediate artifact whose details
are hidden from the human. The agent iterates on it autonomously until the
proof assistant accepts a path that satisfies the specification. A proof
counts as done only when it contains no `sorry` (Lean) and no `admit` (Rocq),
and relies on no axiom that implies `False`.

Author: "formal proof要严格区分human readable specification和machine checked
proof。human read spec生成模式当成是来自'人'的更严格的需求文档，应该分成
specification和final theorem两部分；ai工作的时候不能随意篡改需求 - 如果高度确认
spec写得不对，应该向用户请求复核，说明问题在哪里，而不能自行修改。machine
checked proof则不一样，应该视作向human屏蔽细节的中间过程，ai应该自行迭代找到满足
spec，而且没有sorry（lean），admit（Rocq）的路径，也没有axioms that imply False"
(English: "a formal proof strictly separates the human-readable specification
from the machine-checked proof. The human-readable specification is treated as
a stricter requirements document coming from the human, split into a
specification part and a final-theorem part; while working, the AI must not
tamper with the requirements — if it is highly confident the specification is
wrong, it asks the user to review, saying where the problem is, and does not
fix it itself. The machine-checked proof is different: it is an intermediate
process whose details are hidden from the human, and the AI iterates on its
own to find a path that satisfies the specification, with no sorry (Lean), no
admit (Rocq), and no axioms that imply False").
