# Funky Design: Motion System Reference

The Funky Design motion system abandons timeline-based easings in favor of physics-driven springs. This ensures interactions feel responsive, continuous, and alive. 

We utilize two primary expressions of motion:
- **Funk** 🎸: Maximum expression, bouncy, high energy, reactive.
- **Flow** 🌊: Professional warmth, smooth, consistent, neutral.

---

## 1. Spring Presets — Full Specification

Our spring configurations use a standard (stiffness, damping, mass) model. The `linear()` CSS equivalents are pre-computed at 60fps for immediate copy-pasting into stylesheets.

| Preset | Params (k, c, m) | Est. Duration | Character | Use Cases |
| :--- | :--- | :--- | :--- | :--- |
| **Bouncy** | `k: 400, c: 15, m: 1` | ~800ms | High energy, pronounced overshoot. | **Funk** mode reveals, major interactions, playful toggles. |
| **Snappy** | `k: 500, c: 25, m: 1` | ~500ms | Fast, crisp, highly responsive. | Toggles, rapid UI elements, checkmarks. |
| **Gentle** | `k: 120, c: 14, m: 1` | ~1000ms | Smooth, minimal to no overshoot. | **Flow** mode page transitions, large containers. |
| **Quick** | `k: 800, c: 40, m: 1` | ~300ms | Extremely tight, subtle. | Hover states, tooltips, micro-interactions. |

### The `linear()` CSS Easing Strings

```css
/* spring-bouncy */
--ease-spring-bouncy: linear(0, 0.16, 0.46, 0.79, 1.13, 1.25, 1.23, 1.11, 0.95, 0.88, 0.92, 1.01, 1.04, 1.02, 0.99, 0.99, 1.0, 1.0);

/* spring-snappy */
--ease-spring-snappy: linear(0, 0.32, 0.72, 1.0, 1.09, 1.04, 0.98, 1.0, 1.01, 1.0);

/* spring-gentle */
--ease-spring-gentle: linear(0, 0.08, 0.28, 0.54, 0.77, 0.92, 0.99, 1.01, 1.0, 1.0);

/* spring-quick */
--ease-spring-quick: linear(0, 0.51, 0.89, 1.0, 1.01, 1.0, 1.0);
```

---

## 2. CSS Motion Tokens

Complete `:root` block for drop-in usage across the application.

```css
:root {
  /* Easings */
  --ease-spring-bouncy: linear(0, 0.16, 0.46, 0.79, 1.13, 1.25, 1.23, 1.11, 0.95, 0.88, 0.92, 1.01, 1.04, 1.02, 0.99, 0.99, 1.0, 1.0);
  --ease-spring-snappy: linear(0, 0.32, 0.72, 1.0, 1.09, 1.04, 0.98, 1.0, 1.01, 1.0);
  --ease-spring-gentle: linear(0, 0.08, 0.28, 0.54, 0.77, 0.92, 0.99, 1.01, 1.0, 1.0);
  --ease-spring-quick:  linear(0, 0.51, 0.89, 1.0, 1.01, 1.0, 1.0);

  /* Matched Durations (Required for linear() approximation to work correctly) */
  --duration-spring-bouncy: 800ms;
  --duration-spring-snappy: 500ms;
  --duration-spring-gentle: 1000ms;
  --duration-spring-quick:  300ms;

  /* Standard Webkit Fallbacks if needed */
  --ease-in-out-smooth: cubic-bezier(0.4, 0, 0.2, 1);
}
```

---

## 3. JavaScript Spring Implementation

For gesture-driven animations where CSS `linear()` interpolation is insufficient (e.g., dynamically changing targets mid-animation), use this minimal, dependency-free Euler spring solver.

```javascript
/**
 * Computes the next frame of a spring simulation.
 * 
 * @param {number} current - Current position
 * @param {number} target - Target position
 * @param {number} velocity - Current velocity
 * @param {number} damping - Spring damping (friction)
 * @param {number} stiffness - Spring stiffness (tension)
 * @param {number} mass - Object mass
 * @param {number} dt - Time delta in seconds (default ~16.6ms for 60fps)
 * @returns {{ position: number, velocity: number }}
 */
function stepSpring(current, target, velocity, damping, stiffness, mass = 1, dt = 1/60) {
  // Hooke's Law: F = -k * x - c * v
  const displacement = current - target;
  const springForce = -stiffness * displacement;
  const dampingForce = -damping * velocity;
  
  const totalForce = springForce + dampingForce;
  const acceleration = totalForce / mass;
  
  const newVelocity = velocity + acceleration * dt;
  const newPosition = current + newVelocity * dt;
  
  return { 
    position: newPosition, 
    velocity: newVelocity 
  };
}

// Example usage in requestAnimationFrame:
// let state = { pos: 0, vel: 0 };
// function loop() {
//   state = stepSpring(state.pos, 100, state.vel, 15, 400);
//   element.style.transform = `translateX(${state.pos}px)`;
//   if (Math.abs(100 - state.pos) > 0.1 || Math.abs(state.vel) > 0.1) requestAnimationFrame(loop);
// }
```

