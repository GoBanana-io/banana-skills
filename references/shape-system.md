# Funky Design: Shape System Reference

The Funky Design language utilizes shapes as a primary tool for expression and tone. Shapes behave drastically differently across our two modes:
- **🌊 Flow Mode:** Smooth, consistent, professional radii. Predictable and warm.
- **🎸 Funk Mode:** Asymmetric, bouncy, expressive geometry. High energy and distinct.

---

## 1. Shape Token Map

| Token Name | CSS Custom Property | Flow Value (Consistent) | Funk Value (Asymmetric) |
| :--- | :--- | :--- | :--- |
| **Small** | `--shape-sm` | `4px` | `6px 2px 6px 2px` |
| **Medium** | `--shape-md` | `8px` | `12px 4px 12px 4px` |
| **Large** | `--shape-lg` | `16px` | `24px 8px 24px 8px` |
| **Extra Large**| `--shape-xl` | `24px` | `32px 12px 32px 12px` |
| **Pill** | `--shape-pill` | `9999px` | `9999px` |
| **Circle** | `--shape-circle`| `50%` | `50%` |
| **Squircle** | `--shape-squircle`| `clip-path` / `mask` | `clip-path` / `mask` |

---

## 2. Squircle Implementation

The Squircle (a superellipse with exponent ~4) is our signature shape for Avatars and App Icons. Because standard `border-radius` cannot calculate a true superellipse, we rely on two approaches.

### Approach A: SVG Clip-Path (True Superellipse)

For a perfect mathematically smooth squircle, we use an inline SVG definition combined with `clip-path`. By using `clipPathUnits="objectBoundingBox"`, this single SVG scales automatically to any element size (24px, 32px, 40px, 64px, 128px, etc.).

**HTML Definition (include once at top of document):**
```html
<svg width="0" height="0" style="position: absolute;">
  <defs>
    <clipPath id="squircle-clip" clipPathUnits="objectBoundingBox">
      <!-- Exponent ~4 cubic bezier approximation -->
      <path d="M 0.5, 0 
               C 0.1, 0 0, 0.1 0, 0.5 
               C 0, 0.9 0.1, 1 0.5, 1 
               C 0.9, 1 1, 0.9 1, 0.5 
               C 1, 0.1 0.9, 0 0.5, 0 Z" />
    </clipPath>
  </defs>
</svg>
```

**CSS Application:**
```css
.squircle {
  clip-path: url(#squircle-clip);
  /* Fallback for older browsers */
  border-radius: 22.5%;
}
```

### Approach B: CSS Approximation

When SVG clipping is too expensive or interferes with borders/box-shadows, use the CSS approximation.

```css
/* Scalable CSS approximation */
.squircle-approx {
  border-radius: 22.5%; /* Closest proportional standard radius */
}

/* Fixed-size approximations (closer to Apple's smooth corners) */
.squircle-24 { width: 24px; height: 24px; border-radius: 6px; }
.squircle-32 { width: 32px; height: 32px; border-radius: 8px; }
.squircle-40 { width: 40px; height: 40px; border-radius: 10px; }
.squircle-64 { width: 64px; height: 64px; border-radius: 16px; }
.squircle-128 { width: 128px; height: 128px; border-radius: 32px; }
```

---

## 3. Asymmetric Corner Patterns (Funk Mode)

Funk Mode heavily relies on asymmetric border radii to create a dynamic, organic feel. Here are the 5 core patterns:

| Pattern Name | CSS Value (`border-radius`) | Visual Effect | When to Use |
| :--- | :--- | :--- | :--- |
| **The Leaf** | `24px 4px 24px 4px` | Top-left & bottom-right large, others sharp. Looks organic. | Primary buttons, generic cards, featured tags. |
| **The Chat** | `20px 20px 20px 0px` | Three smooth corners, bottom-left sharp. Directional. | Tooltips, user messages, popovers. |
| **The Wave** | `12px 24px 12px 24px` | Alternating medium and large curves. Gentle motion. | Secondary cards, list items, navigation links. |
| **The Flag** | `0px 24px 24px 24px` | Top-left sharp, others rounded. Unfurling effect. | Banners, prominent alerts, top-anchored dropdowns. |
| **The Shield**| `4px 4px 32px 32px` | Top is rigid, bottom is heavily rounded. | Hero containers, bottom-sheet dialogs, product cards. |

---

## 4. Shape Morphing Techniques

Motion in Funky Design is driven by spring-physics, but shape morphing often requires CSS transitions on `border-radius`. Since interpolating complex radiuses can fail, we use `@property` to strongly type our custom properties for smooth animation.

