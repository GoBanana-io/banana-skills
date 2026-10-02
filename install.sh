#!/usr/bin/env bash
# Unified installer for banana-skills.
# Symlinks skills into each tool's global skills dir. Idempotent.
#
#   ./install.sh --all-tools
#   ./install.sh --skill funky-design --tools claude,muse
#   ./install.sh --list
#   ./install.sh --update   (git pull this repo)
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$REPO_ROOT/skills"

CLAUDE_DIR="$HOME/.claude/skills"
MUSE_DIR="$HOME/.config/muse/skills"
GEMINI_DIR="$HOME/.gemini/config/skills"

usage() {
  cat <<'EOF'
Usage: install.sh [--skill NAME|all] [--tools LIST|--all-tools] [--list] [--update] [-h]

  --skill NAME   install one skill (default: all)
  --tools LIST   comma-separated: claude,muse,gemini (default: all three)
  --all-tools    shorthand for all three tools
  --list         list available skills and exit
  --update       git pull this repo and exit
  -h, --help     this help
EOF
}

list_skills() {
  for d in "$SKILLS_DIR"/*/; do
    [ -f "$d/SKILL.md" ] || continue
    basename "$d"
  done | sort
}

link_skill() {
  local skill="$1" dest_base="$2" tool="$3"
  local src="$SKILLS_DIR/$skill" dest="$dest_base/$skill"
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    echo "SKIP $tool/$skill: $dest exists and is not a symlink (left untouched)"
    return 0
  fi
  mkdir -p "$dest_base"
  ln -sfn "$src" "$dest"
  echo "OK   $tool/$skill -> $dest"
}

cursor_snippet() {
  local skill="$1"
  echo "--- Cursor: save as .cursor/rules/$skill.mdc in your project ---"
  echo '---'
  echo "description: Apply the $skill skill"
  echo 'globs: **/*'
  echo '---'
  echo "Load and follow the skill at $SKILLS_DIR/$skill/SKILL.md."
}

SKILL="all"
TOOLS="claude,muse,gemini"

while [ $# -gt 0 ]; do
  case "$1" in
    --skill) SKILL="${2:?--skill needs a value}"; shift 2 ;;
    --tools) TOOLS="${2:?--tools needs a value}"; shift 2 ;;
    --all-tools) TOOLS="claude,muse,gemini"; shift ;;
    --list) list_skills; exit 0 ;;
    --update) git -C "$REPO_ROOT" pull --ff-only; exit 0 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown flag: $1" >&2; usage >&2; exit 1 ;;
  esac
done

SKILLS=()
if [ "$SKILL" = "all" ]; then
  while IFS= read -r s; do
    [ -n "$s" ] && SKILLS+=("$s")
  done < <(list_skills)
else
  if [ ! -f "$SKILLS_DIR/$SKILL/SKILL.md" ]; then
    echo "Unknown skill: $SKILL" >&2; list_skills >&2; exit 1
  fi
  SKILLS=("$SKILL")
fi

if [ "${#SKILLS[@]}" -eq 0 ]; then
  echo "No skills found in $SKILLS_DIR" >&2; exit 1
fi

IFS=',' read -ra TOOL_LIST <<< "$TOOLS"
for skill in "${SKILLS[@]}"; do
  for tool in "${TOOL_LIST[@]}"; do
    case "$tool" in
      claude) link_skill "$skill" "$CLAUDE_DIR" "claude" ;;
      muse) link_skill "$skill" "$MUSE_DIR" "muse" ;;
      gemini) link_skill "$skill" "$GEMINI_DIR" "gemini" ;;
      cursor) cursor_snippet "$skill" ;;
      *) echo "Unknown tool: $tool (use claude,muse,gemini,cursor)" >&2; exit 1 ;;
    esac
  done
done
