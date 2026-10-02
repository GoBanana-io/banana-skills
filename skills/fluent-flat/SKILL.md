---
name: fluent-flat
description: "Fluent-flat: flat opaque web-app theme inspired by Fluent, not affiliated with Microsoft. Use for dense dashboards, admin and B2B web apps needing calm, contrasty hierarchy. Solid surfaces only, crisp edges, no gradients."
---

# fluent-flat — flat opaque web-app theme

Inspired by Fluent. Not affiliated with Microsoft.

Dense dashboards, admin tools, and B2B web apps that need calm order and contrasty hierarchy. Flat solid surfaces, crisp edges, depth from order — not from effects.

## 0. Initial response + how to use

Initial response (flat voice, one line):

> Ready — flat, solid, and ordered. Tell me the viewport and I will apply fluent-flat.

### Priority order (follow in this order)

1. Non-negotiables (contrast, focus, reduced-motion, labels) — never trade away.
2. Surfaces — pick light, dark, or high-contrast set. Opaque fills only.
3. Color — one accent per viewport, semantic roles only.
4. Shape — fixed role-based radii, never animate corners.
5. Type — system stack, size + weight hierarchy, fluid sizes.
6. Motion — short ease-out fades and slides only.

### Reference files

This SKILL.md is the constitution; details live in `references/`.

| File | Contents |
| ---- | -------- |
| `references/color-tokens.md` | Full token tables (light, dark, high-contrast) plus theme-scoped CSS |
| `references/shape-system.md` | Fixed radii, role assignment, corner rules |
| `references/typography.md` | System stack, fluid scale, hierarchy rules |
| `references/components.md` | Twelve component patterns with states and CSS |
| `references/usage.md` | When to use, vs funky-design, AI-tool install |

### Install

Project-level install (copy, not symlink):

```bash
mkdir -p .claude/skills && cp -r <path-to>/banana-skills/skills/fluent-flat .claude/skills/
# equivalents: .muse/skills/ , .gemini/skills/ , .codex/skills/
```

Copy the token blocks from `references/color-tokens.md` into your base stylesheet, scoped per theme with `data-fluent-theme`. Tailwind mapping (optional): map each token to your Tailwind theme (for example `colors.surface-base → var(--surface-base)`). Keep token names identical so designs stay portable.

## 1. Philosophy — five pillars

1. **Flat and certain.** Every surface is solid and opaque with a crisp edge. Hierarchy comes from placement, borders, and contrast — not from layering effects.
2. **Focus is the feature.** One primary action and one primary viewport at a time. Everything else stays quiet until needed.
3. **Coherent everywhere.** Same tokens, same behaviors, same density on every screen. No one-off colors, radii, or timings.
4. **Contrast you can prove.** Body text 4.5:1 minimum, large text and UI affordances 3:1 minimum. Check with a ratio tool, not by eye.
5. **Calm motion.** Motion acknowledges, then settles. Short, linear-feeling ease-out moves; never bouncy, never decorative.

## 2. Surfaces — flat opaque tokens only

Surfaces are always 100% opaque. No see-through fills, no background softening, no layered material finishes. Use borders for separation first, then one restrained shadow (see §7).

### Light set

| Token | Hex | Use |
| ----- | --- | --- |
| `--surface-base` | `#FFFFFF` | Page, dialog face |
| `--surface-raised` | `#F5F5F5` | Cards, panels, menus |
| `--surface-sunken` | `#EAEAEA` | Wells, table header track, pressed state |
| `--surface-accent-tint` | `#E6F0FA` | Selected row, tinted callout backplate (pair with accent text) |
| `--border-strong` | `#D1D1D1` | Card and input outlines |
| `--border-subtle` | `#E5E5E5` | Dividers, table rules |
| `--text-primary` | `#1B1B1B` | Headings, body |
| `--text-secondary` | `#4A4A4A` | Captions, placeholders (large/bold only for small sizes) |
| `--text-on-accent` | `#FFFFFF` | Text on solid accent fills |

### Dark set

