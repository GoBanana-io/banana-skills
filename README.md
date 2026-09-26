# 🎨 Funky Design

> **A vibrant, expressive design language for web apps and marketing sites.**  
> Built on Google Material Design 3 Expressive foundations, informed by Apple's compositional craft and Fluent's adaptive layering — but distinctly original.

[![License: MIT](https://img.shields.io/badge/License-MIT-coral.svg)](https://opensource.org/licenses/MIT)
[![Design System](https://img.shields.io/badge/System-Funky%20Design-violet.svg)](#)
[![OKLCH Colors](https://img.shields.io/badge/Color-OKLCH%20Vibrant-teal.svg)](#)
[![Spring Motion](https://img.shields.io/badge/Motion-Spring%20Physics-amber.svg)](#)

---

## ⚡ Highlights

- **Two Voices, One Soul:**
  - 🎸 **Funk Mode** — Turned up to 11. Bouncy spring physics, colored hard-offset shadows, asymmetric corners, morphing shapes, and 900-weight display type. Perfect for landing pages, creative portfolios, and expressive consumer apps.
  - 🌊 **Flow Mode** — Smooth groove. Gentle critically damped springs, neutral soft shadows, uniform corner radii, and measured typography. Built for dashboards, B2B platforms, enterprise tools, and data-dense interfaces.
- **Warm by Default (3 Signature Surface Palettes):**
  - ☀️ **Sunlit** (Warm-Light) — Creamy peach tints, human, organic, never sterile white.
  - ☁️ **Overcast** (Cool-Neutral) — Modern slate with cool blue undertones, perfect for high data density.
  - 🌙 **Midnight** (Deep-Dark) — Rich indigo-black canvas with luminous warm text, not dead `#000000`.
- **7 Vibrant OKLCH Accent Roles:** Coral, Violet, Teal, Amber, Fuchsia, Lime, and Slate with complete 11-step tonal ramps (50–950) tested for WCAG 2.1 AA accessibility.
- **Physical Spring Motion:** Fully interruptible, velocity-preserving spring animations with pre-computed CSS `linear()` curves and JS solvers.
- **Zero Glass / Translucency Shit:** Surfaces are 100% opaque, confident, and tactile. No washed-out blur cards or illegible frosted layers.

---

## 📦 Installation for AI Coding Assistants & CLI Tools

Funky Design is structured as an **Agent Skill** (`SKILL.md` + modular subsystem references). Once installed, AI coding agents automatically discover and apply its design rules, tokens, and components when scaffolding or styling web applications.

### 1. 🪐 Google Antigravity CLI (`agy`)

Antigravity CLI discovers skills globally in `~/.gemini/config/skills/` or locally in your project workspace.

#### Global Install (Available across all projects):
```bash
git clone https://github.com/GoBanana-io/funky-design.git ~/.gemini/config/skills/funky-design
```
*Or via symlink if you have a local working copy:*
```bash
ln -s /path/to/funky-design ~/.gemini/config/skills/funky-design
```

#### Project-Level Install (Scoped to a specific repository):
```bash
# Inside your project root:
mkdir -p .gemini/skills
git clone https://github.com/GoBanana-io/funky-design.git .gemini/skills/funky-design
# or as a submodule:
git submodule add https://github.com/GoBanana-io/funky-design.git .gemini/skills/funky-design
```

---

### 2. 🪕 Muse CLI

Muse loads skills from `~/.config/muse/skills/` globally, or from `.muse/skills/` within a workspace.

#### Global Install:
```bash
git clone https://github.com/GoBanana-io/funky-design.git ~/.config/muse/skills/funky-design
```
*Or via symlink:*
```bash
ln -s /path/to/funky-design ~/.config/muse/skills/funky-design
```

#### Project-Level Install:
```bash
mkdir -p .muse/skills
git clone https://github.com/GoBanana-io/funky-design.git .muse/skills/funky-design
```

---

### 3. 🤖 Claude Code (Anthropic CLI)

Claude Code supports custom skills in your user configuration or project workspace.

#### Global Install:
```bash
git clone https://github.com/GoBanana-io/funky-design.git ~/.claude/skills/funky-design
```

#### Project-Level Install:
```bash
mkdir -p .claude/skills
git clone https://github.com/GoBanana-io/funky-design.git .claude/skills/funky-design
```

#### Linking in `CLAUDE.md`:
You can also add this directive to your project's `CLAUDE.md`:
```markdown
## Design Guidelines
When generating, reviewing, or styling UI components and web pages, strictly adhere to the Funky Design skill located in `skills/funky-design/SKILL.md` (or `~/.claude/skills/funky-design/SKILL.md`).
- Default to **Flow 🌊** mode for dashboards and dense applications.
- Default to **Funk 🎸** mode for marketing, landing pages, and consumer tools.
```

---

### 4. ⚡ Cursor & Windsurf IDEs

For AI editor rules in Cursor or Windsurf, point your agent rules directly to the skill:

#### Cursor (`.cursor/rules/funky-design.mdc`):
```markdown
---
description: Apply Funky Design System to frontend code
globs: **/*.{tsx,jsx,html,css,vue,svelte}
---
When designing or styling user interfaces, load and follow the Funky Design System rules:
- Constitution: `references to funky-design/SKILL.md`
- Token definitions: `funky-design/references/tokens.md`
- Component patterns: `funky-design/references/components.md`
- Always check WCAG AA contrast (4.5:1 text, 3:1 graphical).
- Ban pure white (#fff) and pure black (#000) surfaces; use Sunlit, Overcast, or Midnight palettes.
- Ban backdrop-filter / glassmorphism.
```

#### Windsurf (`.windsurfrules`):
```markdown
When building UI components, follow the design system specifications in `funky-design/SKILL.md`. Use Funk mode for marketing and Flow mode for dashboards.
```

---

### 5. 🛠️ Universal Symlink / One-Liner (Mac & Linux)

To install Funky Design across **Antigravity CLI, Muse, and Claude Code** in one shot:

```bash
git clone https://github.com/GoBanana-io/funky-design.git ~/funky-design && \
mkdir -p ~/.gemini/config/skills ~/.config/muse/skills ~/.claude/skills && \
ln -sf ~/funky-design ~/.gemini/config/skills/funky-design && \
ln -sf ~/funky-design ~/.config/muse/skills/funky-design && \
ln -sf ~/funky-design ~/.claude/skills/funky-design
```

---

## 💬 How to Prompt Your AI Agent

Once installed, simply mention the skill in your prompt:

- *"Create a landing page for our new AI product using the `funky-design` skill in **Funk 🎸** mode with the Sunlit palette."*
- *"Build a financial metrics dashboard in React + Tailwind using `funky-design` in **Flow 🌊** mode with the Overcast palette."*
- *"Refactor these card and button components to match Funky Design spring physics and colored shadow elevation."*
- *"Review our CSS and components against the Funky Design checklist."*

---

## 🗂️ Repository Structure

```
funky-design/
├── SKILL.md                     # 📜 Main constitution (Philosophy, Modes, Palettes, Rules, Bans)
├── README.md                    # 📖 Overview & Installation Guide (this file)
└── references/                  # 📚 Deep-dive subsystem documentation
    ├── color-system.md          # 7 OKLCH roles, 11-step ramps, mesh gradient recipes
    ├── components.md            # 12 production components (HTML/CSS in Funk & Flow modes)
    ├── modes.md                 # In-depth Funk vs. Flow decision matrix & parameter comparison
    ├── motion-system.md         # Spring physics formulas, linear() curves, velocity handoff
    ├── shape-system.md          # Squircles, SVG clip-paths, morphing & asymmetric corners
    ├── tokens.md                # CSS custom properties, Tailwind preset & system mapping
    └── typography.md            # Satoshi Variable, JetBrains Mono, fluid clamp() scales
```

---

## 📜 The 7 Pillars of Funky Design

1. **Vibrance with Purpose** — Color and motion are functional tools for hierarchy, not gratuitous decoration.
2. **Alive, Not Animated** — Motion is physics-based, velocity-aware, and interruptible at any millisecond.
3. **Warm by Default** — Pure `#ffffff` and pure `#000000` are banned. Every surface has temperature.
4. **Shape Tells a Story** — Actions are pills, containers are squircles, accents are asymmetric.
5. **Two Voices, One Soul** — Funk dials up expressiveness; Flow dials up precision. Both share identical DNA.
6. **Contrast is King** — Hierarchy is loud and unmistakable. If two things look equal, the design failed.
7. **Own Your Space** — Opaque, confident, tactile layers. Zero translucent glassmorphism blur.

---

## 📄 License

MIT © [GoBanana](https://github.com/GoBanana-io)
