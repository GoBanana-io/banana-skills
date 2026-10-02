# fluent-flat — usage

When to reach for fluent-flat, how it differs from funky-design,
and how to install it in AI coding tools.

## 1. When to use fluent-flat

Use fluent-flat for dense, long-session web apps where scanning speed
and error avoidance matter:

- Operational dashboards, queues, and monitoring views
- Admin consoles, settings pages, and detail forms
- Data tables with sorting, selection, and bulk actions
- Internal B2B tools used for hours at a time

Do not use it for:

- Marketing pages, landing pages, brand storytelling
- Games, media galleries, playful consumer surfaces
- Any brief where memorability or persuasion is the win condition

Rule of thumb: if the viewport holds dozens of rows and controls,
pick fluent-flat. If it holds one big message, pick something louder.

## 2. fluent-flat vs funky-design

Both live in this repo. They solve opposite briefs. Never blend them
in one viewport.

| Question | fluent-flat | funky-design |
| -------- | ----------- | ------------ |
| Win condition | Clarity under density | Memorability and persuasion |
| Best screens | Dashboards, admin, tables, forms | Marketing sites, landing pages, creative tools |
| Surfaces | Flat opaque fills, borders first | Warm tinted fills, layered elevation |
| Color | One accent family per viewport, max two accent usages | 1 primary + 1 secondary, up to 3 accents per viewport (Funk) |
| Shape | Fixed 2 / 4 / 6 / 8 scale, symmetric, static | Pill actions, asymmetric options, shape shifts on interaction (Funk) |
| Type | System stack, weight-led hierarchy | Satoshi display + system body + mono accents |
| Motion | 150–250ms ease-out fade / 8px-or-less slide | Physics-driven movement with overshoot and velocity carry |
| Depth | One downward shadow on floating layers only | Colored offset or soft neutral shadows per mode |
| Imagery | Minimal; tables and labels carry the page | Hero art, tinted sections, expressive display type |

Migration notes:

- Replacing funky-design with fluent-flat: swap the token set, flatten
  fills to opaque solids, reset radii to the 2 / 4 / 6 / 8 scale,
  and cut motion to fade / short-slide only.
- Replacing fluent-flat with funky-design: pick a mode first (Funk or
  Flow), then a palette, then reassign color roles — see
  `skills/funky-design/SKILL.md` §2–§4.
- Shared hygiene survives both directions: visible labels above inputs,
  4.5:1 body contrast, visible focus rings, reduced-motion support.

## 3. Install for AI tools

Install fluent-flat from the banana-skills collection. Easiest path —
clone once, link all tools:

```bash
git clone https://github.com/GoBanana-io/banana-skills.git ~/banana-skills
cd ~/banana-skills && ./install.sh --skill fluent-flat --all-tools
```

| Tool | Global Path |
|---|---|
| **Claude Code** | `~/.claude/skills/fluent-flat` |
| **Muse** | `~/.config/muse/skills/fluent-flat` |
| **Google Antigravity CLI (`agy`)** | `~/.gemini/config/skills/fluent-flat` |
| **Gemini CLI** | `~/.gemini/skills/fluent-flat` |
| **Codex CLI** | `~/.codex/skills/fluent-flat` |
| **Cursor** | `~/.cursor/skills/fluent-flat` |
| **OpenCode** | `~/.config/opencode/skills/fluent-flat` |
| **Copilot CLI** | `~/.copilot/skills/fluent-flat` |
| **Windsurf Cascade** | `~/.codeium/windsurf/skills/fluent-flat` |

Project-level install (copy, not symlink, into your repo):

```bash
mkdir -p .claude/skills && cp -r ~/banana-skills/skills/fluent-flat .claude/skills/
# equivalents: .muse/skills/ , .gemini/skills/ , .codex/skills/ ,
# .cursor/skills/ , .opencode/skills/ , .github/skills/ , .agents/skills/
```

Verify with `./install.sh --list` from the repo root; `fluent-flat`
appears beside `funky-design`.

## 4. Quick pick checklist

- [ ] One accent family, max two accent usages in the viewport.
- [ ] Every fill opaque; layout still reads with effects disabled.
- [ ] Labels above all inputs; errors use border + message + marker.
- [ ] Focus ring on every control; keyboard order matches visual order.
- [ ] Motion is fade / short slide only; reduced-motion shows end states.