| Token | Hex | Use |
| ----- | --- | --- |
| `--surface-base` | `#111111` | Page |
| `--surface-raised` | `#242424` | Cards, panels, menus |
| `--surface-sunken` | `#0A0A0A` | Wells, pressed state |
| `--surface-accent-tint` | `#12314F` | Selected row, tinted callout (pair with light tint text) |
| `--border-strong` | `#3A3A3A` | Card and input outlines |
| `--border-subtle` | `#2A2A2A` | Dividers |
| `--text-primary` | `#FFFFFF` | Headings, body |
| `--text-secondary` | `#C7C7C7` | Secondary copy |
| `--text-on-accent` | `#FFFFFF` | Text on solid accent fills |

### High-contrast set

| Token | Hex | Use |
| ----- | --- | --- |
| `--surface-base` | `#000000` | Page |
| `--surface-raised` | `#000000` | Cards (separate by 2px borders, not fill) |
| `--surface-sunken` | `#1A1A1A` | Wells |
| `--border-strong` | `#FFFFFF` | All outlines, 2px on inputs |
| `--border-subtle` | `#FFFFFF` | Dividers |
| `--text-primary` | `#FFFFFF` | All copy |
| `--text-secondary` | `#FFFFFF` | All copy (no gray text here) |
| `--focus-ring` | `#FFFF00` | Focus outline, 3px |

Rules:

- Never place `--text-secondary` on tinted fills unless the pair passes 4.5:1.
- Dark tint backplates pair only with near-white text.
- High-contrast mode uses borders and weight for structure, never fill shifts alone.

## 3. Color — semantic accent roles

One accent family per viewport. Maximum two accent usages per viewport (for example primary button + selected nav item).

| Role | Light hex | Dark hex | Use |
| ---- | --------- | -------- | --- |
| `--accent-rest` | `#0078D4` | `#4CC2FF` | Primary button fill (light: white text; dark: black text `#001926`), links, selected indicator |
| `--accent-hover` | `#106EBE` | `#66CCFF` | Hover fill only |
| `--accent-pressed` | `#005A9E` | `#338FCC` | Pressed fill only |
| `--accent-tint-bg` | `#E6F0FA` | `#12314F` | Tint backplate |
| `--accent-tint-text` | `#004578` | `#D6EDFF` | Text or icon on tint backplate |
| `--success` | `#107C10` | `#7DC67D` | Success text, icon, border |
| `--warning` | `#835C00` | `#F5C211` | Warning text, icon (never as sole carrier) |
| `--danger` | `#C42B1C` | `#FF99A4` | Error text, destructive action |
| `--focus-ring` | `#0078D4` | `#4CC2FF` | 2px focus outline (3px `#FFFF00` in high-contrast) |

Tint-pairing rules:

- Tints are for information and selection, never for primary actions.
- Tint backplate + tint text travel as a pair from the same row above. Never mix light tint with dark text or the reverse.
- Solid accent fills carry only `--text-on-accent` (light) or `#001926` (dark). Verify each pair.
- Status colors always pair with text or an icon label — color alone never carries meaning.
- Charts and badges: solid fills only, no gradient fills, no washed multi-color fills. Adjacent series must differ in lightness as well as hue.

## 4. Shape — static role-based radii

Fixed scale, fixed roles, square corners where structure matters. Radii never animate and never change on hover, press, or resize.

| Token | Value | Use |
| ----- | ----- | --- |
| `--radius-xs` | `2px` | Checkboxes, badges, focus inner cut |
| `--radius-focus` | `2px` | Focus ring shape (matches control) |
| `--radius-sm` | `4px` | Buttons, inputs, menus, tooltips |
| `--radius-md` | `6px` | Cards, tables, panels |
| `--radius-lg` | `8px` | Dialogs, drawers, large sheets |

Rules:

- Table headers and toolbars inherit the container radius; inner rows stay square.
- Keep symmetric corners on all components. No pill-only navigation, no cut or notched corners.
- Icons are square-cut; do not round icon art itself to fake a shape.
- High-contrast keeps the same radii; separation comes from thicker borders.

## 5. Typography — system stack, fluid, weight-led

System stack only — no webfont download, no fallback swap:

```css
font-family: -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
```

Scale (fluid with `clamp()` + `rem`, `1rem = 16px`):

| Role | Size | Weight | Use |
| ---- | ---- | ------ | --- |
| Display | `clamp(1.75rem, 1.4rem + 1.5vw, 2.25rem)` | 700 | Page title, one per viewport |
| Section | `clamp(1.25rem, 1.1rem + 0.6vw, 1.5rem)` | 600 | Card and dialog titles |
| Body | `1rem` | 400 | Default copy, table cells |
| Secondary | `0.875rem` | 400 / 600 | Captions (600 when small gray text is unavoidable) |
| Label | `0.875rem` | 600 | Field labels above inputs, nav items |
| Code | `0.875rem` | 400, monospace | `ui-monospace, Consolas, monospace` |

