# Funky Design Component Reference

This reference document outlines the implementation details for all core components in the Funky Design system. Each component includes markup and styling for both **Funk 🎸** (bouncy, expressive, asymmetrical) and **Flow 🌊** (smooth, professional, consistent) modes.

## Table of Contents
1. [Button](#1-button)
2. [Card](#2-card)
3. [Navigation](#3-navigation)
4. [Dialog/Modal](#4-dialogmodal)
5. [Input Field](#5-input-field)
6. [Chips/Tags](#6-chipstags)
7. [Toast/Notification](#7-toastnotification)
8. [Tabs](#8-tabs)
9. [Toggle/Switch](#9-toggleswitch)
10. [Avatar](#10-avatar)
11. [Hero Section](#11-hero-section)
12. [Loading Indicator](#12-loading-indicator)

---

### 1. Button

#### HTML
```html
<!-- Primary -->
<button class="fd-button fd-button--primary">Submit</button>

<!-- Secondary -->
<button class="fd-button fd-button--secondary">Cancel</button>

<!-- Ghost -->
<button class="fd-button fd-button--ghost">Learn More</button>

<!-- Destructive -->
<button class="fd-button fd-button--destructive">Delete</button>

<!-- Disabled -->
<button class="fd-button fd-button--primary" disabled>Saving...</button>
```

#### CSS (Funk 🎸)
```css
.fd-button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: var(--space-2);
  padding: var(--space-3) var(--space-5);
  border: none;
  border-radius: var(--shape-pill);
  font-family: var(--font-family-system);
  font-size: var(--font-size-base);
  font-weight: var(--font-weight-semibold);
  cursor: pointer;
  transition: transform var(--ease-spring-bouncy), background-color var(--ease-standard), box-shadow var(--ease-spring-bouncy);
}

.fd-button--primary {
  background-color: var(--color-coral-500);
  color: var(--color-surface-sunlit);
  box-shadow: 4px 4px 0px var(--color-coral-700);
}

.fd-button--primary:hover {
  background-color: var(--color-coral-400);
  transform: translateY(-2px);
  box-shadow: 6px 6px 0px var(--color-coral-700);
}

.fd-button--primary:active {
  transform: translateY(2px) scale(0.95);
  box-shadow: 2px 2px 0px var(--color-coral-700);
}

.fd-button:focus-visible {
  outline: 3px solid var(--color-coral-300);
  outline-offset: 2px;
}

.fd-button:disabled {
  opacity: 0.6;
  cursor: not-allowed;
  transform: none;
  box-shadow: none;
  filter: grayscale(0.5);
}

.fd-button--secondary {
  background-color: var(--color-surface-sunlit);
  color: var(--color-coral-600);
  border: 2px solid var(--color-coral-500);
  box-shadow: 4px 4px 0px var(--color-coral-200);
}

.fd-button--secondary:hover {
  background-color: var(--color-coral-50);
  transform: translateY(-2px);
  box-shadow: 6px 6px 0px var(--color-coral-200);
}

.fd-button--secondary:active {
  transform: translateY(2px) scale(0.95);
  box-shadow: 2px 2px 0px var(--color-coral-200);
}

.fd-button--ghost {
  background-color: transparent;
  color: var(--color-coral-600);
}

.fd-button--ghost:hover {
  background-color: var(--color-coral-100);
  transform: scale(1.05);
}

.fd-button--ghost:active {
  transform: scale(0.95);
}

.fd-button--destructive {
  background-color: var(--color-fuchsia-500);
  color: var(--color-surface-sunlit);
  box-shadow: 4px 4px 0px var(--color-fuchsia-700);
}

.fd-button--destructive:hover {
  background-color: var(--color-fuchsia-400);
  transform: translateY(-2px);
  box-shadow: 6px 6px 0px var(--color-fuchsia-700);
}

.fd-button--destructive:active {
  transform: translateY(2px) scale(0.95);
  box-shadow: 2px 2px 0px var(--color-fuchsia-700);
}
```

#### CSS (Flow 🌊)
```css
.fd-button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: var(--space-2);
  padding: var(--space-3) var(--space-5);
  border: none;
  border-radius: var(--shape-pill);
  font-family: var(--font-family-system);
  font-size: var(--font-size-base);
  font-weight: var(--font-weight-medium);
  cursor: pointer;
  transition: transform var(--ease-spring-smooth), background-color var(--ease-standard), box-shadow var(--ease-standard);
}

.fd-button--primary {
  background-color: var(--color-coral-500);
  color: var(--color-surface-sunlit);
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
}

.fd-button--primary:hover {
  background-color: var(--color-coral-400);
  transform: translateY(-1px);
  box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
}

.fd-button--primary:active {
  transform: scale(0.98);
  box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
}

.fd-button:focus-visible {
  outline: 2px solid var(--color-coral-400);
  outline-offset: 2px;
}

.fd-button:disabled {
  opacity: 0.5;
  cursor: not-allowed;
  transform: none;
  box-shadow: none;
}

.fd-button--secondary {
  background-color: var(--color-surface-sunlit);
  color: var(--color-coral-600);
  border: 1px solid var(--color-coral-300);
}

.fd-button--secondary:hover {
  background-color: var(--color-coral-50);
  transform: translateY(-1px);
}

.fd-button--secondary:active {
  transform: scale(0.98);
}

.fd-button--ghost {
  background-color: transparent;
  color: var(--color-coral-600);
}

.fd-button--ghost:hover {
  background-color: var(--color-coral-50);
}

.fd-button--ghost:active {
  transform: scale(0.98);
  background-color: var(--color-coral-100);
}

.fd-button--destructive {
  background-color: var(--color-fuchsia-500);
  color: var(--color-surface-sunlit);
}

.fd-button--destructive:hover {
  background-color: var(--color-fuchsia-400);
  transform: translateY(-1px);
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
}

.fd-button--destructive:active {
  transform: scale(0.98);
  box-shadow: none;
}
```

#### States
| State | Funk 🎸 Visual Properties | Flow 🌊 Visual Properties |
| --- | --- | --- |
| **Default** | Colored solid shadow offset, pill shape, bouncy transform | Soft neutral drop shadow, pill shape, smooth transform |
| **Hover** | Increased shadow offset, `translateY(-2px)` | Increased blur/spread on shadow, `translateY(-1px)` |
| **Pressed** | Decreased shadow, `scale(0.95)`, `translateY(2px)` | Minimal shadow, `scale(0.98)` |
| **Focus** | 3px outline, 2px offset | 2px outline, 2px offset |
| **Disabled** | 60% opacity, grayscale filter, no interaction | 50% opacity, no interaction |

---

### 2. Card

#### HTML
```html
<!-- Default Card -->
<div class="fd-card">
  <h3 class="fd-card__title">Standard Content</h3>
  <p class="fd-card__body">Lorem ipsum dolor sit amet consectetur.</p>
</div>

<!-- Featured Card -->
<div class="fd-card fd-card--featured">
  <h3 class="fd-card__title">Special Announcement</h3>
  <p class="fd-card__body">This item requires your immediate attention.</p>
</div>
```

#### CSS (Funk 🎸)
```css
.fd-card {
  background-color: var(--color-surface-sunlit);
  padding: var(--space-6);
  border-radius: var(--shape-radius-xl) var(--shape-radius-md) var(--shape-radius-xl) var(--shape-radius-md);
  border: 2px solid var(--color-slate-800);
  box-shadow: 8px 8px 0px var(--color-slate-800);
  transition: transform var(--ease-spring-bouncy), box-shadow var(--ease-spring-bouncy);
}

.fd-card:hover {
  transform: translate(-2px, -2px);
  box-shadow: 10px 10px 0px var(--color-slate-800);
}

.fd-card:active {
  transform: translate(2px, 2px);
  box-shadow: 4px 4px 0px var(--color-slate-800);
}

.fd-card:focus-visible {
  outline: 3px solid var(--color-violet-400);
  outline-offset: 4px;
}

.fd-card--featured {
  background-color: var(--color-amber-100);
  border-color: var(--color-amber-500);
  box-shadow: 8px 8px 0px var(--color-amber-500);
}

.fd-card__title {
  font-family: var(--font-family-satoshi);
  font-size: var(--font-size-xl);
  font-weight: var(--font-weight-bold);
  margin-bottom: var(--space-3);
  color: var(--color-slate-900);
}

.fd-card__body {
  font-family: var(--font-family-system);
  color: var(--color-slate-700);
}
```

#### CSS (Flow 🌊)
```css
.fd-card {
  background-color: var(--color-surface-sunlit);
  padding: var(--space-6);
  border-radius: var(--shape-radius-md);
  border: 1px solid var(--color-slate-200);
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05), 0 2px 4px -1px rgba(0, 0, 0, 0.03);
  transition: transform var(--ease-spring-smooth), box-shadow var(--ease-spring-smooth);
}

.fd-card:hover {
  transform: translateY(-2px);
  box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
}

.fd-card:active {
  transform: translateY(0);
  box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06);
}

.fd-card:focus-visible {
  outline: 2px solid var(--color-violet-400);
  outline-offset: 4px;
}

.fd-card--featured {
  border-left: 4px solid var(--color-violet-500);
  background-color: var(--color-surface-sunlit);
}

.fd-card__title {
  font-family: var(--font-family-satoshi);
  font-size: var(--font-size-xl);
  font-weight: var(--font-weight-semibold);
  margin-bottom: var(--space-3);
  color: var(--color-slate-900);
}

.fd-card__body {
  font-family: var(--font-family-system);
  color: var(--color-slate-600);
}
```

#### States
| State | Funk 🎸 Visual Properties | Flow 🌊 Visual Properties |
| --- | --- | --- |
| **Default** | Asymmetric radii, solid offset shadow, heavy border | Consistent md radii, soft neutral shadow, thin border |
| **Hover** | `translate(-2px, -2px)`, larger shadow | `translateY(-2px)`, expanded soft shadow |
| **Pressed** | `translate(2px, 2px)`, smaller shadow | `translateY(0)`, collapsed shadow |
| **Focus** | 3px outline, 4px offset | 2px outline, 4px offset |

---

### 3. Navigation

#### HTML
```html
<nav class="fd-nav">
  <div class="fd-nav__container">
    <div class="fd-nav__logo">
      <span class="fd-nav__logo-text">FunkyApp</span>
    </div>
    
    <ul class="fd-nav__links">
      <li><a href="#" class="fd-nav__link">Home</a></li>
      <li><a href="#" class="fd-nav__link">Features</a></li>
      <li><a href="#" class="fd-nav__link">Pricing</a></li>
    </ul>
    
    <div class="fd-nav__actions">
      <button class="fd-button fd-button--primary">Get Started</button>
    </div>
    
    <button class="fd-nav__mobile-toggle" aria-label="Toggle menu">
      <span class="fd-nav__icon">☰</span>
    </button>
  </div>
</nav>
```

#### CSS (Funk 🎸)
```css
.fd-nav {
  position: sticky;
  top: 0;
  z-index: 50;
  background-color: var(--color-surface-sunlit);
  border-bottom: 3px solid var(--color-slate-900);
  box-shadow: 0 4px 0px var(--color-teal-400);
}

.fd-nav__container {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: var(--space-4) var(--space-6);
  max-width: 1200px;
  margin: 0 auto;
}

.fd-nav__logo-text {
  font-family: var(--font-family-satoshi);
  font-size: var(--font-size-2xl);
  font-weight: var(--font-weight-black);
  color: var(--color-slate-900);
  text-transform: uppercase;
  letter-spacing: -0.05em;
  transform: rotate(-2deg);
  display: inline-block;
}

.fd-nav__links {
  display: flex;
  list-style: none;
  gap: var(--space-6);
  margin: 0;
  padding: 0;
}

.fd-nav__link {
  font-family: var(--font-family-system);
  font-weight: var(--font-weight-bold);
  color: var(--color-slate-800);
  text-decoration: none;
  padding: var(--space-2) var(--space-3);
  border-radius: var(--shape-pill);
  transition: all var(--ease-spring-bouncy);
}

.fd-nav__link:hover {
  background-color: var(--color-teal-100);
  color: var(--color-teal-700);
  transform: rotate(2deg) scale(1.1);
}

.fd-nav__mobile-toggle {
  display: none;
  background: none;
  border: none;
  font-size: var(--font-size-xl);
  cursor: pointer;
}

@media (max-width: 768px) {
  .fd-nav__links, .fd-nav__actions {
    display: none;
  }
  .fd-nav__mobile-toggle {
    display: block;
  }
}
```

#### CSS (Flow 🌊)
```css
.fd-nav {
  position: sticky;
  top: 0;
  z-index: 50;
  background-color: var(--color-surface-sunlit);
  border-bottom: 1px solid var(--color-slate-200);
  box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
}

.fd-nav__container {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: var(--space-4) var(--space-6);
  max-width: 1200px;
  margin: 0 auto;
}

.fd-nav__logo-text {
  font-family: var(--font-family-satoshi);
  font-size: var(--font-size-xl);
  font-weight: var(--font-weight-bold);
  color: var(--color-slate-900);
}

.fd-nav__links {
  display: flex;
  list-style: none;
  gap: var(--space-6);
  margin: 0;
  padding: 0;
}

.fd-nav__link {
  font-family: var(--font-family-system);
  font-weight: var(--font-weight-medium);
  color: var(--color-slate-600);
  text-decoration: none;
  transition: color var(--ease-standard);
}

.fd-nav__link:hover {
  color: var(--color-teal-600);
}

.fd-nav__mobile-toggle {
  display: none;
  background: none;
  border: none;
  font-size: var(--font-size-xl);
  cursor: pointer;
  color: var(--color-slate-600);
}

@media (max-width: 768px) {
  .fd-nav__links, .fd-nav__actions {
    display: none;
  }
  .fd-nav__mobile-toggle {
    display: block;
  }
}
```

#### States
| State | Funk 🎸 Visual Properties | Flow 🌊 Visual Properties |
| --- | --- | --- |
| **Container** | Heavy border, colored solid shadow offset | Thin bottom border, slight neutral shadow |
| **Logo** | `font-weight-black`, slightly rotated `-2deg` | `font-weight-bold`, straight |
| **Link Hover** | Pill background, rotate + scale, bouncy | Simple color shift |
| **Mobile** | Links collapse to hamburger icon | Links collapse to hamburger icon |

---

### 4. Dialog/Modal

#### HTML
```html
<!-- Backdrop -->
<div class="fd-dialog-backdrop" aria-hidden="true"></div>

<!-- Dialog -->
<div class="fd-dialog" role="dialog" aria-modal="true" aria-labelledby="dialog-title">
  <div class="fd-dialog__header">
    <h2 id="dialog-title" class="fd-dialog__title">Confirm Action</h2>
    <button class="fd-dialog__close" aria-label="Close dialog">×</button>
  </div>
  <div class="fd-dialog__body">
    <p>Are you sure you want to proceed with this operation?</p>
  </div>
  <div class="fd-dialog__footer">
    <button class="fd-button fd-button--ghost">Cancel</button>
    <button class="fd-button fd-button--primary">Confirm</button>
  </div>
</div>
```

#### CSS (Both Modes - Shared Layout)
```css
.fd-dialog-backdrop {
  position: fixed;
  inset: 0;
  background-color: rgba(15, 23, 42, 0.5); /* var(--color-slate-900) at 50% opacity */
  z-index: 100;
  /* NO backdrop-filter per requirements */
}

.fd-dialog {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%) scale(0.9);
  opacity: 0;
  z-index: 101;
  background-color: var(--color-surface-sunlit);
  width: 90%;
  max-width: 500px;
  display: flex;
  flex-direction: column;
}

.fd-dialog.is-open {
  transform: translate(-50%, -50%) scale(1);
  opacity: 1;
}

.fd-dialog__header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: var(--space-5) var(--space-6);
  border-bottom: 1px solid var(--color-slate-200);
}

.fd-dialog__body {
  padding: var(--space-6);
}

.fd-dialog__footer {
  padding: var(--space-5) var(--space-6);
  display: flex;
  justify-content: flex-end;
  gap: var(--space-3);
  border-top: 1px solid var(--color-slate-200);
}

.fd-dialog__close {
  background: none;
  border: none;
  font-size: var(--font-size-2xl);
  cursor: pointer;
  line-height: 1;
}
```

#### CSS (Funk 🎸 Specific)
```css
.fd-dialog {
  border-radius: var(--shape-radius-xl) var(--shape-radius-md) var(--shape-radius-xl) var(--shape-radius-md);
  border: 3px solid var(--color-slate-900);
  box-shadow: 12px 12px 0px var(--color-violet-500);
  transition: transform var(--ease-spring-bouncy), opacity var(--ease-standard);
}

.fd-dialog__title {
  font-family: var(--font-family-satoshi);
  font-size: var(--font-size-2xl);
  font-weight: var(--font-weight-black);
}

.fd-dialog__close {
  color: var(--color-slate-800);
  transition: transform var(--ease-spring-bouncy);
}

.fd-dialog__close:hover {
  transform: rotate(90deg) scale(1.2);
  color: var(--color-fuchsia-500);
}
```

#### CSS (Flow 🌊 Specific)
```css
.fd-dialog {
  border-radius: var(--shape-radius-lg);
  box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
  border: 1px solid var(--color-slate-200);
  transition: transform var(--ease-spring-smooth), opacity var(--ease-standard);
}

.fd-dialog__title {
  font-family: var(--font-family-satoshi);
  font-size: var(--font-size-xl);
  font-weight: var(--font-weight-semibold);
}

.fd-dialog__close {
  color: var(--color-slate-500);
  transition: color var(--ease-standard);
}

.fd-dialog__close:hover {
  color: var(--color-slate-900);
}
```

#### States
| State | Funk 🎸 Visual Properties | Flow 🌊 Visual Properties |
| --- | --- | --- |
| **Entry** | Spring scale up, bouncy ease | Spring scale up, smooth ease |
| **Backdrop** | Opaque slate overlay | Opaque slate overlay |
| **Shape** | Asymmetric radii, heavy border | Symmetric lg radii, soft large shadow |

---

### 5. Input Field

#### HTML
```html
<div class="fd-field">
  <label for="username" class="fd-field__label">Username</label>
  <input type="text" id="username" class="fd-field__input" placeholder="Enter your username">
  <span class="fd-field__hint">Must be at least 4 characters.</span>
</div>

<div class="fd-field fd-field--error">
  <label for="email" class="fd-field__label">Email Address</label>
  <input type="email" id="email" class="fd-field__input" placeholder="you@example.com" aria-invalid="true">
  <span class="fd-field__error-msg">Please enter a valid email address.</span>
</div>
```

#### CSS (Funk 🎸)
```css
.fd-field {
  display: flex;
  flex-direction: column;
  gap: var(--space-2);
  margin-bottom: var(--space-4);
}

.fd-field__label {
  font-family: var(--font-family-system);
  font-weight: var(--font-weight-bold);
  color: var(--color-slate-900);
}

.fd-field__input {
  padding: var(--space-3) var(--space-4);
  font-family: var(--font-family-mono);
  font-size: var(--font-size-base);
  border: 2px solid var(--color-slate-800);
  border-radius: var(--shape-radius-md);
  background-color: var(--color-surface-sunlit);
  box-shadow: 4px 4px 0px var(--color-lime-300);
  transition: all var(--ease-spring-bouncy);
}

.fd-field__input:focus {
  outline: none;
  border-color: var(--color-lime-500);
  box-shadow: 6px 6px 0px var(--color-lime-500);
  transform: translate(-2px, -2px);
}

.fd-field__input:disabled {
  background-color: var(--color-slate-100);
  box-shadow: none;
  cursor: not-allowed;
}

.fd-field__hint, .fd-field__error-msg {
  font-family: var(--font-family-system);
  font-size: var(--font-size-sm);
}

.fd-field__hint {
  color: var(--color-slate-600);
}

.fd-field--error .fd-field__input {
  border-color: var(--color-fuchsia-500);
  box-shadow: 4px 4px 0px var(--color-fuchsia-300);
}

.fd-field--error .fd-field__input:focus {
  box-shadow: 6px 6px 0px var(--color-fuchsia-500);
}

.fd-field--error .fd-field__error-msg {
  color: var(--color-fuchsia-600);
  font-weight: var(--font-weight-bold);
}
```

#### CSS (Flow 🌊)
```css
.fd-field {
  display: flex;
  flex-direction: column;
  gap: var(--space-2);
  margin-bottom: var(--space-4);
}

.fd-field__label {
  font-family: var(--font-family-system);
  font-weight: var(--font-weight-medium);
  color: var(--color-slate-700);
}

.fd-field__input {
  padding: var(--space-3) var(--space-4);
  font-family: var(--font-family-system);
  font-size: var(--font-size-base);
  border: 1px solid var(--color-slate-300);
  border-radius: var(--shape-radius-md);
  background-color: var(--color-surface-sunlit);
  transition: all var(--ease-standard);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.05);
}

.fd-field__input:focus {
  outline: none;
  border-color: var(--color-violet-500);
  box-shadow: 0 0 0 3px rgba(139, 92, 246, 0.2);
}

.fd-field__input:disabled {
  background-color: var(--color-slate-50);
  color: var(--color-slate-400);
  cursor: not-allowed;
}

.fd-field__hint, .fd-field__error-msg {
  font-family: var(--font-family-system);
  font-size: var(--font-size-sm);
}

.fd-field__hint {
  color: var(--color-slate-500);
}

.fd-field--error .fd-field__input {
  border-color: var(--color-fuchsia-500);
}

.fd-field--error .fd-field__input:focus {
  box-shadow: 0 0 0 3px rgba(217, 70, 239, 0.2);
}

.fd-field--error .fd-field__error-msg {
  color: var(--color-fuchsia-600);
}
```

#### States
| State | Funk 🎸 Visual Properties | Flow 🌊 Visual Properties |
| --- | --- | --- |
| **Default** | Mono font input, heavy border, solid color shadow | System font, thin border, inset shadow |
| **Focus** | Increased shadow, `translate(-2px, -2px)`, lime accent | Soft ring shadow (3px spread), violet accent |
| **Error** | Fuchsia border + shadow | Fuchsia border + soft ring shadow |
| **Disabled** | Gray background, no shadow, not-allowed cursor | Light gray background, muted text |

---

### 6. Chips/Tags

#### HTML
```html
<!-- Static Chip -->
<span class="fd-chip fd-chip--amber">New Feature</span>

<!-- Interactive Chip -->
<button class="fd-chip fd-chip--interactive fd-chip--teal">
  Design System
  <span class="fd-chip__close">×</span>
</button>
```

#### CSS (Funk 🎸)
```css
.fd-chip {
  display: inline-flex;
  align-items: center;
  gap: var(--space-2);
  padding: var(--space-1) var(--space-3);
  border-radius: var(--shape-pill);
  font-family: var(--font-family-mono);
  font-size: var(--font-size-sm);
  font-weight: var(--font-weight-bold);
  text-transform: uppercase;
  border: 2px solid var(--color-slate-900);
}

.fd-chip--amber {
  background-color: var(--color-amber-300);
  color: var(--color-slate-900);
  box-shadow: 3px 3px 0px var(--color-amber-500);
}

.fd-chip--teal {
  background-color: var(--color-teal-300);
  color: var(--color-slate-900);
  box-shadow: 3px 3px 0px var(--color-teal-500);
}

.fd-chip--interactive {
  cursor: pointer;
  transition: transform var(--ease-spring-bouncy), box-shadow var(--ease-spring-bouncy);
}

.fd-chip--interactive:hover {
  transform: translate(-1px, -1px);
  box-shadow: 4px 4px 0px var(--color-slate-900);
}

.fd-chip--interactive:active {
  transform: translate(2px, 2px);
  box-shadow: 1px 1px 0px var(--color-slate-900);
}

.fd-chip__close {
  font-size: var(--font-size-lg);
  line-height: 1;
}
```

#### CSS (Flow 🌊)
```css
.fd-chip {
  display: inline-flex;
  align-items: center;
  gap: var(--space-2);
  padding: var(--space-1) var(--space-3);
  border-radius: var(--shape-pill);
  font-family: var(--font-family-system);
  font-size: var(--font-size-sm);
  font-weight: var(--font-weight-medium);
}

.fd-chip--amber {
  background-color: var(--color-amber-100);
  color: var(--color-amber-800);
}

.fd-chip--teal {
  background-color: var(--color-teal-100);
  color: var(--color-teal-800);
}

.fd-chip--interactive {
  border: none;
  cursor: pointer;
  transition: background-color var(--ease-standard);
}

.fd-chip--interactive.fd-chip--teal:hover {
  background-color: var(--color-teal-200);
}

.fd-chip__close {
  font-size: var(--font-size-base);
  opacity: 0.6;
}

.fd-chip--interactive:hover .fd-chip__close {
  opacity: 1;
}
```

#### States
| State | Funk 🎸 Visual Properties | Flow 🌊 Visual Properties |
| --- | --- | --- |
| **Default** | Mono font, uppercase, heavy border, offset shadow | System font, normal case, soft background, no border |
| **Interactive Hover** | Bouncy translate, dark shadow increase | Darker background shade |
| **Interactive Pressed** | Depressed translate, shadow decrease | `scale(0.98)` |

---

### 7. Toast/Notification

#### HTML
```html
<div class="fd-toast fd-toast--success" role="alert">
  <div class="fd-toast__content">
    <span class="fd-toast__icon">✓</span>
    <p class="fd-toast__message">Your settings have been saved.</p>
  </div>
  <button class="fd-toast__close" aria-label="Close">×</button>
  <div class="fd-toast__progress-bar"></div>
</div>
```

#### CSS (Both Modes - Shared Layout)
```css
.fd-toast {
  position: fixed;
  bottom: var(--space-6);
  right: var(--space-6);
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
  width: 320px;
  overflow: hidden;
  z-index: 200;
  /* Entry animation handled via JS/Classes usually */
  transform: translateX(120%);
}

.fd-toast.is-visible {
  transform: translateX(0);
}

.fd-toast__content {
  display: flex;
  align-items: center;
  gap: var(--space-3);
  padding: var(--space-4);
  flex-grow: 1;
}

.fd-toast__close {
  background: none;
  border: none;
  padding: var(--space-4);
  cursor: pointer;
}

.fd-toast__progress-bar {
  position: absolute;
  bottom: 0;
  left: 0;
  height: 4px;
  background-color: rgba(255, 255, 255, 0.5);
  width: 100%;
  transform-origin: left;
  animation: toast-progress 4s linear forwards;
}

@keyframes toast-progress {
  to { transform: scaleX(0); }
}
```

#### CSS (Funk 🎸 Specific)
```css
.fd-toast {
  background-color: var(--color-lime-400);
  border: 3px solid var(--color-slate-900);
  border-radius: var(--shape-radius-xl) var(--shape-radius-md) var(--shape-radius-xl) var(--shape-radius-md);
  box-shadow: 8px 8px 0px var(--color-slate-900);
  transition: transform var(--ease-spring-bouncy);
}

.fd-toast__message {
  font-family: var(--font-family-satoshi);
  font-weight: var(--font-weight-bold);
  color: var(--color-slate-900);
}

.fd-toast__close {
  color: var(--color-slate-900);
  font-size: var(--font-size-xl);
  font-weight: var(--font-weight-black);
}

.fd-toast__progress-bar {
  background-color: var(--color-slate-900);
}
```

#### CSS (Flow 🌊 Specific)
```css
.fd-toast {
  background-color: var(--color-surface-sunlit);
  border-left: 4px solid var(--color-teal-500);
  border-radius: var(--shape-radius-md);
  box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
  transition: transform var(--ease-spring-smooth);
}

.fd-toast__message {
  font-family: var(--font-family-system);
  font-weight: var(--font-weight-medium);
  color: var(--color-slate-800);
}

.fd-toast__close {
  color: var(--color-slate-500);
}

.fd-toast__progress-bar {
  background-color: var(--color-teal-500);
}
```

#### States
| State | Funk 🎸 Visual Properties | Flow 🌊 Visual Properties |
| --- | --- | --- |
| **Entry** | Slide in from right with bouncy spring | Slide in from right with smooth spring |
| **Background** | Vibrant accent color (Lime), asymmetric shape | Surface color with accent left border |
| **Progress** | Dark solid bar, linear scaleX | Accent colored bar, linear scaleX |

---

### 8. Tabs

#### HTML
```html
<div class="fd-tabs">
  <div class="fd-tabs__list" role="tablist">
    <button class="fd-tabs__tab is-active" role="tab" aria-selected="true">Overview</button>
    <button class="fd-tabs__tab" role="tab" aria-selected="false">Settings</button>
    <button class="fd-tabs__tab" role="tab" aria-selected="false">Activity</button>
    <div class="fd-tabs__indicator"></div>
  </div>
</div>
```

#### CSS (Funk 🎸)
```css
.fd-tabs__list {
  display: flex;
  gap: var(--space-2);
  position: relative;
  padding-bottom: var(--space-2);
}

.fd-tabs__tab {
  background: none;
  border: none;
  padding: var(--space-2) var(--space-4);
  font-family: var(--font-family-mono);
  font-weight: var(--font-weight-bold);
  font-size: var(--font-size-sm);
  text-transform: uppercase;
  color: var(--color-slate-600);
  cursor: pointer;
  position: relative;
  z-index: 1;
}

.fd-tabs__tab.is-active {
  color: var(--color-slate-900);
}

.fd-tabs__indicator {
  position: absolute;
  bottom: 0;
  height: 4px;
  background-color: var(--color-violet-500);
  border-radius: var(--shape-pill);
  transition: transform var(--ease-spring-bouncy), width var(--ease-spring-bouncy), border-radius var(--ease-spring-bouncy);
  /* JS sets width and translateX */
}
```

#### CSS (Flow 🌊)
```css
.fd-tabs__list {
  display: flex;
  gap: var(--space-6);
  position: relative;
  border-bottom: 1px solid var(--color-slate-200);
}

.fd-tabs__tab {
  background: none;
  border: none;
  padding: var(--space-3) 0;
  font-family: var(--font-family-system);
  font-weight: var(--font-weight-medium);
  font-size: var(--font-size-base);
  color: var(--color-slate-500);
  cursor: pointer;
}

.fd-tabs__tab.is-active {
  color: var(--color-slate-900);
}

.fd-tabs__indicator {
  position: absolute;
  bottom: -1px;
  height: 2px;
  background-color: var(--color-violet-500);
  transition: transform var(--ease-spring-smooth), width var(--ease-spring-smooth);
}
```

#### States
| State | Funk 🎸 Visual Properties | Flow 🌊 Visual Properties |
| --- | --- | --- |
| **Default Tab** | Mono, uppercase, gray text | System font, standard case, gray text |
| **Active Tab** | Dark slate text | Dark slate text |
| **Indicator Motion** | Morphing width, bouncy spring translation | Smooth sliding width and translation |

---

### 9. Toggle/Switch

#### HTML
```html
<label class="fd-toggle">
  <input type="checkbox" class="fd-toggle__input" sr-only>
  <div class="fd-toggle__track">
    <div class="fd-toggle__thumb"></div>
  </div>
  <span class="fd-toggle__label">Enable Notifications</span>
</label>
```

#### CSS (Funk 🎸)
```css
.fd-toggle {
  display: inline-flex;
  align-items: center;
  gap: var(--space-3);
  cursor: pointer;
}

.fd-toggle__input {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0;
}

.fd-toggle__track {
  width: 56px;
  height: 32px;
  background-color: var(--color-slate-200);
  border: 2px solid var(--color-slate-900);
  border-radius: var(--shape-pill);
  position: relative;
  transition: background-color var(--ease-standard);
  box-shadow: inset 4px 4px 0px rgba(0,0,0,0.1);
}

.fd-toggle__thumb {
  width: 24px;
  height: 24px;
  background-color: var(--color-surface-sunlit);
  border: 2px solid var(--color-slate-900);
  border-radius: 50%;
  position: absolute;
  top: 2px;
  left: 2px;
  transition: transform var(--ease-spring-bouncy);
}

.fd-toggle__input:checked + .fd-toggle__track {
  background-color: var(--color-lime-400);
}

.fd-toggle__input:checked + .fd-toggle__track .fd-toggle__thumb {
  transform: translateX(24px);
}

.fd-toggle__label {
  font-family: var(--font-family-satoshi);
  font-weight: var(--font-weight-bold);
}
```

#### CSS (Flow 🌊)
```css
.fd-toggle {
  display: inline-flex;
  align-items: center;
  gap: var(--space-3);
  cursor: pointer;
}

.fd-toggle__track {
  width: 44px;
  height: 24px;
  background-color: var(--color-slate-300);
  border-radius: var(--shape-pill);
  position: relative;
  transition: background-color var(--ease-standard);
}

.fd-toggle__thumb {
  width: 20px;
  height: 20px;
  background-color: var(--color-surface-sunlit);
  border-radius: 50%;
  position: absolute;
  top: 2px;
  left: 2px;
  box-shadow: 0 1px 3px rgba(0,0,0,0.2);
  transition: transform var(--ease-spring-smooth);
}

.fd-toggle__input:checked + .fd-toggle__track {
  background-color: var(--color-teal-500);
}

.fd-toggle__input:checked + .fd-toggle__track .fd-toggle__thumb {
  transform: translateX(20px);
}

.fd-toggle__label {
  font-family: var(--font-family-system);
  font-weight: var(--font-weight-medium);
  color: var(--color-slate-700);
}
```

#### States
| State | Funk 🎸 Visual Properties | Flow 🌊 Visual Properties |
| --- | --- | --- |
| **Off** | Gray track, heavy border, thumb left | Gray track, no border, thumb left |
| **On** | Lime track, thumb bouncy translates right | Teal track, thumb smoothly translates right |
| **Focus** | Outline on track | Outline on track |

---

### 10. Avatar

#### HTML
```html
<div class="fd-avatar fd-avatar--lg">
  <img src="/path/to/img.jpg" alt="User" class="fd-avatar__img">
  <span class="fd-avatar__status fd-avatar__status--online"></span>
</div>
```

#### CSS (Both Modes - Layout)
```css
.fd-avatar {
  position: relative;
  display: inline-flex;
}

.fd-avatar__img {
  object-fit: cover;
  width: 100%;
  height: 100%;
}

.fd-avatar__status {
  position: absolute;
  bottom: 0;
  right: 0;
  width: 25%;
  height: 25%;
  border-radius: 50%;
  background-color: var(--color-lime-500);
}

.fd-avatar--sm { width: 32px; height: 32px; }
.fd-avatar--md { width: 48px; height: 48px; }
.fd-avatar--lg { width: 64px; height: 64px; }
.fd-avatar--xl { width: 96px; height: 96px; }
```

#### CSS (Funk 🎸 Specific)
```css
.fd-avatar__img {
  /* Squircle approximation using border-radius */
  border-radius: 40% 60% 70% 30% / 40% 50% 60% 50%;
  border: 2px solid var(--color-slate-900);
  box-shadow: 4px 4px 0px var(--color-fuchsia-400);
}

.fd-avatar__status {
  border: 2px solid var(--color-slate-900);
  transform: translate(25%, 25%);
}
```

#### CSS (Flow 🌊 Specific)
```css
.fd-avatar__img {
  border-radius: 50%; /* Circle for Flow */
}

.fd-avatar__status {
  border: 2px solid var(--color-surface-sunlit);
  transform: translate(10%, 10%);
}
```

#### States
| State | Funk 🎸 Visual Properties | Flow 🌊 Visual Properties |
| --- | --- | --- |
| **Shape** | Squircle (asymmetric radii), heavy border | Perfect circle |
| **Shadow** | Solid offset shadow | None |
| **Status Dot** | Heavy border | Surface color border for cutoff |

---

### 11. Hero Section

#### HTML
```html
<section class="fd-hero">
  <div class="fd-hero__content">
    <h1 class="fd-hero__title">Build with Expressive Joy.</h1>
    <p class="fd-hero__subtitle">The design system that brings the party to professional software.</p>
    <div class="fd-hero__actions">
      <button class="fd-button fd-button--primary">Get Started</button>
      <button class="fd-button fd-button--ghost">Read Documentation</button>
    </div>
  </div>
</section>
```

#### CSS (Funk 🎸)
```css
.fd-hero {
  padding: var(--space-12) var(--space-6);
  background-color: var(--color-amber-100);
  /* Optional Mesh Gradient Approximation */
  background-image: radial-gradient(at 0% 0%, var(--color-fuchsia-200) 0px, transparent 50%),
                    radial-gradient(at 100% 100%, var(--color-coral-200) 0px, transparent 50%);
  border-bottom: 4px solid var(--color-slate-900);
  text-align: center;
}

.fd-hero__title {
  font-family: var(--font-family-satoshi);
  font-size: var(--font-size-display-xl);
  font-weight: var(--font-weight-black);
  color: var(--color-slate-900);
  line-height: 1.1;
  margin-bottom: var(--space-6);
  text-shadow: 4px 4px 0px var(--color-surface-sunlit);
}

.fd-hero__subtitle {
  font-family: var(--font-family-mono);
  font-size: var(--font-size-xl);
  color: var(--color-slate-800);
  max-width: 600px;
  margin: 0 auto var(--space-8);
}

.fd-hero__actions {
  display: flex;
  justify-content: center;
  gap: var(--space-4);
}
```

#### CSS (Flow 🌊)
```css
.fd-hero {
  padding: var(--space-12) var(--space-6);
  background-color: var(--color-surface-sunlit);
  text-align: center;
}

.fd-hero__title {
  font-family: var(--font-family-satoshi);
  font-size: var(--font-size-display-xl);
  font-weight: var(--font-weight-bold);
  color: var(--color-slate-900);
  line-height: 1.2;
  margin-bottom: var(--space-4);
  letter-spacing: -0.02em;
}

.fd-hero__subtitle {
  font-family: var(--font-family-system);
  font-size: var(--font-size-xl);
  color: var(--color-slate-600);
  max-width: 600px;
  margin: 0 auto var(--space-8);
}

.fd-hero__actions {
  display: flex;
  justify-content: center;
  gap: var(--space-4);
}
```

#### States
| State | Funk 🎸 Visual Properties | Flow 🌊 Visual Properties |
| --- | --- | --- |
| **Background** | Mesh gradient, heavy bottom border | Clean surface background |
| **Typography** | `display-xl`, black weight, text-shadow | `display-xl`, bold weight, tight letter-spacing |

---

### 12. Loading Indicator

#### HTML
```html
<div class="fd-loader fd-loader--md" role="status" aria-label="Loading">
  <div class="fd-loader__shape"></div>
</div>
```

#### CSS (Funk 🎸)
```css
.fd-loader {
  display: inline-flex;
  justify-content: center;
  align-items: center;
}

.fd-loader--sm .fd-loader__shape { width: 24px; height: 24px; }
.fd-loader--md .fd-loader__shape { width: 48px; height: 48px; }
.fd-loader--lg .fd-loader__shape { width: 64px; height: 64px; }

.fd-loader__shape {
  background-color: var(--color-violet-500);
  animation: funk-morph 2s var(--ease-spring-bouncy) infinite alternate;
}

@keyframes funk-morph {
  0% {
    border-radius: 20% 80% 30% 70%;
    transform: rotate(0deg) scale(0.8);
    background-color: var(--color-violet-500);
  }
  50% {
    background-color: var(--color-fuchsia-500);
  }
  100% {
    border-radius: 70% 30% 80% 20%;
    transform: rotate(180deg) scale(1.1);
    background-color: var(--color-coral-500);
  }
}
```

#### CSS (Flow 🌊)
```css
.fd-loader {
  display: inline-flex;
  justify-content: center;
  align-items: center;
}

.fd-loader--sm .fd-loader__shape { width: 24px; height: 24px; }
.fd-loader--md .fd-loader__shape { width: 40px; height: 40px; }
.fd-loader--lg .fd-loader__shape { width: 56px; height: 56px; }

.fd-loader__shape {
  border-radius: 50%;
  background-color: var(--color-teal-500);
  animation: flow-pulse 1.5s ease-in-out infinite;
}

@keyframes flow-pulse {
  0% {
    transform: scale(0.8);
    opacity: 0.5;
  }
  50% {
    transform: scale(1);
    opacity: 1;
  }
  100% {
    transform: scale(0.8);
    opacity: 0.5;
  }
}
```

#### States
| State | Funk 🎸 Visual Properties | Flow 🌊 Visual Properties |
| --- | --- | --- |
| **Animation** | Shape morphing + rotation + color shifting | Soft scale pulsing |
| **Easing** | Spring bouncy | Ease-in-out |
| **Shape** | Asymmetric morphing | Perfect circle |