### Global Setup for Morphing
```css
@property --morph-radius {
  syntax: '<length-percentage>';
  initial-value: 0px;
  inherits: false;
}
```

### Pattern A: FAB (Squircle → Pill on Expand)
```css
.fab {
  --morph-radius: 16px; /* Squircle approx for 56px FAB */
  width: 56px;
  height: 56px;
  border-radius: var(--morph-radius);
  transition: --morph-radius 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275),
              width 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
}

.fab:hover, .fab.expanded {
  --morph-radius: 9999px; /* Pill */
  width: 140px;
}
```

### Pattern B: Card Corner Morph on Hover (md → lg)
```css
/* Using Funk Mode's asymmetric Leaf pattern */
.card {
  border-radius: 12px 4px 12px 4px;
  transition: border-radius 0.3s ease-out;
}

.card:hover {
  border-radius: 24px 8px 24px 8px;
}
```

### Pattern C: Tab Indicator Morph
```css
.tab-indicator {
  height: 4px;
  width: 20px;
  border-radius: 4px;
  transition: width 0.3s ease, border-radius 0.3s ease;
}

.tab:hover .tab-indicator {
  width: 100%;
  border-radius: 9999px; /* Pill */
}
```

### Pattern D: Loading Shape Rotation (Blob)
```css
@keyframes funk-loader {
  0%   { border-radius: 60% 40% 30% 70% / 60% 30% 70% 40%; transform: rotate(0deg); }
  50%  { border-radius: 30% 60% 70% 40% / 50% 60% 30% 60%; }
  100% { border-radius: 60% 40% 30% 70% / 60% 30% 70% 40%; transform: rotate(360deg); }
}

.loader {
  width: 48px;
  height: 48px;
  background-color: var(--color-accent-fuchsia);
  animation: funk-loader 3s linear infinite;
}
```

### Pattern E: Toggle Track Shape Morph
```css
.toggle-track {
  width: 48px;
  height: 24px;
  border-radius: 24px; /* Pill by default */
  transition: border-radius 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

.toggle-input:checked + .toggle-track {
  /* Morphs into a Squircle track when activated in Funk Mode */
  border-radius: 6px; 
}
```

---

## 5. Shape Assignment Guide

| Component Role | Flow Mode Shape | Funk Mode Shape | Notes |
| :--- | :--- | :--- | :--- |
| **Primary Buttons** | Pill | Pill or Leaf (sm/md) | Actionable urgency. |
| **Avatars** | Circle | Squircle | Identifiers must stand out in Funk. |
| **Tags / Badges** | Small (4px) | Leaf (sm) | Compact and tidy. |
| **Inputs / Dropdowns**| Medium (8px) | Small Asymmetric | Keep inputs somewhat stable to ensure legibility. |
| **Cards** | Large (16px) | Leaf (lg) or Wave | Main content containers. |
| **Modals / Dialogs** | Extra Large (24px)| Shield (lg) or Leaf (xl) | High emphasis surfaces. |
| **Tooltips** | Small (4px) | The Chat | Points contextually to triggers. |

---

## 6. CSS Custom Properties

Complete CSS custom property definitions mapping the shape system to both modes.

```css
/* ------------------------- */
/* 🌊 FLOW MODE (Baseline)   */
/* ------------------------- */
:root {
  /* Symmetrical, stable shapes */
  --shape-sm: 4px;
  --shape-md: 8px;
  --shape-lg: 16px;
  --shape-xl: 24px;
  
  --shape-pill: 9999px;
  --shape-circle: 50%;
  
  /* Fallback approximation for standard use */
  --shape-squircle: 22.5%;
}

/* ------------------------- */
/* 🎸 FUNK MODE (Overrides)  */
/* ------------------------- */
[data-theme="funk"],
.theme-funk {
  /* Asymmetrical, bouncy shapes (The Leaf base pattern) */
  --shape-sm: 6px 2px 6px 2px;
  --shape-md: 12px 4px 12px 4px;
  --shape-lg: 24px 8px 24px 8px;
  --shape-xl: 32px 12px 32px 12px;
  
  /* Specific Patterns (Extracted for utility classes) */
  --shape-funk-leaf: 24px 4px 24px 4px;
  --shape-funk-chat: 20px 20px 20px 0px;
  --shape-funk-wave: 12px 24px 12px 24px;
  --shape-funk-flag: 0px 24px 24px 24px;
  --shape-funk-shield: 4px 4px 32px 32px;
  
  /* Inherits pill and circle from root */
}
```
