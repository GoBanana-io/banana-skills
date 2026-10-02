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
GEMINI_DIR="$HOME/.gemini/config/skills"           # Antigravity
GEMINI_CLI_DIR="$HOME/.gemini/skills"              # Gemini CLI (distinct from Antigravity)
CODEX_DIR="${CODEX_HOME:-$HOME/.codex}/skills"
CURSOR_DIR="$HOME/.cursor/skills"
OPENCODE_DIR="${OPENCODE_HOME:-${XDG_CONFIG_HOME:-$HOME/.config}/opencode}/skills"
COPILOT_DIR="$HOME/.copilot/skills"
WINDSURF_DIR="$HOME/.codeium/windsurf/skills"

ALL_TOOLS="claude,muse,gemini,gemini-cli,codex,cursor,opencode,copilot,windsurf"

usage() {
  cat <<'EOF'
Usage: install.sh [--skill NAME|all] [--tools LIST|--all-tools] [--list] [--update] [-h]

  --skill NAME   install one skill (default: all)
  --tools LIST   comma-separated tool names (default: --all-tools)
  --all-tools    all tools: claude,muse,gemini,gemini-cli,codex,cursor,opencode,copilot,windsurf
  --list         list available skills and exit
  --update       git pull this repo and exit
  --force        replace existing non-symlink installs (requires --skill/--tools scope)
  -h, --help     this help

Tool targets (symlinked):
  claude      ~/.claude/skills/<name>                 Claude Code
  muse        ~/.config/muse/skills/<name>             Muse
  gemini      ~/.gemini/config/skills/<name>          Antigravity
  gemini-cli  ~/.gemini/skills/<name>                 Gemini CLI
  codex       ${CODEX_HOME:-~/.codex}/skills/<name>    Codex CLI
  cursor      ~/.cursor/skills/<name>                 Cursor
  opencode    <config>/opencode/skills/<name>         OpenCode ($OPENCODE_HOME or $XDG_CONFIG_HOME)
  copilot     ~/.copilot/skills/<name>                Copilot CLI
  windsurf    ~/.codeium/windsurf/skills/<name>       Windsurf Cascade
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
    if [ "$FORCE" = "1" ]; then
      rm -rf "$dest"
      echo "REPLACED $tool/$skill (removed existing directory)"
    else
      echo "SKIP $tool/$skill: $dest exists and is not a symlink (left untouched; rerun with --force to replace)"
      return 0
    fi
  fi
  mkdir -p "$dest_base"
  ln -sfn "$src" "$dest"
  echo "OK   $tool/$skill -> $dest"
}

SKILL="all"
TOOLS="$ALL_TOOLS"
FORCE="0"
SCOPED="0"

while [ $# -gt 0 ]; do
  case "$1" in
    --skill) SKILL="${2:?--skill needs a value}"; SCOPED="1"; shift 2 ;;
    --tools) TOOLS="${2:?--tools needs a value}"; SCOPED="1"; shift 2 ;;
    --all-tools) TOOLS="$ALL_TOOLS"; SCOPED="1"; shift ;;
    --list) list_skills; exit 0 ;;
    --update) git -C "$REPO_ROOT" pull --ff-only; exit 0 ;;
    --force) FORCE="1"; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown flag: $1" >&2; usage >&2; exit 1 ;;
  esac
done

if [ "$FORCE" = "1" ] && [ "$SCOPED" = "0" ]; then
  echo "Refusing: --force needs an explicit scope (it never applies to everything by default)." >&2
  echo "Example: ./install.sh --tools gemini --force" >&2
  exit 1
fi

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
      gemini-cli) link_skill "$skill" "$GEMINI_CLI_DIR" "gemini-cli" ;;
      codex) link_skill "$skill" "$CODEX_DIR" "codex" ;;
      cursor) link_skill "$skill" "$CURSOR_DIR" "cursor" ;;
      opencode) link_skill "$skill" "$OPENCODE_DIR" "opencode" ;;
      copilot) link_skill "$skill" "$COPILOT_DIR" "copilot" ;;
      windsurf) link_skill "$skill" "$WINDSURF_DIR" "windsurf" ;;
      *) echo "Unknown tool: $tool (use $ALL_TOOLS)" >&2; exit 1 ;;
    esac
  done
done
