# Funky Design: Tokens & Implementation Reference

Funky Design uses a robust, scalable token system powered by CSS Custom Properties (Variables) and OKLCH color space, seamlessly integrated into Tailwind CSS. This document is the single source of truth for implementing the system.

## 1. Token Architecture

Our design system relies on a strict three-tier token hierarchy to ensure maintainability and consistency:

1. **Global Tokens (Raw Values)**: The foundation. These define the literal values (hex codes, OKLCH strings, px/rem measurements). They are agnostic to their use case.
   *Example:* `--global-color-coral-500: oklch(68% 0.19 30);`
2. **Semantic Tokens (Functional)**: The middle layer. These map global tokens to specific design intents or roles (like primary, background, success) based on the active palette or mode.
   *Example:* `--color-primary: var(--global-color-coral-500);`
3. **Component Tokens (Scoped)**: The application layer. These map semantic (or sometimes global) tokens to specific component properties. They isolate component styling from systemic changes.
   *Example:* `--btn-primary-bg: var(--color-primary);`

---

## 2. Complete CSS Custom Properties

Include this base CSS in your main stylesheet. It contains all global tokens, default mode (Flow), and default palette (Sunlit).

```css
:root {
  /* =========================================
     GLOBAL TOKENS
     ========================================= */

  /* -----------------------------------------
     Colors: OKLCH Scale
     Hero values map to the 500 step.
     ----------------------------------------- */
  /* Coral */
  --coral-50: oklch(97% 0.03 30);
  --coral-100: oklch(93% 0.06 30);
  --coral-200: oklch(87% 0.10 30);
  --coral-300: oklch(81% 0.14 30);
  --coral-400: oklch(75% 0.17 30);
  --coral-500: oklch(68% 0.19 30); /* Hero */
  --coral-600: oklch(61% 0.16 30);
  --coral-700: oklch(53% 0.13 30);
  --coral-800: oklch(45% 0.10 30);
  --coral-900: oklch(37% 0.07 30);
  --coral-950: oklch(25% 0.04 30);

  /* Violet */
  --violet-50: oklch(97% 0.03 300);
  --violet-100: oklch(94% 0.07 300);
  --violet-200: oklch(86% 0.12 300);
  --violet-300: oklch(77% 0.16 300);
  --violet-400: oklch(66% 0.19 300);
  --violet-500: oklch(55% 0.22 300); /* Hero */
  --violet-600: oklch(48% 0.19 300);
  --violet-700: oklch(40% 0.15 300);
  --violet-800: oklch(32% 0.11 300);
  --violet-900: oklch(24% 0.08 300);
  --violet-950: oklch(16% 0.05 300);

  /* Teal */
  --teal-50: oklch(98% 0.02 180);
  --teal-100: oklch(95% 0.05 180);
  --teal-200: oklch(89% 0.08 180);
  --teal-300: oklch(83% 0.11 180);
  --teal-400: oklch(77% 0.13 180);
  --teal-500: oklch(72% 0.14 180); /* Hero */
  --teal-600: oklch(64% 0.12 180);
  --teal-700: oklch(56% 0.10 180);
  --teal-800: oklch(47% 0.08 180);
  --teal-900: oklch(38% 0.06 180);
  --teal-950: oklch(26% 0.04 180);

  /* Amber */
  --amber-50: oklch(98% 0.03 85);
  --amber-100: oklch(95% 0.06 85);
  --amber-200: oklch(90% 0.09 85);
  --amber-300: oklch(85% 0.12 85);
  --amber-400: oklch(82% 0.14 85);
  --amber-500: oklch(80% 0.16 85); /* Hero */
  --amber-600: oklch(72% 0.14 85);
  --amber-700: oklch(62% 0.11 85);
  --amber-800: oklch(52% 0.09 85);
  --amber-900: oklch(42% 0.07 85);
  --amber-950: oklch(28% 0.04 85);

  /* Fuchsia */
  --fuchsia-50: oklch(97% 0.03 340);
  --fuchsia-100: oklch(93% 0.07 340);
  --fuchsia-200: oklch(85% 0.12 340);
  --fuchsia-300: oklch(76% 0.17 340);
  --fuchsia-400: oklch(67% 0.21 340);
  --fuchsia-500: oklch(58% 0.25 340); /* Hero */
  --fuchsia-600: oklch(51% 0.21 340);
  --fuchsia-700: oklch(43% 0.17 340);
  --fuchsia-800: oklch(35% 0.13 340);
  --fuchsia-900: oklch(26% 0.09 340);
  --fuchsia-950: oklch(17% 0.06 340);

  /* Lime */
  --lime-50: oklch(98% 0.03 130);
  --lime-100: oklch(95% 0.07 130);
  --lime-200: oklch(91% 0.11 130);
  --lime-300: oklch(87% 0.15 130);
  --lime-400: oklch(84% 0.18 130);
  --lime-500: oklch(82% 0.20 130); /* Hero */
  --lime-600: oklch(72% 0.17 130);
  --lime-700: oklch(61% 0.14 130);
  --lime-800: oklch(50% 0.11 130);
  --lime-900: oklch(40% 0.08 130);
  --lime-950: oklch(27% 0.05 130);

  /* Slate */
  --slate-50: oklch(98% 0.00 260);
  --slate-100: oklch(95% 0.01 260);
  --slate-200: oklch(88% 0.01 260);
  --slate-300: oklch(79% 0.01 260);
  --slate-400: oklch(68% 0.01 260);
  --slate-500: oklch(55% 0.02 260); /* Hero */
  --slate-600: oklch(46% 0.02 260);
  --slate-700: oklch(36% 0.02 260);
  --slate-800: oklch(26% 0.02 260);
  --slate-900: oklch(17% 0.01 260);
  --slate-950: oklch(11% 0.01 260);

  /* -----------------------------------------
     Typography
     ----------------------------------------- */
  --font-display: "Satoshi Variable", system-ui, sans-serif;
  --font-body: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
  --font-mono: "JetBrains Mono", ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace;
  
  --text-xs: 0.75rem;
  --text-sm: 0.875rem;
  --text-base: 1rem;
  --text-lg: 1.125rem;
  --text-xl: 1.25rem;
  --text-2xl: 1.5rem;
  --text-3xl: 1.875rem;
  --text-4xl: 2.25rem;
  --text-5xl: 3rem;
  --text-6xl: 3.75rem;

  /* -----------------------------------------
     Spacing
     ----------------------------------------- */
  --space-1: 0.25rem;
  --space-2: 0.5rem;
  --space-3: 0.75rem;
  --space-4: 1rem;
  --space-5: 1.25rem;
  --space-6: 1.5rem;
  --space-8: 2rem;
  --space-10: 2.5rem;
  --space-12: 3rem;
  --space-16: 4rem;
  --space-20: 5rem;
  --space-24: 6rem;

  /* -----------------------------------------
     Motion (Springs)
     ----------------------------------------- */
  --ease-spring-gentle: linear(0, 0.22 3%, 0.4 6.2%, 0.56 9.8%, 0.69 13.9%, 0.79 18.5%, 0.87 23.7%, 0.93 29.5%, 0.97 36.3%, 0.99 44%, 1 53.6%, 1 100%);
  --ease-spring-bouncy: linear(0, 0.44 3.2%, 0.77 6.9%, 1.01 10.9%, 1.15 15.3%, 1.21 20.3%, 1.19 25.9%, 1.11 32%, 1.01 38.6%, 0.94 45.7%, 0.93 53.4%, 0.95 61.9%, 0.99 71%, 1.01 81.1%, 1 92.1%, 1 100%);
  --ease-spring-quick: linear(0, 0.35 2.1%, 0.62 4.4%, 0.83 7%, 0.98 9.9%, 1.07 13.2%, 1.11 16.9%, 1.11 21%, 1.07 25.6%, 1.01 30.8%, 0.96 36.7%, 0.94 43.4%, 0.94 51.1%, 0.97 59.8%, 0.99 69.8%, 1 81.4%, 1 100%);
}
```

