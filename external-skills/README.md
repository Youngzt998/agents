# External skills

Useful third-party skill/plugin repos and how to enable them in Claude Code. One section per skill: repo link, install commands, trigger. Descriptions are copied from each repo's own metadata.

## i-have-adhd

- Repo: https://github.com/ayghri/i-have-adhd
- Description (theirs): shape output for a reader with ADHD: lead with the next action, number multi-step work, restate state across turns, suppress tangents, give specific time estimates, make wins visible.

```bash
claude plugin marketplace add ayghri/i-have-adhd
claude plugin install i-have-adhd@i-have-adhd
```

Trigger with `/i-have-adhd`; turn off with "stop adhd mode". Optional always-on: `touch ~/.claude/.i-have-adhd-always` (a SessionStart hook then injects the ruleset every session; delete the file to revert).

## claudish-to-english

- Repo: https://github.com/gvzdv/claudish-to-english
- Description (theirs): a display hook rewrites assistant replies into plain English; `/claudish` shows the dashboard or switches the rewrite on the fly (on, off, append, replace, style tldr|5y|caveman, language, model).

```bash
claude plugin marketplace add gvzdv/claudish-to-english
claude plugin install claudish-to-english@gvzdv-plugins
```

Trigger with `/claudish` (no argument shows the dashboard). The marketplace name it registers is `gvzdv-plugins`.