---

## 4. Velocity Handoff

Fluid interfaces require passing the user's gesture velocity directly into the release animation.

### Vanilla JS Velocity Tracking

```javascript
class GestureTracker {
  constructor() {
    this.history = [];
  }

  track(event) {
    const now = performance.now();
    this.history.push({ y: event.clientY, t: now });
    // Keep only last 100ms of data for accurate release velocity
    this.history = this.history.filter(point => now - point.t < 100);
  }

  getVelocity() {
    if (this.history.length < 2) return 0;
    const first = this.history[0];
    const last = this.history[this.history.length - 1];
    const dt = last.t - first.t;
    if (dt === 0) return 0;
    // Return pixels per second
    return ((last.y - first.y) / dt) * 1000;
  }
}

// Usage:
// pointermove -> tracker.track(e)
// pointerup -> const v = tracker.getVelocity(); startSpring(v);
```

### Framer Motion Velocity Handoff Example

Using Framer Motion, velocity is automatically tracked and can be injected into the `animate` function.

```jsx
import { motion, useMotionValue, useAnimation } from "framer-motion";

function SwipeableElement() {
  const y = useMotionValue(0);
  const controls = useAnimation();

  const handleDragEnd = (event, info) => {
    const velocity = info.velocity.y;
    
    // Hand off gesture velocity to a bouncy spring
    controls.start({
      y: 0, // return to origin
      transition: {
        type: "spring",
        stiffness: 400,
        damping: 15,
        mass: 1,
        velocity: velocity // Critical for fluid handoff
      }
    });
  };

  return (
    <motion.div
      drag="y"
      dragConstraints={{ top: 0, bottom: 0 }}
      onDragEnd={handleDragEnd}
      animate={controls}
      style={{ y }}
      className="bg-coral-500 rounded-squircle w-32 h-32"
    />
  );
}
```

---

## 5. Momentum Projection

When a user flicks an item (like a scroll view or a sheet), we must calculate where it will naturally stop to determine snap points.

```javascript
/**
 * Calculates the final resting position of a flick gesture.
 * Based on Apple's exponential decay model.
 * 
 * @param {number} velocity - pixels per second
 * @param {number} decelerationRate - standard 0.998 for normal scrolling, 0.99 for fast
 * @returns {number} projected distance traveled
 */
function project(velocity, decelerationRate = 0.998) {
  return (velocity / 1000) * decelerationRate / (1 - decelerationRate);
}

// Complete Example: Projecting to nearest snap point
function handleFlickRelease(currentY, velocityY) {
  const predictedY = currentY + project(velocityY);
  
  const snapPoints = [0, 300, 600]; // e.g., Top, Middle, Bottom sheet heights
  
  // Find closest snap point
  const closestSnap = snapPoints.reduce((prev, curr) => {
    return (Math.abs(curr - predictedY) < Math.abs(prev - predictedY) ? curr : prev);
  });
  
  // Animate to `closestSnap` using `spring-gentle` and `velocityY`
  return closestSnap;
}
```

---

## 6. Rubber-Banding

Rubber-banding creates resistance when dragging past boundaries.

### JavaScript Implementation

```javascript
/**
 * Applies rubber-band tension to an over-dragged distance.
 * 
 * @param {number} overdrag - The distance dragged past the boundary
 * @param {number} dimension - The size of the container (e.g., window.innerHeight)
 * @param {number} constant - Resistance multiplier (default 0.55)
 * @returns {number} The visually translated distance
 */
function rubberBand(overdrag, dimension, constant = 0.55) {
  if (overdrag === 0) return 0;
  const sign = Math.sign(overdrag);
  const absOverdrag = Math.abs(overdrag);
  
  const result = (1 - (1 / ((absOverdrag * constant / dimension) + 1))) * dimension;
  return result * sign;
}
```

### CSS Implementation (Approximation)