---

## 3. Mode Switching CSS

Funky Design has two distinct modes: **Flow** (default: smooth, professional) and **Funk** (expressive, asymmetric). Mode attributes apply structural changes like shape and elevation.

```css
:root, [data-funky-mode="flow"] {
  /* FLOW: Professional, smooth */
  --shape-sm: 0.25rem;
  --shape-md: 0.5rem;
  --shape-lg: 1rem;
  --shape-xl: 1.5rem;
  --shape-pill: 9999px;
  --shape-squircle: 20%;
  
  --elevation-1: 0 1px 3px rgba(0,0,0,0.1), 0 1px 2px rgba(0,0,0,0.06);
  --elevation-2: 0 4px 6px rgba(0,0,0,0.1), 0 2px 4px rgba(0,0,0,0.06);
  --elevation-3: 0 10px 15px rgba(0,0,0,0.1), 0 4px 6px rgba(0,0,0,0.05);
  
  --motion-primary: var(--ease-spring-gentle);
}

[data-funky-mode="funk"] {
  /* FUNK: Bouncy, asymmetric */
  --shape-sm: 0.5rem 0.25rem 0.5rem 0.125rem;
  --shape-md: 1rem 0.5rem 0.75rem 0.25rem;
  --shape-lg: 1.5rem 0.5rem 1.25rem 0.25rem;
  --shape-xl: 2rem 0.75rem 1.5rem 0.5rem;
  --shape-pill: 9999px 999px 9999px 999px;
  --shape-squircle: 25% 15% 30% 20%;
  
  /* Funk uses heavy, solid colored shadows */
  --elevation-1: 3px 3px 0px var(--color-shadow);
  --elevation-2: 6px 6px 0px var(--color-shadow);
  --elevation-3: 10px 10px 0px var(--color-shadow);
  
  --motion-primary: var(--ease-spring-bouncy);
}
```

