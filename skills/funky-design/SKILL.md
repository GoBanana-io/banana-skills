---
name: funky-design
description: >-
  Funky Design — a vibrant, expressive design language for web apps and
  marketing sites. Built on Material Design 3 Expressive foundations, informed
  by Apple's compositional craft and Fluent's adaptive layering, but distinctly
  original. Features two personality modes (Funk and Flow), three signature
  surface palettes, OKLCH-based vibrant color, spring-physics motion, morphing
  shapes, and variable typography. Use when designing, building, reviewing, or
  theming any web product. Do not use for native mobile apps (refer to
  platform-specific guidelines instead).
---

# Funky Design

## Initial Response

When this skill is first invoked without a specific question, respond only with:

> I'm ready to help you build with **Funky Design** — a vibrant, expressive
> design language with two voices: **Funk** 🎸 (turned up to 11) and
> **Flow** 🌊 (smooth professional groove). Tell me what you're building and
> which mode fits, or I'll help you decide.

Do not provide any other information until the user asks a question.

---

## How to Use This Skill

This skill is the authoritative design constitution for all web products.
When building or reviewing any web interface, follow these rules in priority
order:

1. **Non-negotiables** — accessibility, banned items, contrast minimums.
2. **Mode selection** — choose Funk or Flow before touching anything else.
3. **Surface palette** — pick Warm-Light, Cool-Neutral, or Deep-Dark.
4. **System application** — apply color, shape, motion, type, and elevation
   systems as specified for the chosen mode.

For deeper reference on any subsystem, load the corresponding file from
`references/`. This SKILL.md is always the source of truth; reference docs
expand on implementation details.

### Reference Documents

| File | Contents |
|---|---|
| `references/color-system.md` | Full OKLCH tonal ramps, contrast pairings, gradient recipes |
| `references/shape-system.md` | Squircle CSS, morphing techniques, asymmetric patterns |
| `references/motion-system.md` | Spring physics, `linear()` CSS curves, velocity handoff |
| `references/typography.md` | Font loading, fluid type scale, optical sizing |
| `references/components.md` | Component patterns in both modes with full state coverage |
| `references/tokens.md` | CSS custom properties, Tailwind preset, token mapping |
| `references/modes.md` | Full Funk vs Flow comparison with decision guidance |

### Installation for AI Tools

Install Funky Design from the banana-skills collection. Easiest path — clone once, link all tools:

```bash
git clone https://github.com/GoBanana-io/banana-skills.git ~/banana-skills
cd ~/banana-skills && ./install.sh --skill funky-design --all-tools
```

| Tool | Global Path |
|---|---|
| **Claude Code** | `~/.claude/skills/funky-design` |
| **Muse** | `~/.config/muse/skills/funky-design` |
| **Google Antigravity CLI (`agy`)** | `~/.gemini/config/skills/funky-design` |
| **Gemini CLI** | `~/.gemini/skills/funky-design` |
| **Codex CLI** | `~/.codex/skills/funky-design` |
| **Cursor** | `~/.cursor/skills/funky-design` |
| **OpenCode** | `~/.config/opencode/skills/funky-design` |
| **Copilot CLI** | `~/.copilot/skills/funky-design` |
| **Windsurf Cascade** | `~/.codeium/windsurf/skills/funky-design` |

For project-level installation, copy `skills/funky-design/` into `.gemini/skills/funky-design`, `.muse/skills/funky-design`, or `.claude/skills/funky-design`. See the repo-root `README.md` for full instructions.

---

## § 1 — Philosophy: The 7 Pillars

These are the soul of Funky Design. Every design decision must trace back to
at least one pillar. If it doesn't, cut it.

### 1. Vibrance with Purpose

Every bold color, bouncy spring, and playful shape earns its place by guiding
the user toward understanding or action. Decoration that doesn't serve
function gets cut. A coral button isn't coral because it's pretty — it's coral
because it's the single most important action on the page and coral screams
"tap me." If the user can't explain why a color is there, the color is wrong.

### 2. Alive, Not Animated

Interfaces don't just move; they respond. Motion starts from where things
physically are on screen, carries the user's velocity, and can be interrupted
and reversed at any instant. Elements feel like they have mass and physics,
not timelines and keyframes. A button press compresses because you pressed it;
a card springs because you flicked it. Nothing moves without a cause.

### 3. Warm by Default

Backgrounds are never clinical white or dead gray. Every surface has
temperature — a subtle warm or cool tint that makes screens feel human and
inhabited. Pure white (`#ffffff`) and pure black (`#000000`) are banned from
surfaces. Even the darkest mode has a hint of indigo; even the lightest mode
has a hint of peach. Cold, sterile, corporate — those words should never
describe a Funky Design product.

### 4. Shape Tells a Story

Components earn their shape. Pills for actions (graspable, thumb-friendly).
Squircles for containers (welcoming, soft). Sharp cuts for emphasis
(intentional tension, editorial weight). Shapes can morph between states to
reinforce the narrative — a FAB that expands from squircle to pill isn't
just growing; it's transforming its role from "an option" to "the action."

### 5. Two Voices, One Soul

**Funk** 🎸 mode brings full expression: bouncy springs, colored shadows,
asymmetric corners, bold contrasts, shape morphing, and typographic weight
turned up to 900. **Flow** 🌊 mode dials it to a professional warmth: gentle
springs, neutral shadows, consistent radii, and restrained typography — but
both are unmistakably Funky. They share the same color system, shape tokens,
motion physics, and type scale. They differ only in *intensity*, never in
*identity*. A product should never need to leave Funky Design to be serious.