For CSS-only scroll boundaries, rely on native `overscroll-behavior`. However, for custom CSS drag logic via variables:

```css
.card {
  /* Assuming --drag-y is updated via JS */
  /* This creates a primitive logarithmic curve mimicking rubber-banding in CSS */
  --dimension: 800;
  --clamped-y: max(-100, min(100, var(--drag-y))); /* Hard clamp fallback */
  
  /* Applying an ease-out math curve if CSS math functions permit, 
     otherwise rely on JS for precise rubber-banding. */
  transform: translateY(var(--clamped-y, 0px));
}
```

---

## 7. Interaction Pattern Recipes

### A. Button Press (Funk Mode)

```css
.btn-funk {
  transition: transform var(--duration-spring-quick) var(--ease-spring-quick);
  will-change: transform;
}

.btn-funk:active {
  /* Scale down on press */
  transform: scale(0.92);
  /* Switch to faster transition for the down-press, 
     use the spring for the release */
  transition-duration: 100ms;
  transition-timing-function: cubic-bezier(0, 0, 0.2, 1);
}
```

### B. Drag-to-Dismiss Sheet (Vanilla + CSS Springs)

```javascript
const sheet = document.querySelector('.sheet');
let startY = 0, currentY = 0, isDragging = false;
const tracker = new GestureTracker();

sheet.addEventListener('pointerdown', (e) => {
  isDragging = true;
  startY = e.clientY - currentY;
  sheet.style.transition = 'none'; // Disable springs while dragging
});

window.addEventListener('pointermove', (e) => {
  if (!isDragging) return;
  tracker.track(e);
  let y = e.clientY - startY;
  
  // Rubber-band if dragged upwards (past 0)
  if (y < 0) y = rubberBand(y, window.innerHeight);
  
  currentY = y;
  sheet.style.transform = `translateY(${currentY}px)`;
});

window.addEventListener('pointerup', () => {
  if (!isDragging) return;
  isDragging = false;
  
  const velocity = tracker.getVelocity();
  const projectedY = currentY + project(velocity);
  const threshold = window.innerHeight * 0.3;
  
  sheet.style.transition = 'transform var(--duration-spring-bouncy) var(--ease-spring-bouncy)';
  
  if (projectedY > threshold || velocity > 500) {
    // Dismiss
    currentY = window.innerHeight;
  } else {
    // Snap back
    currentY = 0;
  }
  
  sheet.style.transform = `translateY(${currentY}px)`;
});
```

### C. Scroll-Triggered Reveal

```javascript
const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('is-revealed');
    }
  });
}, { threshold: 0.1 });

document.querySelectorAll('.reveal-item').forEach(el => observer.observe(el));
```

```css
.reveal-item {
  opacity: 0;
  transform: translateY(40px) scale(0.95);
  transition: 
    opacity 400ms ease-out,
    transform var(--duration-spring-bouncy) var(--ease-spring-bouncy);
}

.reveal-item.is-revealed {
  opacity: 1;
  transform: translateY(0) scale(1);
}
```

### D. Modal Enter/Exit

```css
.modal-overlay {
  opacity: 0;
  transition: opacity 300ms ease-out;
}

.modal-content {
  opacity: 0;
  transform: scale(0.8) translateY(20px);
  transition: 
    opacity 200ms ease-out,
    transform var(--duration-spring-gentle) var(--ease-spring-gentle);
}

.modal-container.is-open .modal-overlay {
  opacity: 1;
}

.modal-container.is-open .modal-content {
  opacity: 1;
  transform: scale(1) translateY(0);
}
```

---

## 8. Reduced Motion

Respecting user accessibility preferences by nullifying springs and replacing spatial animations with simple opacity fades.

```css
@media (prefers-reduced-motion: reduce) {
  :root {
    /* Override duration tokens */
    --duration-spring-bouncy: 0ms !important;
    --duration-spring-snappy: 0ms !important;
    --duration-spring-gentle: 0ms !important;
    --duration-spring-quick:  0ms !important;
    
    /* Fallback to simple crossfades for dynamic properties */
    --ease-spring-bouncy: linear !important;
    --ease-spring-snappy: linear !important;
    --ease-spring-gentle: linear !important;
    --ease-spring-quick:  linear !important;
  }

  /* Target specific interaction classes to remove spatial transforms */
  .reveal-item,
  .modal-content,
  .sheet {
    transform: none !important;
    transition: opacity 300ms ease-in-out !important;
  }
}
```