---

## 4. Palette Switching CSS

Funky Design offers three surface palettes for thematic variety: Sunlit (warm light), Overcast (cool neutral), and Midnight (deep dark).

```css
:root, [data-funky-palette="sunlit"] {
  /* SUNLIT: Warm Light */
  --surface-base: var(--amber-50);
  --surface-raised: var(--amber-100);
  --surface-sunken: var(--amber-200);
  
  --text-base: var(--slate-900);
  --text-muted: var(--slate-600);
  
  --color-primary: var(--coral-500);
  --color-secondary: var(--amber-500);
  --color-accent: var(--violet-500);
  
  --color-shadow: var(--slate-900);
}

[data-funky-palette="overcast"] {
  /* OVERCAST: Cool Neutral */
  --surface-base: var(--slate-50);
  --surface-raised: #FFFFFF;
  --surface-sunken: var(--slate-100);
  
  --text-base: var(--slate-900);
  --text-muted: var(--slate-600);
  
  --color-primary: var(--teal-500);
  --color-secondary: var(--slate-500);
  --color-accent: var(--fuchsia-500);
  
  --color-shadow: var(--slate-800);
}

[data-funky-palette="midnight"] {
  /* MIDNIGHT: Deep Dark */
  --surface-base: var(--slate-900);
  --surface-raised: var(--slate-800);
  --surface-sunken: var(--slate-950);
  
  --text-base: var(--slate-50);
  --text-muted: var(--slate-400);
  
  --color-primary: var(--lime-400);
  --color-secondary: var(--violet-400);
  --color-accent: var(--coral-400);
  
  --color-shadow: var(--slate-950);
}
```

---

## 5. Tailwind Preset

Create `funky.config.js` and extend it in your project's `tailwind.config.js`.

