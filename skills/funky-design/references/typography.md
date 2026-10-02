# Funky Design: Typography Reference

This document provides the complete, implementation-ready typography specification for the Funky Design system.

## 1. Font Loading Strategy

To ensure optimal performance and avoid flash of unstyled text (FOUT) where possible, we use `@font-face` with `font-display: swap`.

### HTML Preload Tags

Add these to the `<head>` of your HTML document:

```html
<link rel="preload" href="/fonts/satoshi-variable.woff2" as="font" type="font/woff2" crossorigin>
<link rel="preload" href="/fonts/jetbrains-mono-regular.woff2" as="font" type="font/woff2" crossorigin>
```

### CSS `@font-face` Declarations

```css
@font-face {
  font-family: 'Satoshi Variable';
  src: url('/fonts/satoshi-variable.woff2') format('woff2');
  font-weight: 300 900;
  font-display: swap;
  font-style: normal;
}

@font-face {
  font-family: 'Satoshi Variable';
  src: url('/fonts/satoshi-variable-italic.woff2') format('woff2');
  font-weight: 300 900;
  font-display: swap;
  font-style: italic;
}

@font-face {
  font-family: 'JetBrains Mono';
  src: url('/fonts/jetbrains-mono-regular.woff2') format('woff2');
  font-weight: 400;
  font-display: swap;
  font-style: normal;
  unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
}

@font-face {
  font-family: 'JetBrains Mono';
  src: url('/fonts/jetbrains-mono-medium.woff2') format('woff2');
  font-weight: 500;
  font-display: swap;
  font-style: normal;
}

@font-face {
  font-family: 'JetBrains Mono';
  src: url('/fonts/jetbrains-mono-bold.woff2') format('woff2');
  font-weight: 700;
  font-display: swap;
  font-style: normal;
}
```

## 2. Font Stack Tokens

```css
:root {
  --font-display: 'Satoshi Variable', system-ui, -apple-system, sans-serif;
  --font-body: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
  --font-mono: 'JetBrains Mono', ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace;
}
```

## 3. Type Scale — Complete Specification

We use a responsive type scale that adapts from mobile (320px) to desktop (1024px) for display sizes. Body sizes remain static.

| Token | Font | Size (Responsive/Static) | Weight | Line-height | Letter-spacing | CSS Variable |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `display-xl` | Satoshi | `clamp(2.5rem, 1.5rem + 5vw, 4.5rem)` | 800 | 1.1 | -0.03em | `--text-display-xl` |
| `display-lg` | Satoshi | `clamp(2.25rem, 1.25rem + 4.5vw, 3.75rem)` | 800 | 1.1 | -0.02em | `--text-display-lg` |
| `display-md` | Satoshi | `clamp(2rem, 1.5rem + 3vw, 3rem)` | 700 | 1.15 | -0.015em | `--text-display-md` |
| `display-sm` | Satoshi | `clamp(1.75rem, 1.25rem + 2vw, 2.25rem)` | 700 | 1.2 | -0.01em | `--text-display-sm` |
| `heading-lg` | Satoshi | `clamp(1.5rem, 1.25rem + 1vw, 1.75rem)` | 700 | 1.2 | -0.01em | `--text-heading-lg` |
| `heading-md` | Satoshi | `1.25rem` (20px) | 600 | 1.3 | -0.01em | `--text-heading-md` |
| `body-lg` | System | `1.125rem` (18px) | 400 | 1.5 | normal | `--text-body-lg` |
| `body` | System | `1rem` (16px) | 400 | 1.5 | normal | `--text-body` |
| `body-sm` | System | `0.875rem` (14px) | 400 | 1.5 | normal | `--text-body-sm` |
| `body-xs` | System | `0.75rem` (12px) | 400 | 1.5 | normal | `--text-body-xs` |
| `mono` | JetBrains | `0.875rem` (14px) | 400 | 1.5 | normal | `--text-mono` |
| `mono-sm` | JetBrains | `0.75rem` (12px) | 400 | 1.5 | normal | `--text-mono-sm` |

## 4. Mode-Specific Typography

The typographic expression changes based on the active mode. Funk embraces heavy, tight letterforms, while Flow provides a slightly more relaxed, professional stance.

### Funk 🎸 (Default)
- **Weight**: 800-900 (ExtraBold/Black)
- **Tracking**: Tighter (-0.03em to -0.02em)

### Flow 🌊
- **Weight**: 600-700 (SemiBold/Bold)
- **Tracking**: Looser (-0.015em to -0.01em)

### Implementation via CSS Variables

```css
/* Base/Funk Mode defaults */
:root {
  --display-weight-heavy: 800;
  --display-weight-medium: 700;
  --display-tracking-tight: -0.03em;
  --display-tracking-normal: -0.015em;
}

/* Flow Mode overrides */
[data-mode="flow"] {
  --display-weight-heavy: 700;
  --display-weight-medium: 600;
  --display-tracking-tight: -0.015em;
  --display-tracking-normal: -0.01em;
}

/* Application to a class */
.type-display-xl {
  font-family: var(--font-display);
  font-size: clamp(2.5rem, 1.5rem + 5vw, 4.5rem);
  font-weight: var(--display-weight-heavy);
  letter-spacing: var(--display-tracking-tight);
  line-height: 1.1;
}
```

