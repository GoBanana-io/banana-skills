# fluent-flat — typography

System stack only. No webfont download, no fallback swap, no layout shift
from font loading. Hierarchy comes from size plus weight, never from color
alone. Sizes are fluid with `clamp()` plus `rem` (`1rem = 16px`).

## 1. Font stacks

```css
/* UI text — system stack only */
:root {
  --font-ui: -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
  --font-code: ui-monospace, "Cascadia Mono", Consolas, Menlo, monospace;
}
```

- UI copy, labels, tables, and dialogs use `--font-ui`.
- Code, order numbers, and key-value identifiers use `--font-code` at
  `0.875rem`, weight 400.
- Never set a different family per component. One UI stack everywhere.

## 2. Type scale (fluid, six roles)

| Role | Size | Weight | Line-height | Use |
| ---- | ---- | ------ | ----------- | --- |
| Display | `clamp(1.75rem, 1.4rem + 1.5vw, 2.25rem)` | 700 | 1.25 | Page title, one per viewport |
| Section | `clamp(1.25rem, 1.1rem + 0.6vw, 1.5rem)` | 600 | 1.25 | Card and dialog titles |
| Body | `1rem` | 400 | 1.5 | Default copy, table cells |
| Secondary | `0.875rem` | 400 (600 when small gray text is unavoidable) | 1.5 | Captions, helper text |
| Label | `0.875rem` | 600 | 1.4 | Field labels above inputs, nav items |
| Code | `0.875rem` | 400 | 1.5 | Inline code, identifiers |

Minimums: UI copy never drops below `0.75rem`, and anything below
`0.875rem` is reserved for fine print paired with a 600 weight or a
primary-text color so it still passes 4.5:1.

## 3. CSS custom properties and classes

```css
/* fluent-flat type tokens */
:root {
  --text-display: clamp(1.75rem, 1.4rem + 1.5vw, 2.25rem);
  --text-section: clamp(1.25rem, 1.1rem + 0.6vw, 1.5rem);
  --text-body: 1rem;
  --text-small: 0.875rem;
  --leading-body: 1.5;
  --leading-heading: 1.25;
  --measure: 65ch;
}

body {
  font-family: var(--font-ui);
  font-size: var(--text-body);
  line-height: var(--leading-body);
  color: var(--text-primary);
  background: var(--surface-base);
}

.display {
  font-size: var(--text-display);
  font-weight: 700;
  line-height: var(--leading-heading);
  letter-spacing: -0.01em;
  margin: 0 0 16px;
}

.section {
  font-size: var(--text-section);
  font-weight: 600;
  line-height: var(--leading-heading);
  margin: 0 0 12px;
}

.label {
  font-size: var(--text-small);
  font-weight: 600;
  line-height: 1.4;
  display: block;
  margin: 0 0 12px;
}

.secondary, .helper {
  font-size: var(--text-small);
  line-height: var(--leading-body);
  color: var(--text-secondary);
}

code, .code {
  font-family: var(--font-code);
  font-size: var(--text-small);
}

/* Dense tables: tabular figures keep columns aligned */
table { font-variant-numeric: tabular-nums; }
```

## 4. Rules

- Hierarchy from size plus weight. A section title must still read as a
  title when printed in plain black on white.
- Labels sit above inputs and stay visible at all times. Never use a
  placeholder as the only label.
- Prose line length stays within 45–75 characters (`max-width: 65ch`).
  Body line-height is 1.5; headings use 1.25.
- One display title per viewport. Everything else steps down to section,
  label, or body.
- Gray secondary text at `0.875rem` uses weight 600, or steps up to the
  primary text color, so the pair keeps its 4.5:1 ratio on white.
  Verified: `#4A4A4A` on `#FFFFFF` is 8.86:1; `#C7C7C7` on `#242424`
  is 9.18:1.
- Links use the accent role plus an underline on hover or focus, never
  color shift alone. Link text on white uses `#106EBE` or darker for
  small sizes (`#106EBE` on `#FFFFFF` is 5.26:1).
- Truncation always keeps an accessible full name: `title` attribute or
  an expanded row, plus ellipsis in the visible cell.

## 5. Form and table patterns

```html
<!-- Label above the field, helper below, error tied with aria-describedby -->
<label class="label" for="order-id">Order number</label>
<input class="input" id="order-id" aria-describedby="order-id-help" />
<p class="secondary" id="order-id-help">Eight digits, found on the receipt.</p>
```

```css
/* Table header labels lead with weight, not color */
th {
  font-size: var(--text-small);
  font-weight: 600;
  text-align: left;
}
td { font-size: var(--text-body); }
```
