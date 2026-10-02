# 🍌 Banana Skills

A collection of [Agent Skills](https://agentskills.io/specification) — one folder per skill, installable in Claude Code, Muse, Antigravity/Gemini, and Cursor.

## Skills

| Skill | What it does | Path |
|---|---|---|
| `funky-design` | Vibrant, expressive design language for web apps and marketing sites (Funk 🎸 / Flow 🌊 modes). Use when designing, building, reviewing, or theming any web product. | `skills/funky-design/` |
| `fluent-flat` | Flat, opaque web-app theme inspired by Fluent (not affiliated with Microsoft) for dense dashboards and admin/B2B apps. Use for calm, contrasty, high-density UI. | `skills/fluent-flat/` |

## Install

```bash
git clone https://github.com/GoBanana-io/banana-skills.git ~/banana-skills
./install.sh --all-tools            # symlinks every skill into every tool
```

Selective install:

```bash
./install.sh --skill funky-design --tools claude,muse          # two tools only
./install.sh --list                                            # list skills
```

What it does per tool (all symlinks, all auto-update on `git pull`):

| Tool | Target |
|---|---|
| Claude Code | `~/.claude/skills/<name>` |
| Muse | `~/.config/muse/skills/<name>` |
| Antigravity | `~/.gemini/config/skills/<name>` |
| Gemini CLI | `~/.gemini/skills/<name>` |
| Codex CLI | `${CODEX_HOME:-~/.codex}/skills/<name>` |
| Cursor | `~/.cursor/skills/<name>` |
| OpenCode | `${OPENCODE_HOME:-${XDG_CONFIG_HOME:-~/.config}/opencode}/skills/<name>` |
| Copilot CLI | `~/.copilot/skills/<name>` |
| Windsurf Cascade | `~/.codeium/windsurf/skills/<name>` |

## Update

```bash
cd ~/banana-skills && git pull        # or: ./install.sh --update
```

Symlinks resolve live, so every tool picks up the update with no reinstall.

## Project-level install

Copy (not symlink) one skill into your project repo:

```bash
mkdir -p .claude/skills && cp -r ~/banana-skills/skills/funky-design .claude/skills/
# equivalents: .muse/skills/ , .gemini/skills/ , .codex/skills/ ,
# .cursor/skills/ , .opencode/skills/ , .github/skills/ , .agents/skills/
```

## Add a new skill

1. Create `skills/<skill-name>/SKILL.md` (`name:` must equal the folder name, lowercase letters/numbers/hyphens, max 64 chars; `description:` 1–1024 chars saying what it does and when to use it).
2. Put deep-dive docs in `skills/<skill-name>/references/`, helper code in `scripts/`, templates in `assets/`.
3. Add one row to the Skills table above.

## Migrating from `funky-design`

This repo was formerly `GoBanana-io/funky-design` (single skill at repo root). Old clones keep working via GitHub redirect — run `./install.sh --all-tools` again to point your tools at `skills/funky-design/`, or `git pull` and re-link. The root `SKILL.md` is a temporary redirect notice.

## 📄 License

MIT © [GoBanana](https://github.com/GoBanana-io)