### 6. Contrast is King

Hierarchy comes from boldness: size, weight, color saturation, and spatial
contrast. Subtlety is never the primary tool. If two elements look equally
important, the design has failed. The most important thing on the page should
be obvious at 10 feet — squint at your design and the primary action should
still scream. This doesn't mean everything is loud; it means the quiet parts
are deliberately quiet so the loud parts land harder.

### 7. Own Your Space

No translucent blur-behind surfaces — that's Apple's vocabulary, and we are
not Apple. No paper-and-ink metaphor — that's Material's, and we are not
Material. Funky surfaces are **opaque**, richly colored, and confidently
layered with elevation. We occupy space; we don't dissolve into it. Our
surfaces have presence, weight, and warmth. When a Funky card sits on a Funky
background, it *sits* — with a shadow that says "I am here."

---

## § 2 — Modes: Funk 🎸 vs Flow 🌊

Choose one mode per product (or per product area — a marketing site can be
Funk while its dashboard is Flow). Never mix modes on the same page.

### When to use Funk

- Marketing sites, landing pages, launch announcements
- Creative tools, design apps, portfolio sites
- Consumer products targeting a young or creative audience
- Any context where personality and memorability matter more than density

### When to use Flow

- Dashboards, admin panels, data-heavy apps
- Developer tools, documentation sites
- B2B products, fintech, healthcare, enterprise
- Any context where information density and professional trust matter most

### Mode Comparison Table

| System | Funk 🎸 | Flow 🌊 |
|---|---|---|
| **Spring damping** | 0.7–0.85 (visible overshoot) | 0.9–1.0 (smooth settle) |
| **Corner strategy** | Mixed geometry, asymmetric allowed | Consistent squircle radii |
| **Shadow style** | Colored, hard-offset, larger | Neutral, soft-blur, subtle |
| **Color saturation** | High chroma, multi-accent per viewport | Reduced chroma, single accent focus |
| **Max accents/viewport** | 3 vibrant roles | 2 vibrant roles |
| **Shape morphing** | Yes, on key interactions | Subtle scale/fade only |
| **Typography display weight** | 800–900 (Black), tracking -0.03em | 600–700 (Semi/Bold), tracking -0.015em |
| **Hover effects** | Lift + rotate(0.5deg) + shadow growth | Lift + subtle shadow growth |
| **Press feedback** | Scale 0.92 + shadow compress + spring bounce-back | Scale 0.96 + shadow reduce + smooth settle |
| **Asymmetric corners** | Allowed and encouraged | Not used — consistent radii |
| **Gradient usage** | Mesh gradients OK for hero/section backgrounds | Gradients only as very subtle surface tints |
| **Loading indicators** | Morphing shape animation | Simple pulse or spinner |
| **Card hover** | Lift + corner morph (md→lg) + colored shadow | Lift + shadow growth only |

### Applying a Mode

Set the mode at the root level via a CSS class or data attribute:

```html
<body data-funky-mode="funk">   <!-- or "flow" -->
```

All token values cascade from this. The `references/tokens.md` file provides
the complete CSS custom property map for both modes.

---

## § 3 — Surface Palettes

Three signature canvases. Pick one per product. All 7 accent colors work
on all three palettes (contrast-checked).

### 3.1 Warm-Light ("Sunlit" ☀️)

The signature Funky surface. Warm, inviting, alive. Use for consumer products,
creative tools, and anything that should feel human and approachable.

| Token | OKLCH | Hex (approx) | Role |
|---|---|---|---|
| `--surface-base` | `oklch(96.5% 0.015 75)` | #FDF6EE | Page background |
| `--surface-1` | `oklch(94% 0.012 75)` | #F5ECE0 | Sections, grouped areas |
| `--surface-2` | `oklch(98% 0.008 75)` | #FEFAF6 | Cards, elevated surfaces |
| `--surface-3` | `oklch(99% 0.005 75)` | #FFFDF9 | Inputs, text areas |
| `--surface-overlay` | `oklch(92% 0.01 75 / 0.92)` | — | Modal backdrops |
| `--text-primary` | `oklch(18% 0.02 55)` | #2A2118 | Primary text |
| `--text-secondary` | `oklch(40% 0.015 55)` | #6B5D4F | Secondary text |
| `--text-muted` | `oklch(55% 0.01 55)` | #8D8278 | Captions, placeholders |
| `--border-default` | `oklch(85% 0.01 75)` | #DDD4C8 | Subtle borders |
| `--border-strong` | `oklch(70% 0.015 55)` | #B0A090 | Emphasis borders |

### 3.2 Cool-Neutral ("Overcast" ☁️)

Modern, spacious, professional. Use for B2B products, developer tools, and
dashboards where content density requires a quieter canvas.

| Token | OKLCH | Hex (approx) | Role |
|---|---|---|---|
| `--surface-base` | `oklch(95% 0.008 260)` | #F0F2F5 | Page background |
| `--surface-1` | `oklch(92% 0.006 260)` | #E4E7EC | Sections, grouped areas |
| `--surface-2` | `oklch(97% 0.004 260)` | #F8F9FB | Cards, elevated surfaces |
| `--surface-3` | `oklch(98.5% 0.003 260)` | #FCFCFD | Inputs, text areas |
| `--surface-overlay` | `oklch(90% 0.005 260 / 0.92)` | — | Modal backdrops |
| `--text-primary` | `oklch(15% 0.015 260)` | #1A1D24 | Primary text |
| `--text-secondary` | `oklch(38% 0.01 260)` | #5A6170 | Secondary text |
| `--text-muted` | `oklch(52% 0.008 260)` | #7E8694 | Captions, placeholders |
| `--border-default` | `oklch(83% 0.006 260)` | #CDD2DA | Subtle borders |
| `--border-strong` | `oklch(68% 0.01 260)` | #9CA3B0 | Emphasis borders |

