# fluent-flat — components

Flat opaque component patterns. Every fill is a solid opaque token from
`color-tokens.md`. Radii come from `shape-system.md` (2 / 4 / 6 / 8).
Motion is 150–250ms ease-out fades and short 4–8px slides only.
No see-through fills, no gradient fills, no stacked shadows,
no animated or asymmetric corners.

## Contents

1. [Button](#1-button)
2. [Input / textarea](#2-input--textarea)
3. [Card](#3-card)
4. [Navigation](#4-navigation)
5. [Dialog / drawer](#5-dialog--drawer)
6. [Badges / counts / callouts](#6-badges--counts--callouts)
7. [Focus, disabled, loading](#7-focus-disabled-loading)

---

## 1. Button

### HTML

```html
<!-- Primary: one per viewport -->
<button class="ff-button ff-button--primary">New report</button>

<!-- Secondary -->
<button class="ff-button ff-button--secondary">Export</button>

<!-- Quiet: low-emphasis action on the same fill -->
<button class="ff-button ff-button--quiet">View details</button>

<!-- Destructive -->
<button class="ff-button ff-button--danger">Delete order</button>

<!-- Disabled: keep the label, add aria-disabled -->
<button class="ff-button ff-button--primary" disabled aria-disabled="true">Saving…</button>

<!-- Loading: label announces state, bar below carries progress -->
<button class="ff-button ff-button--primary is-loading" aria-busy="true" aria-live="polite">
  <span class="ff-button__bar" aria-hidden="true"></span>
  <span>Saving…</span>
</button>
```

### CSS

```css
/* fluent-flat buttons — solid fills, 4px radius, 44px targets */
.ff-button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  min-height: 44px;
  padding: 0 16px;
  border-radius: var(--radius-sm);
  border: 1px solid transparent;
  font-family: var(--font-ui);
  font-size: 1rem;
  font-weight: 600;
  line-height: 1.4;
  cursor: pointer;
  transition: background-color 150ms ease-out, border-color 150ms ease-out;
}

/* Primary: solid accent, white text (light) / near-black text (dark) */
.ff-button--primary {
  background: var(--accent-rest);
  color: var(--text-on-accent);
  border-color: transparent;
}
.ff-button--primary:hover { background: var(--accent-hover); }
.ff-button--primary:active { background: var(--accent-pressed); }
[data-fluent-theme="dark"] .ff-button--primary { color: #001926; }

/* Secondary: raised fill framed by a strong border */
.ff-button--secondary {
  background: var(--surface-raised);
  color: var(--text-primary);
  border-color: var(--border-strong);
}
.ff-button--secondary:hover { background: var(--surface-sunken); }
.ff-button--secondary:active { background: var(--surface-sunken); }

/* Quiet: same fill as the page, accent text, underline on hover/focus */
.ff-button--quiet {
  background: var(--surface-base);
  color: var(--accent-rest);
  border-color: transparent;
  min-height: 44px;
}
.ff-button--quiet:hover { background: var(--surface-accent-tint); }
.ff-button--quiet:active { background: var(--surface-accent-tint); }

/* Destructive: solid danger fill, white text */
.ff-button--danger {
  background: var(--danger);
  color: #ffffff;
  border-color: transparent;
}
.ff-button--danger:hover { filter: brightness(0.92); }
.ff-button--danger:active { filter: brightness(0.85); }

/* Disabled and focus: shared by all variants */
.ff-button:disabled,
.ff-button[aria-disabled="true"] {
  opacity: 0.5;
  cursor: not-allowed;
}
.ff-button:focus-visible {
  outline: 2px solid var(--focus-ring);
  outline-offset: 2px;
}
[data-fluent-theme="high-contrast"] .ff-button:focus-visible {
  outline-width: 3px;
}

/* Loading: indeterminate bar above the label, stepped pulse */
.ff-button.is-loading { position: relative; overflow: clip; }
.ff-button__bar {
  position: absolute;
  left: 0; top: 0; height: 3px; width: 40%;
  background: currentcolor;
  animation: ff-slide 1.2s ease-out infinite;
}
@keyframes ff-slide {
  from { transform: translateX(-100%); }
  to { transform: translateX(250%); }
}
@media (prefers-reduced-motion: reduce) {
  .ff-button__bar { animation: none; }
}
```

### States

| State | Visual |
| ----- | ------ |
| Rest | Primary: solid `--accent-rest` + `--text-on-accent`; secondary: `--surface-raised` + `--border-strong` |
| Hover | Primary: `--accent-hover`; secondary/quiet: one-step fill shift (`--surface-sunken` / tint) |
| Pressed | Primary: `--accent-pressed`; motion is a 150ms color fade only |
| Focus | 2px `--focus-ring` outline, 2px offset (3px `#FFFF00` in high-contrast) |
| Disabled | 50% opacity, `not-allowed` cursor, `aria-disabled="true"` |
| Loading | Label + `aria-busy`, indeterminate bar; reduced-motion shows a static bar |

---

## 2. Input / textarea

### HTML

```html
<label class="ff-label" for="order-id">Order number</label>
<input class="ff-input" id="order-id" aria-describedby="order-id-help" placeholder="10024811" />
<p class="ff-helper" id="order-id-help">Eight digits, found on the receipt.</p>

<label class="ff-label" for="notes">Notes</label>
<textarea class="ff-input" id="notes" rows="3"></textarea>

<label class="ff-label" for="order-bad">Order number</label>
<input class="ff-input ff-input--error" id="order-bad" aria-invalid="true" aria-describedby="order-bad-err" value="12" />
<p class="ff-error" id="order-bad-err"><span aria-hidden="true">! </span>Enter all eight digits.</p>
```

### CSS

```css
/* fluent-flat inputs — label above, helper below, 4px radius */
.ff-label {
  display: block;
  font-size: 0.875rem;
  font-weight: 600;
  line-height: 1.4;
  color: var(--text-primary);
  margin: 0 0 12px;
}
.ff-input {
  display: block;
  width: 100%;
  min-height: 44px;
  padding: 8px 12px;
  border-radius: var(--radius-sm);
  border: 1px solid var(--border-strong);
  background: var(--surface-base);
  color: var(--text-primary);
  font-family: var(--font-ui);
  font-size: 1rem;
  line-height: 1.5;
}
textarea.ff-input { min-height: 88px; }
.ff-input:hover { border-color: var(--text-secondary); }
.ff-input:focus-visible {
  outline: 2px solid var(--focus-ring);
  outline-offset: 1px;
  border-color: var(--focus-ring);
}
.ff-input::placeholder { color: var(--text-secondary); }
.ff-input:disabled {
  opacity: 0.5;
  cursor: not-allowed;
  background: var(--surface-sunken);
}
.ff-helper {
  margin: 8px 0 0;
  font-size: 0.875rem;
  line-height: 1.5;
  color: var(--text-secondary);
}
/* Error is a triple: danger border + message + icon marker */
.ff-input--error { border: 2px solid var(--danger); }
.ff-error {
  margin: 8px 0 0;
  font-size: 0.875rem;
  font-weight: 600;
  color: var(--danger);
}
[data-fluent-theme="high-contrast"] .ff-input { border-width: 2px; }
```

### States

| State | Visual |
| ----- | ------ |
| Rest | Base fill, 1px `--border-strong`, label above |
| Hover | Border steps to `--text-secondary` |
| Focus | 2px `--focus-ring` outline; border follows the ring color |
| Error | 2px `--danger` border + bold danger message starting with `!` |
| Disabled | Sunken fill, 50% opacity, `not-allowed` |
| Loading | N/A — inputs never show progress; disable the submit button instead |

---

## 3. Card

### HTML

```html
<div class="ff-card">
  <h2 class="ff-card__title">Revenue</h2>
  <p class="ff-card__body">Net sales for the current quarter.</p>
  <button class="ff-button ff-button--secondary">Open ledger</button>
</div>

<div class="ff-card ff-card--selected" aria-current="true">
  <h2 class="ff-card__title">Selected store</h2>
  <p class="ff-card__body">Downtown branch, updated 2 hours ago.</p>
</div>
```

### CSS

```css
/* fluent-flat cards — raised fill, border, no resting shadow */
.ff-card {
  background: var(--surface-raised);
  border: 1px solid var(--border-strong);
  border-radius: var(--radius-md);
  padding: 16px;
}
@media (min-width: 720px) {
  .ff-card { padding: 24px; }
}
.ff-card__title {
  font-size: clamp(1.25rem, 1.1rem + 0.6vw, 1.5rem);
  font-weight: 600;
  line-height: 1.25;
  color: var(--text-primary);
  margin: 0 0 8px;
}
.ff-card__body {
  font-size: 1rem;
  line-height: 1.5;
  color: var(--text-primary);
  margin: 0 0 16px;
  max-width: 65ch;
}
/* Selected card: tint pair, never a shadow or color wash alone */
.ff-card--selected {
  background: var(--accent-tint-bg);
  color: var(--accent-tint-text);
  border-left: 2px solid var(--accent-rest);
}
.ff-card--selected .ff-card__title,
.ff-card--selected .ff-card__body { color: inherit; }
.ff-card:focus-visible {
  outline: 2px solid var(--focus-ring);
  outline-offset: 2px;
}
```

### States

| State | Visual |
| ----- | ------ |
| Rest | Raised fill + 1px strong border, no shadow |
| Hover | No fill or corner change; underline the card link only |
| Selected | Tint pair + 2px accent edge; label the selection in text |
| Focus | 2px ring when the card itself is interactive |
| Loading | Skeleton rows in `--surface-sunken` with a stepped opacity pulse (see §7) |

---

## 4. Navigation

### HTML

```html
<header class="ff-topbar">
  <span class="ff-topbar__brand">Orders console</span>
  <nav aria-label="Primary">
    <ul class="ff-topbar__list">
      <li><a class="ff-topbar__link is-active" href="/orders" aria-current="page">Orders</a></li>
      <li><a class="ff-topbar__link" href="/stock">Stock</a></li>
      <li><a class="ff-topbar__link" href="/settings">Settings</a></li>
    </ul>
  </nav>
</header>

<nav class="ff-rail" aria-label="Section">
  <a class="ff-rail__item is-active" href="/inbox" aria-current="page"><span>Inbox</span></a>
  <a class="ff-rail__item" href="/drafts"><span>Drafts</span></a>
  <a class="ff-rail__item" href="/archive"><span>Archive</span></a>
</nav>
```

### CSS

```css
/* fluent-flat nav — square rows, weight-led hierarchy */
.ff-topbar {
  display: flex;
  align-items: center;
  gap: 24px;
  min-height: 56px;
  padding: 0 24px;
  background: var(--surface-base);
  border-bottom: 1px solid var(--border-strong);
}
.ff-topbar__brand {
  font-size: 1rem;
  font-weight: 700;
  color: var(--text-primary);
}
.ff-topbar__list {
  display: flex;
  gap: 4px;
  list-style: none;
  margin: 0;
  padding: 0;
}
.ff-topbar__link {
  display: inline-flex;
  align-items: center;
  min-height: 44px;
  padding: 0 12px;
  font-size: 0.875rem;
  font-weight: 600;
  color: var(--text-secondary);
  text-decoration: none;
  border-bottom: 2px solid transparent;
}
.ff-topbar__link:hover { color: var(--text-primary); }
.ff-topbar__link.is-active {
  color: var(--text-primary);
  border-bottom-color: var(--accent-rest);
}
/* Side rail: 240px, tint pair + accent bar for the active item */
.ff-rail {
  width: 240px;
  padding: 12px 8px;
  background: var(--surface-base);
  border-right: 1px solid var(--border-subtle);
}
.ff-rail__item {
  display: flex;
  align-items: center;
  min-height: 44px;
  padding: 0 12px;
  border-radius: var(--radius-sm);
  font-size: 0.875rem;
  font-weight: 600;
  color: var(--text-primary);
  text-decoration: none;
  border-left: 2px solid transparent;
}
.ff-rail__item:hover { background: var(--surface-raised); }
.ff-rail__item.is-active {
  background: var(--accent-tint-bg);
  color: var(--accent-tint-text);
  border-left-color: var(--accent-rest);
}
.ff-topbar__link:focus-visible,
.ff-rail__item:focus-visible {
  outline: 2px solid var(--focus-ring);
  outline-offset: 2px;
}
```

### States

| State | Visual |
| ----- | ------ |
| Rest | Secondary-weight labels; hierarchy from weight + position |
| Hover | Text steps to `--text-primary`; rail row takes the raised fill |
| Active | 2px accent underline (topbar) or tint pair + accent bar (rail) + `aria-current` |
| Focus | 2px ring on every link |
| Disabled | N/A — nav items are never disabled; hide unavailable destinations |

---

## 5. Dialog / drawer

### HTML

```html
<div class="ff-scrim" data-open="true">
  <div class="ff-dialog" role="dialog" aria-modal="true" aria-labelledby="dlg-title">
    <h2 class="ff-dialog__title" id="dlg-title">Close the quarter?</h2>
    <p class="ff-dialog__body">Open drafts stay editable after closing.</p>
    <div class="ff-dialog__actions">
      <button class="ff-button ff-button--secondary" data-close>Cancel</button>
      <button class="ff-button ff-button--primary">Close quarter</button>
    </div>
  </div>
</div>
```

### CSS

```css
/* fluent-flat dialog — base fill, 8px radius, single float shadow */
.ff-scrim {
  position: fixed;
  inset: 0;
  display: grid;
  place-items: center;
  padding: 24px;
  background: rgb(0 0 0 / 0.4);
  animation: ff-fade 250ms ease-out;
}
.ff-dialog {
  width: min(480px, 100%);
  background: var(--surface-base);
  color: var(--text-primary);
  border: 1px solid var(--border-strong);
  border-radius: var(--radius-lg);
  box-shadow: var(--shadow-float);
  padding: 24px;
  animation: ff-rise 250ms ease-out;
}
.ff-dialog__title {
  font-size: clamp(1.25rem, 1.1rem + 0.6vw, 1.5rem);
  font-weight: 600;
  margin: 0 0 8px;
}
.ff-dialog__body { font-size: 1rem; line-height: 1.5; margin: 0 0 24px; }
.ff-dialog__actions {
  display: flex;
  justify-content: flex-end;
  gap: 12px;
}
@keyframes ff-fade { from { opacity: 0; } to { opacity: 1; } }
@keyframes ff-rise {
  from { opacity: 0; transform: translateY(8px); }
  to { opacity: 1; transform: none; }
}
@media (prefers-reduced-motion: reduce) {
  .ff-scrim, .ff-dialog { animation: none; }
}
```

### States and behavior

| Area | Rule |
| ---- | ---- |
| Open | Fade the scrim (250ms); rise the panel at most 8px |
| Focus | Trap focus inside; focus the title or first control on open |
| Close | Esc or Cancel; return focus to the trigger |
| Disabled | Primary action disabled at 50% opacity until the form is valid |
| Loading | Replace the primary label with `Saving…` + `aria-busy`; keep Cancel enabled |

---

## 6. Badges / counts / callouts

### HTML

```html
<span class="ff-badge ff-badge--info">Beta</span>
<span class="ff-badge ff-badge--success">Paid</span>
<span class="ff-badge ff-badge--warning">Due soon</span>
<span class="ff-badge ff-badge--danger">Overdue</span>
<span class="ff-count" aria-label="4 unread orders">4</span>

<div class="ff-callout ff-callout--info" role="status">
  <strong>Sync paused.</strong> Reconnect to resume imports.
</div>
<div class="ff-callout ff-callout--danger" role="alert">
  <strong>Import failed.</strong> Row 12 has an invalid date.
</div>
```

### CSS

```css
/* fluent-flat badges — square-cut 2px, solid fills, text always paired */
.ff-badge {
  display: inline-flex;
  align-items: center;
  min-height: 24px;
  padding: 2px 8px;
  border-radius: var(--radius-xs);
  font-size: 0.75rem;
  font-weight: 600;
  letter-spacing: 0.01em;
  border: 1px solid transparent;
}
.ff-badge--info {
  background: var(--accent-tint-bg);
  color: var(--accent-tint-text);
  border-color: var(--accent-rest);
}
.ff-badge--success { background: var(--success); color: #ffffff; }
.ff-badge--warning { background: var(--warning); color: #ffffff; }
[data-fluent-theme="dark"] .ff-badge--warning { color: #111111; }
.ff-badge--danger { background: var(--danger); color: #ffffff; }
/* Counts: solid accent disc, white numerals */
.ff-count {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-width: 24px;
  height: 24px;
  padding: 0 6px;
  border-radius: 9999px;
  background: var(--accent-rest);
  color: var(--text-on-accent);
  font-size: 0.75rem;
  font-weight: 700;
}
/* Callouts: tint or status pair plus a 2px edge, never color alone */
.ff-callout {
  padding: 12px 16px;
  border-radius: var(--radius-sm);
  border: 1px solid var(--border-strong);
  border-left: 2px solid var(--accent-rest);
  background: var(--surface-raised);
  color: var(--text-primary);
  font-size: 0.875rem;
  line-height: 1.5;
}
.ff-callout--info {
  background: var(--accent-tint-bg);
  color: var(--accent-tint-text);
}
.ff-callout--danger {
  background: var(--surface-raised);
  border-left-color: var(--danger);
}
.ff-callout--danger strong { color: var(--danger); }
```

### States

| State | Visual |
| ----- | ------ |
| Rest | Info uses the tint pair; success/warning/danger use solid fills with light text |
| Dark warning | Dark-theme warning pairs `#F5C211` with near-black text for ratio |
| Focus | Badges are text (no ring); linked badges use the quiet-button ring |
| Meaning | Status never travels alone — adjacent label or icon always present |

---

## 7. Focus, disabled, loading

Shared rules every component follows.

```css
/* One focus rule for all interactive elements */
:where(a, button, input, textarea, select, [tabindex]):focus-visible {
  outline: 2px solid var(--focus-ring);
  outline-offset: 2px;
}
[data-fluent-theme="high-contrast"] :where(a, button, input):focus-visible {
  outline: 3px solid #ffff00;
}

/* One disabled rule: halve opacity, stop interaction, say so */
:where(button, input, textarea, select):disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

/* Skeleton loading rows for cards and tables */
.ff-skeleton {
  height: 16px;
  border-radius: var(--radius-xs);
  background: var(--surface-sunken);
  animation: ff-pulse 1.2s ease-out infinite;
}
@keyframes ff-pulse {
  0%, 100% { opacity: 1; }
  50% { opacity: 0.45; }
}
@media (prefers-reduced-motion: reduce) {
  .ff-skeleton, .ff-button__bar, .ff-scrim, .ff-dialog { animation: none; }
  * { transition-duration: 0.01ms; }
}
```

| Concern | Rule |
| ------- | ---- |
| Focus | Always visible, never removed; ring sits 2px off the control |
| Disabled | 50% opacity + `aria-disabled` or `disabled`; label stays legible |
| Loading | Button bar or skeleton rows; `aria-busy` + live text; reduced-motion freezes the pulse |
| High-contrast | 3px `#FFFF00` ring; 2px borders; no fill-only signals |
| Check | Tab through every control; confirm ring, label, and error text survive with motion off |