Rules:

- Hierarchy from size + weight, never from color alone.
- Line length 45–75 characters for prose; line-height 1.5 body, 1.25 headings.
- Labels sit above inputs, always visible — never placeholder-only.
- Numbers in tables use tabular figures (`font-variant-numeric: tabular-nums`).

## 6. Motion — restrained, 150–250ms, ease-out only

Motion confirms an action, then stops. Two patterns only: fade and short slide.

| Token | Value | Use |
| ----- | ----- | --- |
| `--motion-fast` | `150ms ease-out` | Hover fades, tooltip in, focus fade |
| `--motion-base` | `200ms ease-out` | Menus, popovers, tab switches |
| `--motion-slow` | `250ms ease-out` | Dialogs, drawers (fade + 8px rise max) |

Rules:

- Opacity and 4–8px vertical shifts only. No scale pops, no rotation, no corner animation, no elastic or bouncy easing.
- One motion per event. A dialog either fades or rises — never both with separate timings.
- `prefers-reduced-motion: reduce` disables all slide and fade: show the end state instantly.
- Loading uses a stepped opacity pulse or indeterminate bar — never a spinning decorative pattern longer than the task.

## 7. Elevation — borders first, one quiet shadow

Depth order: border, then fill order, then a single downward offset shadow for floating layers only.

- Cards and tables: `1px solid var(--border-strong)`, no shadow.
- Menus, popovers, tooltips: border + `--shadow-float: 0 2px 8px rgb(0 0 0 / 0.14)`.
- Dialogs and drawers: border + `--shadow-float` (dark theme: `0 2px 12px rgb(0 0 0 / 0.5)`).
- Never stack two shadows on one element. Never use inward shadows for depth.
- Shadows are straight down with soft edges, same hue as the surface text (neutral black), never tinted.

## 8. Spacing and layout

- 4px base scale: `4, 8, 12, 16, 24, 32, 48`. Gaps inside controls 8px; gaps between groups 16–24px; section gaps 32–48px.
- Container: `max-width: 1200px`, 24px side padding, centered. Dense tables may stretch to 1400px.
- Targets: 44px minimum touch target for buttons, nav, and icon actions; 32px minimum for dense table row controls with 8px clearance.
- Forms: single column, label above field, 12px label-to-field gap, 16px field-to-field gap, helper text under the field.
- Keyboard order equals visual order. Roving focus in toolbars, menus, and tab lists; visible focus ring on every stop.

## 9. Components — twelve flat patterns

Each pattern lists structure, states, and the non-negotiable check.

1. **Button.** Solid accent (primary), solid raised fill with border (secondary), text-only (quiet). States: rest, hover (accent-hover), pressed, disabled (50% opacity + `aria-disabled`), focus-visible ring. Min height 32px, padding 12px–16px.
2. **Input / textarea.** Sunken or base fill, 1px strong border, 4px radius, label above. States: rest, hover border, focus (2px ring), error (danger border + message + icon), disabled. Error text always includes an icon.
3. **Select / combobox.** Same frame as input plus chevron; listbox uses menu pattern. Keyboard: arrows move, Enter picks, Esc closes.
4. **Checkbox / radio.** 16px box (2px radius) or 16px circle, 2px border, solid accent check. Focus ring on the control. Group label above, never color-only required marks.
5. **Switch.** 40×20px track, 12px knob, solid accent track when on. Label adjacent; state announced in text, not color alone.
6. **Card.** Raised fill, 1px strong border, 6px radius, 16–24px padding, one title + one primary action max. No shadow at rest.
7. **Table.** Header in sunken fill with 600-weight labels; row dividers in subtle border; selected row in accent tint pair; sortable headers announce sort direction in text.
8. **Dialog / drawer.** Base fill, 8px radius, border + float shadow, title + close + one primary action. Focus trap while open, Esc closes, focus returns to the trigger.
9. **Menu / popover.** Raised fill, 4px radius, border + float shadow, 32px+ rows, checkmark plus `aria-checked` for selections. Opens on 200ms fade; closes on outside press or Esc.
10. **Tabs.** Text tabs with 2px accent underline for the active tab; content swaps on 200ms fade. Tab list uses arrow-key navigation.
11. **Nav rail / sidebar.** 240px rail, label-led items, active item uses tint pair + 2px accent bar. One expanded section at a time.
12. **Toast / badge / callout.** Solid fills: tint pair for info, solid status colors with white text for counts. Toast auto-dismisses, keeps a close button, and never blocks the primary action.

