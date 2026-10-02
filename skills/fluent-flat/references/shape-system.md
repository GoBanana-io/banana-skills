# fluent-flat — shape system

Fixed role-based radii. Corners are static: they never animate and never
change on hover, press, focus, or resize. All corners on one element stay
equal. Separation comes from borders and spacing first.

## 1. Radius scale (fixed, five steps)

| Token | Value | Use |
| ----- | ----- | --- |
| `--radius-xs` | `2px` | Checkboxes, badges, small indicators |
| `--radius-focus` | `2px` | Focus ring shape (matches the control) |
| `--radius-sm` | `4px` | Buttons, inputs, selects, menus, tooltips, popovers |
| `--radius-md` | `6px` | Cards, tables, panels |
| `--radius-lg` | `8px` | Dialogs, drawers, large sheets |

No other radius values. Do not invent `10px`, `12px`, pill-only nav, cut
corners, or notched corners. When in doubt, round down to the nearest
listed step.

## 2. Component mapping

| Component | Radius | Notes |
| --------- | ------ | ----- |
| Checkbox | `2px` (`--radius-xs`) | 16px box, 2px border |
| Radio | `50%` circle exception | 16px circle, 2px border; the only round shape |
| Badge, count pill | `2px` (`--radius-xs`) | Square-cut badges; counts may use capsule only at `2px`-scale density |
| Button, input, select | `4px` (`--radius-sm`) | Matches focus ring |
| Menu, popover, tooltip | `4px` (`--radius-sm`) | Border plus float shadow (see SKILL.md §7) |
| Card, table, panel | `6px` (`--radius-md`) | 1px strong border, no shadow at rest |
| Toolbar in a card | `6px` top only via container | Inner rows stay square; header inherits the container |
| Dialog, drawer | `8px` (`--radius-lg`) | Border plus float shadow, focus trap |

Rules:

- Table headers and toolbars inherit the container radius; inner rows and
  cells stay square so rules align with the container edge.
- Keep symmetric corners on every component. Never set a single rounded
  corner or two different radii on one element.
- Icons are square-cut. Do not round icon art itself to fake a shape.
- High-contrast keeps the same radii; structure comes from thicker
  borders, not from radius changes.
- Radius never signals state. Hover, press, focus, error, and disabled
  keep the resting radius.

## 3. Borders pair with shape

Shape alone never separates a surface. Every shaped surface also carries a
border:

- Cards and tables: `1px solid var(--border-strong)`, no shadow at rest.
- Menus, popovers, tooltips: border plus `--shadow-float`.
- Dialogs and drawers: border plus `--shadow-float`.
- High-contrast: 2px borders on inputs and cards, same radii.

With fills forced equal (for example when a user forces extra contrast),
the border plus weight hierarchy must still read. Test by setting every
fill to the base fill: order and grouping must survive.

## 4. CSS custom properties

```css
/* fluent-flat shape tokens — static role-based radii */
:root {
  --radius-xs: 2px;
  --radius-focus: 2px;
  --radius-sm: 4px;
  --radius-md: 6px;
  --radius-lg: 8px;
  --shadow-float: 0 2px 8px rgb(0 0 0 / 0.14);
}

[data-fluent-theme="dark"] {
  --shadow-float: 0 2px 12px rgb(0 0 0 / 0.5);
}

[data-fluent-theme="high-contrast"] {
  --shadow-float: none;
}
```

Usage snippets:

```css
/* Buttons, inputs, menus */
.button, .input, .select, .menu, .popover {
  border-radius: var(--radius-sm);
}

/* Cards, tables, panels */
.card, .table-wrap, .panel {
  border-radius: var(--radius-md);
  border: 1px solid var(--border-strong);
  background: var(--surface-raised);
}

/* Table header inherits the container; cells stay square */
.table-wrap { overflow: clip; }
.table-wrap thead th {
  background: var(--surface-sunken);
  border-radius: 0;
}
.table-wrap td { border-radius: 0; }

/* Dialogs, drawers */
.dialog, .drawer {
  border-radius: var(--radius-lg);
  border: 1px solid var(--border-strong);
  background: var(--surface-base);
  box-shadow: var(--shadow-float);
}

/* Focus ring follows the control shape */
:focus-visible {
  outline: 2px solid var(--focus-ring);
  outline-offset: 2px;
  border-radius: var(--radius-focus);
}
```

## 5. Do and do not

Do:

- Pick the radius by role from the table, then stop.
- Let the container own the radius; keep inner rows square.
- Keep the same radii in light, dark, and high-contrast themes.

Do not:

- Animate corners on any event or transition.
- Tie radius to element size (no "larger box, larger radius" scaling).
- Use one-off radii, single rounded corners, or mixed corner sets.
- Use shape alone to signal selection, error, or hierarchy — add a
  border, label, or weight change instead.
