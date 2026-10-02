# fluent-flat — color tokens

All fills are 100% opaque solid hex. No see-through fills, no background
softening, no gradient fills. Every text pair below passes 4.5:1 for body
copy; every large-text and UI-affordance pair passes 3:1 at minimum.
Ratios were checked with a standard WCAG contrast tool.

## 1. Light theme — surfaces and text

| Token | Hex | Use |
| ----- | --- | --- |
| `--surface-base` | `#FFFFFF` | Page, dialog face |
| `--surface-raised` | `#F5F5F5` | Cards, panels, menus |
| `--surface-sunken` | `#EAEAEA` | Wells, table header track, pressed state |
| `--surface-accent-tint` | `#E6F0FA` | Selected row, tinted callout backplate |
| `--border-strong` | `#D1D1D1` | Card and input outlines |
| `--border-subtle` | `#E5E5E5` | Dividers, table rules |
| `--text-primary` | `#1B1B1B` | Headings, body |
| `--text-secondary` | `#4A4A4A` | Captions, helper text |
| `--text-on-accent` | `#FFFFFF` | Text on solid accent fills |
| `--focus-ring` | `#0078D4` | 2px focus outline |

## 2. Dark theme — surfaces and text

| Token | Hex | Use |
| ----- | --- | --- |
| `--surface-base` | `#111111` | Page |
| `--surface-raised` | `#242424` | Cards, panels, menus |
| `--surface-sunken` | `#0A0A0A` | Wells, pressed state |
| `--surface-accent-tint` | `#12314F` | Selected row, tinted callout |
| `--border-strong` | `#3A3A3A` | Card and input outlines |
| `--border-subtle` | `#2A2A2A` | Dividers |
| `--text-primary` | `#FFFFFF` | Headings, body |
| `--text-secondary` | `#C7C7C7` | Secondary copy |
| `--text-on-accent` | `#FFFFFF` | Text on solid accent fills |
| `--focus-ring` | `#4CC2FF` | 2px focus outline |

## 3. High-contrast theme — surfaces and text

| Token | Hex | Use |
| ----- | --- | --- |
| `--surface-base` | `#000000` | Page |
| `--surface-raised` | `#000000` | Cards (separate with 2px borders, not fill) |
| `--surface-sunken` | `#1A1A1A` | Wells |
| `--border-strong` | `#FFFFFF` | All outlines, 2px on inputs |
| `--border-subtle` | `#FFFFFF` | Dividers |
| `--text-primary` | `#FFFFFF` | All copy |
| `--text-secondary` | `#FFFFFF` | All copy (no gray text here) |
| `--focus-ring` | `#FFFF00` | Focus outline, 3px |

## 4. Accent roles (one family per viewport, max two accent usages)

| Role | Light hex | Dark hex | Use |
| ---- | --------- | -------- | --- |
| `--accent-rest` | `#0078D4` | `#4CC2FF` | Primary button fill, links, selected indicator |
| `--accent-hover` | `#106EBE` | `#66CCFF` | Hover fill only |
| `--accent-pressed` | `#005A9E` | `#338FCC` | Pressed fill only |
| `--accent-tint-bg` | `#E6F0FA` | `#12314F` | Tint backplate |
| `--accent-tint-text` | `#004578` | `#D6EDFF` | Text or icon on tint backplate |
| `--accent-ink-on-dark` | `#001926` | `#001926` | Text on light accent fills in dark theme |

Rules:

- Solid accent fills carry only `--text-on-accent` in light theme or
  `#001926` in dark theme. Never place gray text on an accent fill.
- Tint backplate and tint text travel as a pair from the same row above.
  Never mix a light tint with a dark-theme tint text or the reverse.
- Tints mark information and selection only, never primary actions.

## 5. Status roles (always paired with text or an icon label)

| Role | Light hex | Dark hex | Use |
| ---- | --------- | -------- | --- |
| `--success` | `#107C10` | `#7DC67D` | Success text, icon, border |
| `--warning` | `#835C00` | `#F5C211` | Warning text, icon (never the sole carrier) |
| `--danger` | `#C42B1C` | `#FF99A4` | Error text, destructive action |

Status colors never carry meaning alone. Error fields add a danger border
plus a message plus an icon. Charts and badges use solid fills only;
adjacent series must differ in lightness as well as hue.

## 6. Approved pairs (measured ratios)

Body pairs must reach 4.5:1. Large text (18.66px bold and up, 24px
regular and up) and UI affordances must reach 3:1.

