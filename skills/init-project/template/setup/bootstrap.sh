#!/usr/bin/env bash
# Idempotent setup of this design repo on a new machine.
# Usage: bash setup/bootstrap.sh
#
# 1. clones the project repo into <project-name>/
# 2. runs the project-specific setup steps
# 3. links Claude Code's project memory for this directory to memory/
set -euo pipefail

DESIGN_REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
# shellcheck source=config.sh
source "$DESIGN_REPO/setup/config.sh"

log()     { printf '  %s\n' "$*"; }
section() { printf '\n\033[1m%s\033[0m\n' "$*"; }

section "Project repo ($PROJECT_NAME)"
if [ -d "$DESIGN_REPO/$PROJECT_NAME/.git" ]; then
  log "ok      $PROJECT_NAME/ already cloned"
else
  git clone "$PROJECT_URL" "$DESIGN_REPO/$PROJECT_NAME"
fi

# project_setup: the environment this project needs beyond its checkout.
project_setup() {
  # TODO: project-specific setup steps.
  log "todo    project-specific setup not configured"
}

section "Project-specific setup"
project_setup

section "Claude Code project memory"
# Claude Code keys a project's memory by its absolute path with every
# non-alphanumeric character replaced by '-'.
slug="$(printf '%s' "$DESIGN_REPO" | sed 's/[^A-Za-z0-9]/-/g')"
dst="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/projects/$slug/memory"
mkdir -p "$(dirname "$dst")"
if [ -L "$dst" ] && [ "$(readlink -f "$dst")" = "$DESIGN_REPO/memory" ]; then
  log "ok      ${dst/#$HOME/\~}"
else
  if [ -d "$dst" ] && [ ! -L "$dst" ] && [ -z "$(ls -A "$dst")" ]; then
    rmdir "$dst"
  elif [ -e "$dst" ] || [ -L "$dst" ]; then
    mv "$dst" "$dst.bak.$(date +%Y%m%d-%H%M%S)"
    log "backup  ${dst/#$HOME/\~}"
  fi
  ln -s "$DESIGN_REPO/memory" "$dst"
  log "link    ${dst/#$HOME/\~} -> memory/"
fi

section "Done"
