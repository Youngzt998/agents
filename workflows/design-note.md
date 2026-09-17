# Workflow: design note before code

Trigger: the change adds a module, type, interface, abstraction, or a new case to an existing family of cases.

Write this note, show it, and wait for acceptance before writing code. Keep it under 40 lines.

```
# Design note: <change in five words>

Axis of change: what kind of thing will be added next (more X). One sentence.

Existing pattern: how the codebase handles similar things today. File and line.
Follow it? yes / no, and why in one sentence.

Extension point: where a future case goes. Interface / registry / table / match.
Adding case N+1 will touch: <list of files, ideally one>.

Names: new identifiers and the glossary term each one comes from.

Boundaries: what depends on what. Arrows only one direction.

Not doing: adjacent things deliberately left out.

Test: how you will show the extension point works (add a dummy case?).
```

After acceptance, implement. In the final message, list every file touched and compare against the "will touch" line. If they differ, explain why.