### 3.3 Deep-Dark ("Midnight" 🌙)

Moody, premium, immersive. Use for creative portfolios, media products, and
any context where the content should glow against a rich dark canvas.

| Token | OKLCH | Hex (approx) | Role |
|---|---|---|---|
| `--surface-base` | `oklch(14% 0.02 280)` | #0D0F1A | Page background |
| `--surface-1` | `oklch(20% 0.018 280)` | #1A1D2E | Sections, grouped areas |
| `--surface-2` | `oklch(25% 0.015 280)` | #262A3C | Cards, elevated surfaces |
| `--surface-3` | `oklch(30% 0.012 280)` | #33374A | Inputs, text areas |
| `--surface-overlay` | `oklch(10% 0.02 280 / 0.85)` | — | Modal backdrops |
| `--text-primary` | `oklch(92% 0.01 75)` | #F0E8DC | Primary text (warm off-white) |
| `--text-secondary` | `oklch(72% 0.008 75)` | #B8AFA4 | Secondary text |
| `--text-muted` | `oklch(55% 0.006 280)` | #7A7F90 | Captions, placeholders |
| `--border-default` | `oklch(30% 0.015 280)` | #343850 | Subtle borders |
| `--border-strong` | `oklch(45% 0.018 280)` | #545A78 | Emphasis borders |

### Palette Selection

Set via a CSS class or data attribute at the root:

```html
<body data-funky-mode="funk" data-funky-palette="sunlit">
<!-- Options: "sunlit" | "overcast" | "midnight" -->
```

---

## § 4 — Color System: The 7 Vibrant Roles

All accent colors are defined in OKLCH for perceptual uniformity. Each role
has a "hero" value (the main swatch) plus a tonal ramp from 50 (lightest)
to 950 (darkest). See `references/color-system.md` for the full ramps.

### The Roles

| Role | Hero OKLCH | Hex (approx) | Semantic Purpose |
|---|---|---|---|
| **Coral** | `oklch(68% 0.19 30)` | #FF6B35 | Primary actions, CTAs, energy, "do this now" |
| **Violet** | `oklch(55% 0.22 300)` | #9B5DE5 | Secondary actions, links, creative emphasis |
| **Teal** | `oklch(72% 0.14 180)` | #00C2A8 | Success, progress, positive states, growth |
| **Amber** | `oklch(80% 0.16 85)` | #FFB627 | Warnings, highlights, attention, "look here" |
| **Fuchsia** | `oklch(58% 0.25 340)` | #F72585 | Errors, destructive actions, hot accents |
| **Lime** | `oklch(82% 0.2 130)` | #AAEF47 | Tags, badges, fresh emphasis, new/beta |
| **Slate** | `oklch(55% 0.02 260)` | #6B7280 | Neutral text, borders, muted UI elements |

### Color Rules

1. **Product color assignment:** Each product picks **1 primary** + **1 secondary**
   from the 7 roles. The other roles remain available as semantic utility
   colors. The primary role is used for CTAs and key actions; the secondary
   for links, selected states, and supporting emphasis.

2. **Viewport accent limits:** Maximum **3 vibrant accent roles** per viewport
   in Funk mode; **2** in Flow mode. Slate (neutral) doesn't count.

3. **Contrast requirements:** Text on colored backgrounds must pass **WCAG 2.1
   AA** — 4.5:1 for body text, 3:1 for large text (≥18px bold or ≥24px).
   Use the tonal ramp: light tones (50–200) as backgrounds with dark text,
   dark tones (700–950) as backgrounds with light text.

4. **Gradients:** Mesh-style, subtle, using **adjacent OKLCH hues** — never
   rainbow. Gradients are for hero section backgrounds and decorative section
   textures only. Never on text. Never on small components. In Flow mode,
   gradients are reduced to barely-perceptible surface tints.

5. **Color on color:** Never place two vibrant accents directly adjacent
   without a neutral separator (surface or Slate border). Vibrant-on-vibrant
   creates visual noise.

6. **Semantic consistency:** Once a role is assigned a meaning (e.g., Teal =
   success), maintain it across the entire product. Never use Teal for success
   in one area and for navigation in another.

### Using Colors in CSS

```css
/* Primary action button */
.btn-primary {
  background: var(--color-coral-500);
  color: var(--color-coral-50);
}

/* Success state */
.badge-success {
  background: var(--color-teal-100);
  color: var(--color-teal-800);
}

/* Error / destructive */
.alert-error {
  background: var(--color-fuchsia-100);
  color: var(--color-fuchsia-900);
  border-left: 3px solid var(--color-fuchsia-500);
}
```

---

## § 5 — Shape System: Geometry with Personality

Shape is one of Funky Design's strongest identity markers. Components earn
their shape based on their role, and shapes can transform to reflect state
changes.

### Shape Tokens

