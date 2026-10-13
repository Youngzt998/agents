# Workflow: start a project

Trigger: `/init-project <project-repo-remote> <design-repo-remote>`. The rule it
carries out is `rules/60-project-repos.md`.

## Steps

1. Take the project repo remote and the design repo remote from the arguments.
   Ask for whichever is missing.
2. Use the current directory as the design repo. If it is not empty, stop and
   ask.
3. Copy the template in `skills/init-project/template/` and fill in its four
   placeholders. A repo's name is the last component of its remote, without
   `.git`.

   ```bash
   cp -r ~/.agents/skills/init-project/template/. .
   grep -rlZ '__[A-Z_]*__' . | xargs -0 -r sed -i \
     -e "s|__PROJECT_NAME__|$PROJECT_NAME|g" -e "s|__PROJECT_URL__|$PROJECT_URL|g" \
     -e "s|__DESIGN_NAME__|$DESIGN_NAME|g" -e "s|__DESIGN_URL__|$DESIGN_URL|g"
   ```

4. Run `git init -b main` and `git remote add origin <design-repo-remote>`.
5. Run `bash setup/bootstrap.sh`. It clones the project repo into
   `<project-name>/` and links Claude Code's project memory to `memory/`.
6. Commit and push. If the push fails because the design repo does not exist on
   the remote yet, quote the error and give the command to run once the user has
   created it: `git push -u origin main`.

Project-specific environment steps stay a TODO in `setup/bootstrap.sh` until the
user describes them.