## 5. Optical Sizing

Because Satoshi Variable supports optical sizing, we must explicitly enable it. This ensures that the contrast and strokes of the letterforms adjust appropriately based on the rendered text size.

```css
* {
  font-optical-sizing: auto;
}
```

## 6. Typography Utility Classes

These classes map directly to the tokens above.

```css
.type-display-xl {
  font-family: var(--font-display);
  font-size: var(--text-display-xl);
  font-weight: var(--display-weight-heavy);
  line-height: 1.1;
  letter-spacing: var(--display-tracking-tight);
}

.type-display-lg {
  font-family: var(--font-display);
  font-size: var(--text-display-lg);
  font-weight: var(--display-weight-heavy);
  line-height: 1.1;
  letter-spacing: var(--display-tracking-tight);
}

.type-display-md {
  font-family: var(--font-display);
  font-size: var(--text-display-md);
  font-weight: var(--display-weight-medium);
  line-height: 1.15;
  letter-spacing: var(--display-tracking-normal);
}

.type-display-sm {
  font-family: var(--font-display);
  font-size: var(--text-display-sm);
  font-weight: var(--display-weight-medium);
  line-height: 1.2;
  letter-spacing: var(--display-tracking-normal);
}

.type-heading-lg {
  font-family: var(--font-display);
  font-size: var(--text-heading-lg);
  font-weight: var(--display-weight-medium);
  line-height: 1.2;
  letter-spacing: -0.01em;
}

.type-heading-md {
  font-family: var(--font-display);
  font-size: var(--text-heading-md);
  font-weight: var(--display-weight-medium);
  line-height: 1.3;
  letter-spacing: -0.01em;
}

.type-body-lg {
  font-family: var(--font-body);
  font-size: var(--text-body-lg);
  font-weight: 400;
  line-height: 1.5;
}

.type-body {
  font-family: var(--font-body);
  font-size: var(--text-body);
  font-weight: 400;
  line-height: 1.5;
}

.type-body-sm {
  font-family: var(--font-body);
  font-size: var(--text-body-sm);
  font-weight: 400;
  line-height: 1.5;
}

.type-body-xs {
  font-family: var(--font-body);
  font-size: var(--text-body-xs);
  font-weight: 400;
  line-height: 1.5;
}

.type-mono {
  font-family: var(--font-mono);
  font-size: var(--text-mono);
  font-weight: 400;
  line-height: 1.5;
}

.type-mono-sm {
  font-family: var(--font-mono);
  font-size: var(--text-mono-sm);
  font-weight: 400;
  line-height: 1.5;
}
```

## 7. Typography Rules

1. **Satoshi Variable for headlines only (Display/Heading sizes).** Do not use Satoshi for body paragraphs, small UI elements, or labels.
2. **System fonts for all body text and UI.** This maximizes readability and platform native feel for dense information.
3. **JetBrains Mono for technical accents.** Code blocks, statistics, version numbers, or specific interactive badges.
4. **Line-height scales inversely with size.** Display text needs tight leading (1.1-1.15), body text needs breathable leading (1.5).
5. **No pure white or pure black.** Text colors should be drawn from the surface palettes.
6. **No gradient text.** Keep typography legible; rely on the 7 accent colors and solid contrast.

## 8. Responsive Typography

Responsive typography relies on CSS `clamp(min, preferred, max)`.
Our preferred value formula is generally based on combining a `rem` base with a `vw` (viewport width) modifier.

Calculations for `display-xl`:
- Min: `2.5rem` (40px)
- Preferred: `1.5rem + 5vw`
- Max: `4.5rem` (72px)
At a 320px viewport, 5vw is 16px (1rem). `1.5rem + 1rem = 2.5rem`.
At a 1024px viewport, 5vw is 51.2px (3.2rem). `1.5rem + 3.2rem = 4.7rem` (caps at 4.5rem).

## 9. Complete CSS Block

```css
:root {
  /* Font Families */
  --font-display: 'Satoshi Variable', system-ui, -apple-system, sans-serif;
  --font-body: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
  --font-mono: 'JetBrains Mono', ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace;

  /* Scale Variables */
  --text-display-xl: clamp(2.5rem, 1.5rem + 5vw, 4.5rem);
  --text-display-lg: clamp(2.25rem, 1.25rem + 4.5vw, 3.75rem);
  --text-display-md: clamp(2rem, 1.5rem + 3vw, 3rem);
  --text-display-sm: clamp(1.75rem, 1.25rem + 2vw, 2.25rem);
  --text-heading-lg: clamp(1.5rem, 1.25rem + 1vw, 1.75rem);
  --text-heading-md: 1.25rem;
  
  --text-body-lg: 1.125rem;
  --text-body: 1rem;
  --text-body-sm: 0.875rem;
  --text-body-xs: 0.75rem;
  
  --text-mono: 0.875rem;
  --text-mono-sm: 0.75rem;

  /* Mode Defaults (Funk) */
  --display-weight-heavy: 800;
  --display-weight-medium: 700;
  --display-tracking-tight: -0.03em;
  --display-tracking-normal: -0.015em;
}

[data-mode="flow"] {
  --display-weight-heavy: 700;
  --display-weight-medium: 600;
  --display-tracking-tight: -0.015em;
  --display-tracking-normal: -0.01em;
}
```
