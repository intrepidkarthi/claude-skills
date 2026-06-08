#!/usr/bin/env bash
# install-local.sh — make the write-like-me skill available on this machine.
#
# Default: installs at USER scope (~/.claude/skills/) so the skill is available
# in EVERY project on this machine — including everything under CascadeProjects.
# This is the recommended setup for your own use.
#
# Optional: --per-project also drops a PROJECT-scoped copy into each git repo
# under a target directory (default: /Users/karthikeyanng/CascadeProjects), at
# <repo>/.claude/skills/write-like-me/. Use this only if you want the skill
# committed to each repo's git history (e.g. to share it with collaborators).
# It is redundant with user scope for your own use.
#
# Usage:
#   ./install-local.sh
#   ./install-local.sh --per-project
#   ./install-local.sh --per-project --projects-root=/Users/karthikeyanng/CascadeProjects
#
set -euo pipefail

SKILL_NAME="write-like-me"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_DIR="$SCRIPT_DIR/plugins/$SKILL_NAME/skills/$SKILL_NAME"
PROJECTS_ROOT="${PROJECTS_ROOT:-/Users/karthikeyanng/CascadeProjects}"
PER_PROJECT=0

for arg in "$@"; do
  case "$arg" in
    --per-project) PER_PROJECT=1 ;;
    --projects-root=*) PROJECTS_ROOT="${arg#*=}" ;;
    -h|--help) grep '^#' "$0" | sed 's/^#\{1,\} \{0,1\}//'; exit 0 ;;
    *) echo "Unknown arg: $arg" >&2; exit 1 ;;
  esac
done

if [[ ! -f "$SRC_DIR/SKILL.md" ]]; then
  echo "ERROR: $SRC_DIR/SKILL.md not found. Run this from the repo root." >&2
  exit 1
fi

install_to() { # $1 = a .../.claude/skills directory
  mkdir -p "$1/$SKILL_NAME"
  cp "$SRC_DIR/SKILL.md" "$1/$SKILL_NAME/SKILL.md"
  echo "  installed: $1/$SKILL_NAME/SKILL.md"
}

echo "User scope (all projects on this machine):"
install_to "$HOME/.claude/skills"

if [[ "$PER_PROJECT" -eq 1 ]]; then
  echo
  echo "Per-project scope under: $PROJECTS_ROOT"
  if [[ ! -d "$PROJECTS_ROOT" ]]; then
    echo "  skipped — directory not found" >&2
  else
    found=0
    while IFS= read -r gitdir; do
      install_to "$(dirname "$gitdir")/.claude/skills"
      found=1
    done < <(find "$PROJECTS_ROOT" -maxdepth 3 -type d -name .git 2>/dev/null)
    if [[ "$found" -eq 0 ]]; then
      echo "  no git repos found; seeding immediate subdirectories instead"
      for d in "$PROJECTS_ROOT"/*/; do
        [[ -d "$d" ]] && install_to "${d%/}/.claude/skills"
      done
    fi
  fi
fi

echo
echo "Done. Open Claude Code, run /skills to confirm. Restart the session if it doesn't show."
