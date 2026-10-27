# __DESIGN_NAME__

Design repo for __PROJECT_NAME__ (__PROJECT_URL__). The project repo is checked
out at `__PROJECT_NAME__/` and gitignored. A paper repo, when `PAPER_URL` in
`setup/config.sh` names one, is checked out at `paper/` and gitignored as well.

## Set up a machine

```bash
git clone __DESIGN_URL__ __PROJECT_NAME__
cd __PROJECT_NAME__
bash setup/bootstrap.sh          # or /bootstrap inside Claude Code
```

The directory layout is in `CLAUDE.md`.