| Token | Funk 🎸 | Flow 🌊 | Usage |
|---|---|---|---|
| `--shape-xs` | `4px` | `4px` | Badges, tiny indicators |
| `--shape-sm` | `8px` | `6px` | Input fields, small chips |
| `--shape-md` | `16px` | `12px` | Cards, dialogs, dropdowns |
| `--shape-lg` | `24px` | `16px` | Hero cards, feature panels |
| `--shape-xl` | `32px` | `20px` | Full-width sections, modals |
| `--shape-pill` | `9999px` | `9999px` | Buttons, tags, chips, search bars |
| `--shape-squircle` | Superellipse clip-path | Superellipse clip-path | Avatars, images, app icons |

### Shape Assignment

Components are assigned shapes by role, not by arbitrary choice:

- **Actions** (buttons, CTAs, toggles) → `pill` — graspable, thumb-friendly
- **Containers** (cards, panels, sheets) → `md` / `lg` — welcoming, structured
- **Inputs** (text fields, selects, search) → `sm` — subtle, non-distracting
- **Badges & tags** (status, labels) → `pill` or `xs` — compact, scannable
- **Avatars & icons** → `squircle` — distinctive, warm, recognizable
- **Emphasis elements** (hero cards, feature blocks) → `lg` / `xl` — presence

### Asymmetric Corners (Funk Mode Only)

In Funk mode, select elements can use diagonal asymmetric corners to create
visual tension and personality. Use sparingly — at most 2 asymmetric elements
per viewport.

```css
/* Diagonal asymmetry — creates visual tension */
[data-funky-mode="funk"] .card-featured {
  border-radius: 24px 8px 24px 8px;
}

/* Inverse diagonal for variety */
[data-funky-mode="funk"] .card-secondary {
  border-radius: 8px 24px 8px 24px;
}
```

### Shape Morphing (Funk Mode)

In Funk mode, components can morph their shape on interaction to reinforce
state changes. See `references/shape-system.md` for CSS implementations.

- **FAB expand:** squircle → pill (role shifts from "option" to "active action")
- **Card hover:** corners morph from `md` → `lg` (element "opens up")
- **Tab indicator:** active indicator slides and morphs to fit content width
- **Loading:** geometric shape rotation (circle → squircle → rounded-rect)
- **Toggle on:** track corner radius morphs from `pill` to `md` (settles into state)

### Squircle Implementation

True squircles (superellipses) are not achievable with `border-radius` alone.
Use SVG `clip-path` for pixel-perfect squircles on avatars and key identity
elements:

```css
.avatar-squircle {
  clip-path: url(#squircle-clip);
  /* Fallback for older browsers */
  border-radius: 22%;
}
```

See `references/shape-system.md` for the full SVG path and CSS `@property`
animation techniques.

---

## § 6 — Typography

Funky Design uses three type families with distinct roles. Type hierarchy
is built from weight + size + leading as a coordinated set — never from
size or color alone.

### Font Stack

```css
:root {
  /* Display & Headlines — bold, distinctive, warm */
  --font-display: 'Satoshi Variable', 'Satoshi', system-ui, sans-serif;

  /* Body — fast, native, comfortable */
  --font-body: system-ui, -apple-system, 'Segoe UI', Roboto, sans-serif;

  /* Accent — code, data, stats, timestamps */
  --font-mono: 'JetBrains Mono', 'Fira Code', 'SF Mono', ui-monospace, monospace;
}
```

**Satoshi** (by Indian Type Foundry, free for commercial use) is a geometric
sans-serif with warmth — round but not childish, bold but not aggressive.
It has a full variable weight axis (300–900) and optical sizing support.

**System fonts** for body text ensure native rendering quality, zero FOUT
on body copy, and respect for user font-size preferences.

**JetBrains Mono** for monospace accents — metrics, code, data labels, and
timestamps. It's highly legible and has ligatures that can be optionally
enabled for code blocks.

### Type Scale

All sizes use `clamp()` for fluid scaling between viewport widths. Sizes
are in `rem` to respect the user's base font-size setting.

| Token | Size | Weight | Leading | Tracking | Font |
|---|---|---|---|---|---|
| `--type-display-xl` | `clamp(3rem, 6vw, 5rem)` | 900 | 1.0 | -0.03em | Display |
| `--type-display` | `clamp(2.25rem, 4.5vw, 3.5rem)` | 800 | 1.05 | -0.025em | Display |
| `--type-h1` | `clamp(1.75rem, 3vw, 2.5rem)` | 700 | 1.1 | -0.02em | Display |
| `--type-h2` | `clamp(1.25rem, 2vw, 1.75rem)` | 700 | 1.2 | -0.015em | Display |
| `--type-h3` | `1.125rem` | 600 | 1.3 | -0.01em | Display |
| `--type-body-lg` | `1.125rem` | 400 | 1.6 | 0 | Body |
| `--type-body` | `1rem` | 400 | 1.6 | 0 | Body |
| `--type-body-sm` | `0.875rem` | 400 | 1.5 | 0.005em | Body |
| `--type-caption` | `0.75rem` | 500 | 1.4 | 0.01em | Body |
| `--type-mono` | `0.875rem` | 500 | 1.5 | 0.02em | Mono |
| `--type-mono-sm` | `0.75rem` | 500 | 1.4 | 0.02em | Mono |

### Typography Rules

1. **Headlines use Display font.** Body text uses the system stack. Never
   use Satoshi for body paragraphs — it's reserved for impact.

2. **Weight before size.** When adding emphasis within body text, increase
   weight (400→600) before increasing size. Weight adds presence without
   consuming more space.

3. **Tracking is size-specific.** Large display text gets negative tracking
   (letters feel too loose as they grow). Body stays near zero. Small text
   gets slightly positive tracking for legibility. **Never use one
   `letter-spacing` value for all sizes.**