```javascript
/** @type {import('tailwindcss').Config} */
const plugin = require('tailwindcss/plugin');

module.exports = {
  theme: {
    extend: {
      colors: {
        coral: { 50: 'var(--coral-50)', 100: 'var(--coral-100)', 200: 'var(--coral-200)', 300: 'var(--coral-300)', 400: 'var(--coral-400)', 500: 'var(--coral-500)', 600: 'var(--coral-600)', 700: 'var(--coral-700)', 800: 'var(--coral-800)', 900: 'var(--coral-900)', 950: 'var(--coral-950)' },
        violet: { 50: 'var(--violet-50)', 100: 'var(--violet-100)', 200: 'var(--violet-200)', 300: 'var(--violet-300)', 400: 'var(--violet-400)', 500: 'var(--violet-500)', 600: 'var(--violet-600)', 700: 'var(--violet-700)', 800: 'var(--violet-800)', 900: 'var(--violet-900)', 950: 'var(--violet-950)' },
        teal: { 50: 'var(--teal-50)', 100: 'var(--teal-100)', 200: 'var(--teal-200)', 300: 'var(--teal-300)', 400: 'var(--teal-400)', 500: 'var(--teal-500)', 600: 'var(--teal-600)', 700: 'var(--teal-700)', 800: 'var(--teal-800)', 900: 'var(--teal-900)', 950: 'var(--teal-950)' },
        amber: { 50: 'var(--amber-50)', 100: 'var(--amber-100)', 200: 'var(--amber-200)', 300: 'var(--amber-300)', 400: 'var(--amber-400)', 500: 'var(--amber-500)', 600: 'var(--amber-600)', 700: 'var(--amber-700)', 800: 'var(--amber-800)', 900: 'var(--amber-900)', 950: 'var(--amber-950)' },
        fuchsia: { 50: 'var(--fuchsia-50)', 100: 'var(--fuchsia-100)', 200: 'var(--fuchsia-200)', 300: 'var(--fuchsia-300)', 400: 'var(--fuchsia-400)', 500: 'var(--fuchsia-500)', 600: 'var(--fuchsia-600)', 700: 'var(--fuchsia-700)', 800: 'var(--fuchsia-800)', 900: 'var(--fuchsia-900)', 950: 'var(--fuchsia-950)' },
        lime: { 50: 'var(--lime-50)', 100: 'var(--lime-100)', 200: 'var(--lime-200)', 300: 'var(--lime-300)', 400: 'var(--lime-400)', 500: 'var(--lime-500)', 600: 'var(--lime-600)', 700: 'var(--lime-700)', 800: 'var(--lime-800)', 900: 'var(--lime-900)', 950: 'var(--lime-950)' },
        slate: { 50: 'var(--slate-50)', 100: 'var(--slate-100)', 200: 'var(--slate-200)', 300: 'var(--slate-300)', 400: 'var(--slate-400)', 500: 'var(--slate-500)', 600: 'var(--slate-600)', 700: 'var(--slate-700)', 800: 'var(--slate-800)', 900: 'var(--slate-900)', 950: 'var(--slate-950)' },
        
        surface: {
          base: 'var(--surface-base)',
          raised: 'var(--surface-raised)',
          sunken: 'var(--surface-sunken)',
        },
        primary: 'var(--color-primary)',
        secondary: 'var(--color-secondary)',
        accent: 'var(--color-accent)',
        shadow: 'var(--color-shadow)',
      },
      fontFamily: {
        display: ['var(--font-display)'],
        body: ['var(--font-body)'],
        mono: ['var(--font-mono)'],
      },
      borderRadius: {
        sm: 'var(--shape-sm)',
        md: 'var(--shape-md)',
        lg: 'var(--shape-lg)',
        xl: 'var(--shape-xl)',
        pill: 'var(--shape-pill)',
        squircle: 'var(--shape-squircle)',
      },
      boxShadow: {
        1: 'var(--elevation-1)',
        2: 'var(--elevation-2)',
        3: 'var(--elevation-3)',
      },
      transitionTimingFunction: {
        'spring-gentle': 'var(--ease-spring-gentle)',
        'spring-bouncy': 'var(--ease-spring-bouncy)',
        'spring-quick': 'var(--ease-spring-quick)',
        'primary': 'var(--motion-primary)',
      }
    }
  },
  plugins: [
    plugin(function({ addUtilities }) {
      addUtilities({
        '.funky-press': {
          transform: 'scale(0.95)',
          transition: 'transform 0.15s var(--motion-primary)',
        },
        '.funky-lift': {
          transform: 'translateY(-4px)',
          boxShadow: 'var(--elevation-2)',
          transition: 'all 0.3s var(--motion-primary)',
        },
        '.funky-lift:hover': {
          transform: 'translateY(-8px)',
          boxShadow: 'var(--elevation-3)',
        }
      })
    })
  ]
}
```

---

## 6. Material Design 3 / Fluent 2 Token Mapping

A reference table for developers transitioning from other popular systems.

| Funky Design | Material Design 3 (MD3) | Fluent 2 | Description / Use |
| :--- | :--- | :--- | :--- |
| `surface-base` | `md.sys.color.surface` | `colorNeutralBackground1` | App background, default containers |
| `surface-raised` | `md.sys.color.surface-container` | `colorNeutralBackground2` | Cards, popovers, elevated elements |
| `surface-sunken` | `md.sys.color.surface-container-low` | `colorNeutralBackgroundInverted` | Inputs, deeply nested containers |
| `color-primary` | `md.sys.color.primary` | `colorBrandBackground` | Main CTA, active states, key branding |
| `color-secondary` | `md.sys.color.secondary` | `colorNeutralBackground3` | Secondary buttons, subtle highlights |
| `text-base` | `md.sys.color.on-surface` | `colorNeutralForeground1` | Main body text, headings |
| `text-muted` | `md.sys.color.on-surface-variant` | `colorNeutralForeground2` | Secondary text, captions |
| `shape-md` | `md.sys.shape.corner.medium` | `borderRadiusMedium` | Standard cards, dialogs |
| `shape-pill` | `md.sys.shape.corner.full` | `borderRadiusCircular` | Action buttons, badges |
| `elevation-1` | `md.sys.elevation.level1` | `shadow2` | Low emphasis containers, buttons |
| `elevation-3` | `md.sys.elevation.level3` | `shadow16` | Modals, high emphasis dropdowns |
| `font-display` | `md.sys.typescale.headline-*` | `typography.title*` | Large expressive headings |

*(Note: MD3 and Fluent 2 utilize different shape generation patterns, but the structural mapping applies).*
