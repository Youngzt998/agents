#!/usr/bin/env bash
# Idempotent install: mount this repo into the global config locations that
# Claude Code and Codex read.
# Usage: bash ~/.agents/install.sh
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STAMP="$(date +%Y%m%d-%H%M%S)"
CLAUDE_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
CODEX_DIR="$HOME/.codex"

log()     { printf '  %s\n' "$*"; }
section() { printf '\n\033[1m%s\033[0m\n' "$*"; }

# link <src> <dst> -- skip if already the right symlink; back up a real file.
link() {
  local src="$1" dst="$2"
  [ -e "$src" ] || { log "skip    $src (missing)"; return 0; }
  mkdir -p "$(dirname "$dst")"
  if [ -L "$dst" ]; then
    if [ "$(readlink -f "$dst" || true)" = "$(readlink -f "$src")" ]; then
      log "ok      ${dst/#$HOME/\~}"
      return 0
    fi
    rm -f "$dst"
  elif [ -e "$dst" ]; then
    mv "$dst" "$dst.bak.$STAMP"
    log "backup  ${dst/#$HOME/\~} -> $(basename "$dst").bak.$STAMP"
  fi
  ln -s "$src" "$dst"
  log "link    ${dst/#$HOME/\~}"
}

# Symlink each entry of a directory individually, so anything the target
# directory already holds locally is left alone.
link_each() {
  local srcdir="$1" dstdir="$2" pattern="$3"
  [ -d "$srcdir" ] || return 0
  mkdir -p "$dstdir"
  local item
  for item in "$srcdir"/$pattern; do
    [ -e "$item" ] || continue
    [ "$(basename "$item")" = ".gitkeep" ] && continue
    link "$item" "$dstdir/$(basename "$item")"
  done
}

section "Claude Code  ($CLAUDE_DIR)"
link "$REPO/AGENTS.md" "$CLAUDE_DIR/CLAUDE.md"
link_each "$REPO/skills"   "$CLAUDE_DIR/skills"   '*'
link_each "$REPO/agents"   "$CLAUDE_DIR/agents"   '*.md'
link_each "$REPO/commands" "$CLAUDE_DIR/commands" '*.md'

# settings.json is merged, not symlinked: Claude Code writes back to it
# (/model, /config), which would leave the repo permanently dirty.
# Permission lists are unioned; any other key is only added when absent locally.
if command -v python3 >/dev/null 2>&1; then
  python3 - "$CLAUDE_DIR/settings.json" "$REPO/settings/claude.settings.json" <<'PY'
import json, sys, pathlib
dst, tpl = pathlib.Path(sys.argv[1]), pathlib.Path(sys.argv[2])
cur = json.loads(dst.read_text()) if dst.exists() and dst.read_text().strip() else {}
new = json.loads(tpl.read_text())
changed = False
for key, val in new.items():
    if key == "permissions":
        perms = cur.setdefault("permissions", {})
        for bucket, entries in val.items():
            have = perms.setdefault(bucket, [])
            for e in entries:
                if e not in have:
                    have.append(e); changed = True
    elif key not in cur:            # never overwrite a local value (model, theme, ...)
        cur[key] = val; changed = True
if changed:
    dst.parent.mkdir(parents=True, exist_ok=True)
    dst.write_text(json.dumps(cur, indent=2, ensure_ascii=False) + "\n")
    print("  merge   ~/.claude/settings.json")
else:
    print("  ok      ~/.claude/settings.json (nothing to merge)")
PY
else
  log "warn    python3 not found, skipping settings.json merge"
fi

section "Codex  ($CODEX_DIR)"
mkdir -p "$CODEX_DIR"
link "$REPO/AGENTS.md" "$CODEX_DIR/AGENTS.md"
link_each "$REPO/commands" "$CODEX_DIR/prompts" '*.md'
if [ ! -f "$CODEX_DIR/config.toml" ]; then
  cp "$REPO/settings/codex.config.toml" "$CODEX_DIR/config.toml"
  log "copy    ~/.codex/config.toml (from template)"
else
  log "keep    ~/.codex/config.toml exists, left untouched"
fi
command -v codex >/dev/null 2>&1 || log "note    codex not installed here; config is in place for when it is"

section "Done"
log "repo:   $REPO"
log "update: git -C $REPO pull --ff-only && bash $REPO/install.sh"
