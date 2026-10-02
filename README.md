# 🍌 Banana Skills

A collection of [Agent Skills](https://agentskills.io/specification) — one folder per skill, installable in Claude Code, Muse, Antigravity/Gemini, and Cursor.

## Skills

| Skill | What it does | Path |
|---|---|---|
| `funky-design` | Vibrant, expressive design language for web apps and marketing sites (Funk 🎸 / Flow 🌊 modes). Use when designing, building, reviewing, or theming any web product. | `skills/funky-design/` |

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

What it does per tool:

| Tool | Target | Method |
|---|---|---|
| Claude Code | `~/.claude/skills/<name>` | symlink |
| Muse | `~/.config/muse/skills/<name>` | symlink |
| Antigravity / Gemini CLI | `~/.gemini/config/skills/<name>` | symlink |
| Cursor | `.cursor/rules/<name>.mdc` (per project) | prints a rule snippet pointing at the skill — see `skills/<name>/SKILL.md` |

## Update

```bash
cd ~/banana-skills && git pull        # or: ./install.sh --update
```

Symlinks resolve live, so every tool picks up the update with no reinstall.

## Project-level install

Copy (not symlink) one skill into your project repo:

```bash
mkdir -p .claude/skills && cp -r ~/banana-skills/skills/funky-design .claude/skills/
# equivalents: .muse/skills/ , .gemini/skills/
```

## Add a new skill

1. Create `skills/<skill-name>/SKILL.md` (`name:` must equal the folder name, lowercase letters/numbers/hyphens, max 64 chars; `description:` 1–1024 chars saying what it does and when to use it).
2. Put deep-dive docs in `skills/<skill-name>/references/`, helper code in `scripts/`, templates in `assets/`.
3. Add one row to the Skills table above.

## Migrating from `funky-design`

This repo was formerly `GoBanana-io/funky-design` (single skill at repo root). Old clones keep working via GitHub redirect — run `./install.sh --all-tools` again to point your tools at `skills/funky-design/`, or `git pull` and re-link. The root `SKILL.md` is a temporary redirect notice.

## 📄 License

MIT © [GoBanana](https://github.com/GoBanana-io)