## 10. Accessibility — non-negotiable

- Contrast: 4.5:1 body, 3:1 large text and UI boundaries. Verify every token pair, including tints.
- Focus: 2px solid `--focus-ring` on all interactive elements (`:focus-visible`), 3px `#FFFF00` in high-contrast, offset 2px so the ring never overlaps text.
- Reduced motion, high-contrast mode, and `color-scheme` preferences honored: `@media (prefers-reduced-motion: reduce)`, `@media (prefers-contrast: more)`, and `color-scheme: light dark`.
- Form labels always visible above fields; errors tied with `aria-describedby`; required fields marked in text.
- Icon-only controls carry `aria-label`; status and sort state exposed in text, not hue alone.

## 11. Not allowed

Solid fills only. Do not use:

- Background softening or see-through fills of any strength.
- Named material finishes or frosted-surface treatments.
- Gradient fills, washed multi-color fills, or image fills standing in for hierarchy.
- Shadow stacks, upward or tinted shadows, or shadows as the only separator.
- Animated corners, asymmetric corner sets, or size-driven radius changes.
- Bouncy, elastic, looping, or staggered animation; parallax or scroll-linked motion.
- Placeholder-only labels, color-only status, or focus removal.

If a design needs depth, add order: borders, spacing, weight — not effects.

## 12. Quick-start — `data-fluent-*` hooks

```html
<body data-fluent-theme="light">
  <main class="page">
    <h1 class="display">Orders</h1>
    <div data-fluent-card>
      <h2 class="section">Revenue</h2>
      <button data-fluent-button="primary">New report</button>
      <button data-fluent-button="secondary">Export</button>
    </div>
    <label class="label" for="q">Search orders</label>
    <input id="q" data-fluent-input placeholder="Order number" />
  </main>
</body>
```

Minimal CSS shape (paste the theme-scoped token block from `references/color-tokens.md` above these rules):

```css
[data-fluent-button="primary"] {
  background: var(--accent-rest);
  color: var(--text-on-accent);
  border-radius: var(--radius-sm);
  min-height: 44px;
  padding: 0 16px;
}
[data-fluent-card] {
  background: var(--surface-raised);
  border: 1px solid var(--border-strong);
  border-radius: var(--radius-md);
}
```

Theme switch: set `data-fluent-theme="light" | "dark" | "high-contrast"` on `<html>` or `<body>` and redefine the same token names per value. No other changes.

## 13. Checklist before ship

- [ ] One accent per viewport, max two accent usages.
- [ ] All fills opaque; separation visible with effects disabled.
- [ ] Every text and tint pair passes its ratio; focus ring visible on each control.
- [ ] Radii from the fixed scale; no animated or asymmetric corners.
- [ ] Type hierarchy works without color; labels above every input.
- [ ] Motion is 150–250ms ease-out fade or short slide only; reduced-motion shows end states.
- [ ] Keyboard path matches visual order; dialogs trap and return focus.
- [ ] `references/color-tokens.md` is the only source of color values; radii, type, and motion match this document.

## Tokens pointer

Full token values live in `references/color-tokens.md`. Treat that file as normative: if this document and it disagree, follow `references/color-tokens.md` and file a fix against this document. Tailwind, CSS-in-JS, or design-tool variables must map 1:1 to those token names — no renamed or forked values.

## When to use fluent-flat (and when not to)

Use fluent-flat for: dense operational dashboards, admin consoles, settings and detail forms, data tables and queues, internal B2B tools where scanning speed and error avoidance matter.

Do not use it for: marketing pages, brand storytelling, games, media galleries, or playful consumer surfaces that need expressive shape, large imagery, or characterful motion. Those briefs need a different theme.

Versus expressive themes: pick fluent-flat when the win condition is clarity under density — many rows, many controls, long sessions. Pick an expressive theme when the win condition is memorability or persuasion. Never blend the two in one viewport.