4. **Leading (line-height) inversely tracks size.** Tight on large headings
   (1.0–1.1), comfortable on body (1.5–1.6), slightly tighter on captions
   (1.4). Dense data tables can go to 1.3.

5. **Optical sizing enabled.** Set `font-optical-sizing: auto` on all text.
   Variable fonts that support it will automatically adjust stroke contrast
   and x-height for the rendered size.

6. **Respect user settings.** Use `rem`/`em` for all sizes, never `px` for
   type. Layout spacing uses `rem` so it scales with the user's font-size
   preference.

### Mode Differences

In **Funk** mode, display type is set to weight **800–900** with tracking
**-0.03em** — maximum impact, maximum presence. Headlines dominate.

In **Flow** mode, display type softens to weight **600–700** with tracking
**-0.015em** — still distinctive (it's still Satoshi), but measured and
professional. Headlines guide rather than shout.

See `references/typography.md` for font loading strategy, `@font-face`
declarations, and `font-display` configuration.

---

## § 7 — Motion: Spring Physics First

Motion in Funky Design is **physics-based, not timeline-based**. Every
moving element behaves as if it has mass. Springs are the default; CSS
transitions are the fallback for color and opacity changes only.

### Core Motion Principles

1. **Respond on pointer-down, not pointer-up.** Show feedback the instant
   something is pressed. Waiting for release to give visual feedback feels
   dead. Scale the element to 0.92–0.96 within 80ms of press.

2. **Springs for everything gesture-driven.** Buttons, cards, drawers,
   sheets, modals, tabs — anything the user touches animates with springs.
   CSS `transition` is reserved for color shifts and opacity fades only.

3. **Always animate from the current value.** On interrupt, read the
   element's live on-screen transform and start the new animation from
   there. Never animate from the logical target — that causes a visible
   jump. This is the single most important motion rule.

4. **Velocity handoff.** When a gesture ends, the animation must continue
   at the finger's exact velocity. Capture the pointer's release velocity
   and pass it as the spring's initial velocity. This makes the seam
   between dragging and animating invisible.

5. **Never lock out input during a transition.** Every animation is
   interruptible. A user must be able to grab a moving element mid-flight,
   reverse it, redirect it — without waiting for anything to finish.

6. **Spatial consistency.** Enter and exit along the same path. A panel
   that slides in from the right must dismiss to the right. Anchor
   popovers, menus, and sheets to their trigger element's position.

7. **Reduced motion.** `prefers-reduced-motion: reduce` → replace all
   springs with a 200ms opacity cross-fade. Keep press state as an instant
   state change with no scale animation.

### Spring Presets

Springs are defined by damping, stiffness, and mass. These presets cover
all common interactions:

| Preset | Damping | Stiffness | Mass | Character | Use |
|---|---|---|---|---|---|
| `spring-bouncy` | 12 | 180 | 1 | Visible overshoot, energetic | Funk: buttons, FABs, reveals, cards |
| `spring-snappy` | 20 | 300 | 1 | Fast settle, precise | Flow: all transitions, focused movement |
| `spring-gentle` | 18 | 120 | 1 | Smooth, gradual | Sheets, drawers, panels (both modes) |
| `spring-quick` | 25 | 400 | 1 | Near-instant, minimal settle | Micro-interactions: toggles, checkboxes |

### CSS Implementation

Native CSS doesn't support true spring physics, but we approximate them
using the `linear()` easing function with pre-computed coordinate strings:

```css
:root {
  /* Bouncy — visible overshoot for Funk mode */
  --ease-spring-bouncy: linear(
    0, 0.004, 0.016, 0.035, 0.063, 0.098, 0.141, 0.191, 0.25, 0.316,
    0.39, 0.472, 0.562, 0.659, 0.763, 0.876, 0.998, 1.046, 1.078,
    1.099, 1.109, 1.112, 1.109, 1.102, 1.091, 1.078, 1.063, 1.048,
    1.033, 1.019, 1.008, 1.0
  );

  /* Snappy — smooth settle for Flow mode */
  --ease-spring-snappy: linear(
    0, 0.009, 0.035, 0.078, 0.138, 0.213, 0.303, 0.406, 0.52, 0.642,
    0.763, 0.868, 0.944, 0.988, 1.008, 1.014, 1.012, 1.006, 1.002,
    1.0
  );

  /* Gentle — for larger surfaces */
  --ease-spring-gentle: linear(
    0, 0.002, 0.009, 0.02, 0.038, 0.063, 0.096, 0.139, 0.192, 0.255,
    0.33, 0.415, 0.51, 0.612, 0.718, 0.822, 0.916, 0.982, 1.018,
    1.028, 1.025, 1.016, 1.008, 1.003, 1.0
  );

  /* Quick — near-instant micro-interactions */
  --ease-spring-quick: linear(
    0, 0.02, 0.075, 0.165, 0.29, 0.44, 0.607, 0.774, 0.908, 0.985,
    1.012, 1.008, 1.002, 1.0
  );
}
```

For JavaScript-driven interactions (drag, flick, velocity handoff), use a
proper spring library (Motion/Framer Motion, GSAP, or a custom solver).
See `references/motion-system.md` for the velocity handoff code, momentum
projection function, and rubber-banding formula.

### Interaction Patterns

**Button press:**
```css
.btn {
  transition: transform 80ms var(--ease-spring-quick);
  cursor: pointer;
  touch-action: manipulation; /* kill 300ms tap delay */
}
.btn:active {
  transform: scale(var(--press-scale)); /* 0.92 Funk / 0.96 Flow */
}
```

**Hover lift (Funk):**
```css
[data-funky-mode="funk"] .card:hover {
  transform: translateY(-3px) rotate(0.5deg);
  transition: transform 300ms var(--ease-spring-bouncy);
}
```

**Hover lift (Flow):**
```css
[data-funky-mode="flow"] .card:hover {
  transform: translateY(-2px);
  transition: transform 250ms var(--ease-spring-snappy);
}
```

**Scroll reveal (one-shot):**
```css
.reveal {
  opacity: 0;
  transform: translateY(12px);
}
.reveal.visible {
  opacity: 1;
  transform: translateY(0);
  transition: opacity 400ms ease-out, transform 400ms var(--ease-spring-snappy);
}
```

Trigger with IntersectionObserver, fire once, never re-trigger on scroll back.

---

## § 8 — Elevation & Shadows

Elevation is how Funky Design creates depth and hierarchy. In Funk mode,
shadows are **colored and hard-offset** — a signature visual. In Flow mode,
shadows are **neutral and soft-blurred** — conventional but warm.

### Elevation Tokens

| Token | Flow 🌊 (soft, neutral) | Funk 🎸 (hard, colored) |
|---|---|---|
| `--elevation-0` | none | none |
| `--elevation-1` | `0 1px 3px oklch(20% 0 0 / 0.08)` | `0 2px 0 var(--shadow-accent, oklch(20% 0 0 / 0.15))` |
| `--elevation-2` | `0 4px 12px oklch(20% 0 0 / 0.1)` | `0 6px 0 var(--shadow-accent, oklch(20% 0 0 / 0.2))` |
| `--elevation-3` | `0 8px 24px oklch(20% 0 0 / 0.12)` | `0 8px 0 var(--shadow-accent, oklch(20% 0 0 / 0.25))` |
| `--elevation-pressed` | `0 1px 2px oklch(20% 0 0 / 0.06)` | `0 1px 0 var(--shadow-accent, oklch(20% 0 0 / 0.1))` |

### Colored Shadows (Funk Mode)

In Funk mode, set `--shadow-accent` on a component to tint its shadow with
the nearest accent color:

```css
[data-funky-mode="funk"] .btn-primary {
  --shadow-accent: oklch(68% 0.19 30 / 0.25); /* Coral shadow */
  box-shadow: var(--elevation-2);
}

[data-funky-mode="funk"] .card-feature {
  --shadow-accent: oklch(55% 0.22 300 / 0.2); /* Violet shadow */
  box-shadow: var(--elevation-2);
}
```

### Shadow Behavior

- **Hover:** shadow grows from current level to next level up (1→2, 2→3)
- **Press:** shadow compresses to `elevation-pressed`
- **Disabled:** shadow drops to `elevation-0` (flat)
- **Transition:** shadow changes use the same spring easing as the element's
  transform, keeping motion unified

### Rules

1. Shadows on the Deep-Dark palette use lighter accent tones (glow effect)
   rather than darker shadows (which would be invisible).
2. Never stack shadows — one `box-shadow` per element.
3. Shadow direction is always downward (positive Y offset). No upward, left,
   or right shadows.
4. Text never gets drop shadows.

---

## § 9 — Spacing System

A 4px base unit with named tokens. Consistent across all modes and palettes.

### Spacing Tokens

| Token | Value | Common Use |
|---|---|---|
| `--space-0` | `0` | Reset |
| `--space-0.5` | `2px` | Hairline gaps, icon-to-label |
| `--space-1` | `4px` | Tight padding, badge insets |
| `--space-2` | `8px` | Small gaps, chip padding |
| `--space-3` | `12px` | Input padding, compact card insets |
| `--space-4` | `16px` | Standard padding, card insets |
| `--space-5` | `20px` | Comfortable padding |
| `--space-6` | `24px` | Section padding (mobile), card gaps |
| `--space-8` | `32px` | Section padding (tablet), group gaps |
| `--space-10` | `40px` | Large gaps |
| `--space-12` | `48px` | Section padding (desktop) |
| `--space-16` | `64px` | Major section separators |
| `--space-20` | `80px` | Hero padding |
| `--space-24` | `96px` | Page-level vertical breathing room |

### Layout Rules

1. **Container max-width:** `1200px` with `--space-6` horizontal padding
   on mobile, `--space-8` on tablet, `--space-12` on desktop.

2. **Component internal spacing:** Use `--space-2` to `--space-4` inside
   components (button padding, card insets, input padding).

3. **Component gap spacing:** Use `--space-4` to `--space-8` between
   sibling components (card-to-card, button-to-button, field-to-field).

4. **Section spacing:** Use `--space-12` to `--space-24` between page
   sections.

5. **Consistent axis:** If horizontal padding is `--space-4`, vertical
   padding is `--space-4` or `--space-6` — never more than 1.5x the
   horizontal value.

---

## § 10 — Component Patterns

These are behavioral patterns, not rigid implementations. Each pattern
defines the required visual properties, interaction states, and mode
differences. See `references/components.md` for HTML/CSS code.

### 10.1 Button

| Property | Funk 🎸 | Flow 🌊 |
|---|---|---|
| Shape | `pill` | `pill` |
| Press | Scale 0.92, shadow→pressed, spring bounce-back | Scale 0.96, shadow→pressed, smooth settle |
| Hover | Lift 3px, rotate 0.5deg, shadow grows | Lift 2px, shadow grows |
| Shadow | Colored (accent-tinted) | Neutral soft |
| Focus | 2px accent ring, 2px offset | 2px accent ring, 2px offset |
| Disabled | 50% opacity, no shadow, no interaction | Same |

Variants: Primary (accent bg + light text), Secondary (surface bg + accent
border), Ghost (transparent bg + accent text), Destructive (Fuchsia).

### 10.2 Card

| Property | Funk 🎸 | Flow 🌊 |
|---|---|---|
| Shape | `md` or asymmetric (`24px 8px 24px 8px`) | `md` (consistent radii) |
| Hover | Lift 4px, corners morph md→lg, shadow grows | Lift 2px, shadow grows |
| Shadow | Colored `elevation-2` | Neutral `elevation-1` |
| Border | Optional accent border-left/top | Optional subtle border |

### 10.3 Navigation

- **Always opaque.** Never translucent. Never uses `backdrop-filter`.
- Surface color from the palette's `--surface-2`.
- Layout: logo left, links center, primary action right.
- Mobile: collapses to hamburger or bottom nav.
- Sticky behavior: stays at top with a subtle border-bottom or shadow
  on scroll.

### 10.4 Dialog / Modal

- Surface: `--surface-2` with `--shape-lg` corners.
- Entry: scales from 0.95→1.0 with `spring-gentle`, anchored to trigger.
- Backdrop: `--surface-overlay` with fade-in.
- Dismissal: scale 1.0→0.95 + fade-out along the same path.
- Focus trap: keyboard focus cycles within the dialog.

### 10.5 Input Fields

- Shape: `--shape-sm` radius.
- Border: `--border-default`, transitions to accent color on focus.
- Focus ring: 2px accent-colored outline, 2px offset.
- Padding: `--space-3` vertical, `--space-4` horizontal.
- Labels: above the field, never floating/animated.

### 10.6 Chips & Tags

- Shape: `pill`.
- Background: accent color at 100 tone (light) with 800 tone text.
- Small shadow (`elevation-1`) in Funk; no shadow in Flow.
- Press: scale 0.95, spring-quick.

### 10.7 Toast / Notification

- Enters from bottom-right (desktop) or bottom-center (mobile).
- Spring animation: `spring-bouncy` in Funk, `spring-snappy` in Flow.
- Auto-dismiss with a progress bar (accent color, shrinking width).
- Manual dismiss: swipe away or X button.

### 10.8 Tabs

- **Funk:** Active tab indicator morphs shape and slides with spring.
- **Flow:** Active underline slides with `spring-snappy`.
- Tab text: `--type-body` weight 500 (inactive), 600 (active).
- Active color: accent primary. Inactive: `--text-secondary`.

### 10.9 Toggle / Switch

- Track: pill-shaped, transitions from `--border-default` to accent color.
- Thumb: circle, moves with `spring-bouncy` in Funk / `spring-quick` in Flow.
- Press: thumb compresses slightly (scale 0.9 on the movement axis).

### 10.10 Avatar

- Shape: squircle (clip-path).
- Status indicator: small circle at bottom-right, Lime for online, Coral for busy,
  Slate for offline.
- Sizes: 24px (inline), 32px (compact), 40px (standard), 64px (profile).

### 10.11 Hero Section

- Typography: `--type-display-xl` for headline.
- Background: palette surface-base or optional mesh gradient.
- Primary CTA: Button (primary), prominent and above the fold.
- Proof element: one image, stat, or screenshot beside/below the headline.

### 10.12 Loading Indicator

- **Funk:** Morphing shape — circle → squircle → rounded-rect → circle,
  rotating gently, accent-colored.
- **Flow:** Simple pulse animation on a circle or dot pattern.
- Size: 24px (inline), 40px (section), 80px (page).
- Reduced motion: static icon with aria-live announcement only.

---

## § 11 — Accessibility (Non-Negotiable)

These rules override everything above. No design decision, no matter how
funky, may violate accessibility requirements.

### Contrast

- **Body text:** minimum 4.5:1 contrast ratio against its background.
- **Large text** (≥18px bold or ≥24px): minimum 3:1.
- **UI components and graphical objects:** minimum 3:1 against adjacent colors.
- **Focus indicators:** 3:1 against both the component and the background.

### Media Queries

Respond to ALL three preference queries:

```css
/* Replace all springs with simple cross-fades */
@media (prefers-reduced-motion: reduce) {
  * {
    animation-duration: 0.01ms !important;
    transition-duration: 200ms !important;
    transition-timing-function: ease !important;
  }
  .reveal { transform: none !important; opacity: 1 !important; }
}

/* Make surfaces more opaque, increase contrast */
@media (prefers-contrast: more) {
  :root {
    --border-default: var(--border-strong);
    --text-secondary: var(--text-primary);
  }
}

/* Respect system color scheme preference */
@media (prefers-color-scheme: dark) {
  :root:not([data-funky-palette]) {
    /* Auto-switch to Midnight palette if no explicit palette set */
  }
}
```

### Interaction

- **Focus indicators:** 2px solid accent-colored outline with 2px offset.
  Never hidden. Never replaced by only a color change.
- **Touch targets:** minimum 44×44px on all interactive elements.
- **Keyboard navigation:** tab order matches visual reading order.
  All interactive elements are reachable via keyboard.
- **Screen readers:** all animated reveals are visible to assistive tech
  from the start (use `opacity` for visual effect, not `display: none`).
  Morphing shapes and moving elements are decorative and use `aria-hidden`.
- **Skip links:** provided on pages with navigation.

### Motion Safety

- No animation loops covering more than 25% of the viewport.
- No oscillations near 0.2Hz (one cycle per 5 seconds) — this frequency
  can trigger vestibular discomfort.
- No sudden full-screen brightness changes.
- Fade large surfaces during repositioning and fade back once settled.

---

## § 12 — What's Banned

These items are **never** permitted in a Funky Design product, regardless
of mode:

1. **Pure white** (`#ffffff`) or **pure black** (`#000000`) as a surface color.
   All surfaces must have tint/temperature.

2. **`backdrop-filter: blur()`** on any surface. No frosted glass, no
   translucent panels. Surfaces are opaque and confident.

3. **Gradient text.** Never apply gradients as text fill — it's illegible,
   inaccessible, and not Funky.

4. **More than 3 vibrant accents per viewport** (Funk) or **2** (Flow).
   Slate (neutral) doesn't count toward this limit.

5. **Infinite animation loops** covering more than 25% of the viewport.
   A small loading spinner is fine; a full-screen pulsing background is not.

6. **Auto-playing video backgrounds.** They're inaccessible, heavy, and
   distracting. If video is content, give the user play controls.

7. **Drop shadows on text.** Use color contrast and weight for text emphasis,
   never shadows.

8. **`!important` in design token overrides.** Tokens cascade; overriding
   them with `!important` breaks the system. The only exception is the
   `prefers-reduced-motion` safety override.

9. **Floating labels on inputs.** Labels go above the field, always visible.
   Floating labels are an accessibility hazard.

10. **Scroll hijacking.** Never override native scroll behavior. Scroll-driven
    animations are fine; taking over the scroll position is not.

---

## § 13 — Implementation Quick-Start

### HTML Setup

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="funky-tokens.css" />
  <link rel="preload" href="/fonts/Satoshi-Variable.woff2"
        as="font" type="font/woff2" crossorigin />
</head>
<body data-funky-mode="funk" data-funky-palette="sunlit">
  <!-- Your app -->
</body>
</html>
```

### Token File Structure

```
funky-tokens.css          ← All CSS custom properties
├─ palette: sunlit        ← Surface colors
├─ palette: overcast
├─ palette: midnight
├─ mode: funk             ← Mode-specific overrides
├─ mode: flow
├─ colors                 ← 7 accent roles × tonal ramp
├─ typography             ← Font stacks + type scale
├─ shape                  ← Border-radius tokens
├─ motion                 ← Spring easing functions
├─ elevation              ← Shadow tokens
└─ spacing                ← Space scale
```

### Tailwind Integration

A Tailwind preset extends the default config with Funky Design tokens:

```js
// funky.config.js — use as a Tailwind preset
module.exports = {
  theme: {
    extend: {
      colors: {
        coral: { 50: '...', 100: '...', /* ...full ramp */ },
        violet: { /* ... */ },
        teal: { /* ... */ },
        amber: { /* ... */ },
        fuchsia: { /* ... */ },
        lime: { /* ... */ },
        slate: { /* ... */ },
      },
      borderRadius: {
        'funky-xs': 'var(--shape-xs)',
        'funky-sm': 'var(--shape-sm)',
        'funky-md': 'var(--shape-md)',
        'funky-lg': 'var(--shape-lg)',
        'funky-xl': 'var(--shape-xl)',
        'funky-pill': 'var(--shape-pill)',
      },
      transitionTimingFunction: {
        'spring-bouncy': 'var(--ease-spring-bouncy)',
        'spring-snappy': 'var(--ease-spring-snappy)',
        'spring-gentle': 'var(--ease-spring-gentle)',
        'spring-quick': 'var(--ease-spring-quick)',
      },
      fontFamily: {
        display: 'var(--font-display)',
        body: 'var(--font-body)',
        mono: 'var(--font-mono)',
      },
    },
  },
};
```

See `references/tokens.md` for the complete token map and Tailwind preset.

---

## § 14 — Design Checklist

Before shipping any page, verify ALL items pass:

### Visual
- [ ] Mode is set (Funk or Flow) — one mode per page
- [ ] Palette is set (Sunlit, Overcast, or Midnight)
- [ ] No pure white or pure black surfaces
- [ ] Accent count per viewport within limit (3 Funk / 2 Flow)
- [ ] Primary action visible above the fold, highest contrast
- [ ] Squint test: headline, CTA, and sections distinguishable when blurred

### Typography
- [ ] Headlines use Satoshi (display font), body uses system font
- [ ] Type hierarchy uses weight + size, never color alone
- [ ] All text in `rem`/`em` — no `px` for type sizes

### Motion
- [ ] Every interactive element has a press state on pointer-down
- [ ] Springs used for transform animations, transitions for color/opacity
- [ ] `prefers-reduced-motion` handled — all motion replaceable
- [ ] No infinite loops covering >25% of viewport

### Accessibility
- [ ] Body text: 4.5:1 contrast ratio minimum
- [ ] Large text: 3:1 contrast ratio minimum
- [ ] Focus indicators: visible, 2px accent outline
- [ ] Touch targets: 44×44px minimum
- [ ] Keyboard navigation: tab order matches visual order
- [ ] `prefers-contrast: more` handled

### Bans
- [ ] No `backdrop-filter: blur()` on any surface
- [ ] No gradient text
- [ ] No floating labels
- [ ] No scroll hijacking
- [ ] No auto-playing video backgrounds
