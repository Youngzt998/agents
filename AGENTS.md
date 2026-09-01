# Global Agent Rules — Ziteng Yang

Personal global rules for AI coding agents, shared across machines and models
(Claude Code, Codex). This file is the **only always-resident context**, so keep
it short. Domain-specific rules belong in `skills/` and are loaded on demand.

## 0. Precedence

<!-- TODO -->

## 1. About me

<!-- TODO -->

## 2. Communication

<!-- TODO -->

## 3. General working rules

<!-- TODO -->

## 4. On-demand rules (routing table)

Before working in one of the areas below, read the corresponding file first.
Claude Code loads these automatically as skills; agents without a skill
mechanism should read them by path.

| Area | File |
|---|---|
| Writing or changing code, in any language | `~/.agents/skills/coding/SKILL.md` |
| Proof assistants | `~/.agents/skills/proof-assistant/SKILL.md` |
| Academic writing | `~/.agents/skills/paper-writing/SKILL.md` |
| Tech blog posts | `~/.agents/skills/tech-blog/SKILL.md` |
| Slides | `~/.agents/skills/slides/SKILL.md` |