| Foreground | Background | Ratio | Verdict |
| ---------- | ---------- | ----- | ------- |
| `#1B1B1B` | `#FFFFFF` | 17.22:1 | Pass body |
| `#4A4A4A` | `#FFFFFF` | 8.86:1 | Pass body |
| `#FFFFFF` | `#0078D4` | 4.53:1 | Pass body |
| `#FFFFFF` | `#106EBE` | 5.26:1 | Pass body |
| `#FFFFFF` | `#005A9E` | 7.10:1 | Pass body |
| `#004578` | `#E6F0FA` | 8.58:1 | Pass body (tint pair) |
| `#107C10` | `#FFFFFF` | 5.37:1 | Pass body |
| `#835C00` | `#FFFFFF` | 6.01:1 | Pass body |
| `#C42B1C` | `#FFFFFF` | 5.66:1 | Pass body |
| `#FFFFFF` | `#111111` | 18.88:1 | Pass body (dark base) |
| `#C7C7C7` | `#242424` | 9.18:1 | Pass body (dark secondary) |
| `#D6EDFF` | `#12314F` | 11.04:1 | Pass body (dark tint pair) |
| `#001926` | `#4CC2FF` | 8.97:1 | Pass body (dark accent fill text) |
| `#7DC67D` | `#111111` | 9.21:1 | Pass body (dark success) |
| `#F5C211` | `#111111` | 11.34:1 | Pass body (dark warning) |
| `#FF99A4` | `#111111` | 9.30:1 | Pass body (dark danger) |
| `#FFFFFF` | `#000000` | 21.00:1 | Pass body (high-contrast) |
| `#FFFF00` | `#000000` | 19.56:1 | Pass body (high-contrast focus) |

Do-not-use pairs:

- `--text-secondary` `#4A4A4A` on `--surface-accent-tint` `#E6F0FA`
  (below 4.5:1) — use `--accent-tint-text` `#004578` on tint fills instead.
- Any gray text on a tinted fill except the listed tint-text pairs.
- Dark tint backplate `#12314F` with dark text — pair it only with
  near-white `#D6EDFF`.

## 7. CSS custom properties

Drop-in source of truth. Scope per theme with `data-fluent-theme`.

```css
/* fluent-flat color tokens — opaque solid fills only */
:root,
[data-fluent-theme="light"] {
  color-scheme: light;
  --surface-base: #ffffff;
  --surface-raised: #f5f5f5;
  --surface-sunken: #eaeaea;
  --surface-accent-tint: #e6f0fa;
  --border-strong: #d1d1d1;
  --border-subtle: #e5e5e5;
  --text-primary: #1b1b1b;
  --text-secondary: #4a4a4a;
  --text-on-accent: #ffffff;
  --accent-rest: #0078d4;
  --accent-hover: #106ebe;
  --accent-pressed: #005a9e;
  --accent-tint-bg: #e6f0fa;
  --accent-tint-text: #004578;
  --success: #107c10;
  --warning: #835c00;
  --danger: #c42b1c;
  --focus-ring: #0078d4;
}

[data-fluent-theme="dark"] {
  color-scheme: dark;
  --surface-base: #111111;
  --surface-raised: #242424;
  --surface-sunken: #0a0a0a;
  --surface-accent-tint: #12314f;
  --border-strong: #3a3a3a;
  --border-subtle: #2a2a2a;
  --text-primary: #ffffff;
  --text-secondary: #c7c7c7;
  --text-on-accent: #ffffff;
  --accent-rest: #4cc2ff;
  --accent-hover: #66ccff;
  --accent-pressed: #338fcc;
  --accent-tint-bg: #12314f;
  --accent-tint-text: #d6edff;
  --accent-ink-on-dark: #001926;
  --success: #7dc67d;
  --warning: #f5c211;
  --danger: #ff99a4;
  --focus-ring: #4cc2ff;
}

[data-fluent-theme="high-contrast"] {
  color-scheme: dark;
  --surface-base: #000000;
  --surface-raised: #000000;
  --surface-sunken: #1a1a1a;
  --surface-accent-tint: #1a1a1a;
  --border-strong: #ffffff;
  --border-subtle: #ffffff;
  --text-primary: #ffffff;
  --text-secondary: #ffffff;
  --text-on-accent: #ffffff;
  --accent-rest: #4cc2ff;
  --accent-hover: #66ccff;
  --accent-pressed: #338fcc;
  --accent-tint-bg: #1a1a1a;
  --accent-tint-text: #ffffff;
  --success: #7dc67d;
  --warning: #f5c211;
  --danger: #ff99a4;
  --focus-ring: #ffff00;
}
```

Usage snippets:

```css
/* Primary button — light theme: white text on solid accent */
.button-primary {
  background: var(--accent-rest);
  color: var(--text-on-accent);
  border: 1px solid transparent;
}
.button-primary:hover { background: var(--accent-hover); }
.button-primary:active { background: var(--accent-pressed); }

/* Dark theme primary button: near-black text on light accent fill */
[data-fluent-theme="dark"] .button-primary {
  background: var(--accent-rest);
  color: var(--accent-ink-on-dark);
}

/* Tinted selection row — keep bg + text paired */
.row-selected {
  background: var(--accent-tint-bg);
  color: var(--accent-tint-text);
}

/* Focus is always visible, never removed */
:focus-visible {
  outline: 2px solid var(--focus-ring);
  outline-offset: 2px;
}
[data-fluent-theme="high-contrast"] :focus-visible {
  outline-width: 3px;
}
```
