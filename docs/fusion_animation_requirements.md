# Fusion Animation Requirements: Mote to Vector

## Overview
The transition from 10 Motes to 1 Vector is the core progression loop of Astro Flux. This animation must feel powerful, impactful, and visually consistent with the neon-noir aesthetic.

## Trigger Conditions
- The animation begins when the `GameState` identifies that the `moteCount` has reached a multiple of 1/10th of a Vector (specifically when the 10th mote is added).
- All 10 Motes involved in the current fusion batch must be identified for the motion phase.

## Visual Stages

### 1. Accumulation (The Pull)
- **Motion**: The 10 Motes involved in the fusion must move from their current positions towards a central "fusion point" (the position of the 10th mote or the centroid of the group).
- **Interpolation**: Use an easing function (e.g., `Cubic.easeIn`) to accelerate the movement as they approach the center.
- **Visuals**: Motes should slightly increase in size or brightness (glow intensity) as they approach the convergence point.

### 2. The Fusion Event (The Burst)
- **Point of Impact**: At the moment of convergence, a momentary "flash" or "pulse" occurs at the fusion point.
- **Particle Effects**:
    - Trigger a high-saturation neon burst using the `ParticleSystem`.
    - All particles MUST use `BlendMode.plus` for additive glow.
    - Particles should be of varying sizes and spread radially from the center.
- **Vector Emergence**:
    - A new `VectorComponent` is instantiated at the fusion point.
    - The `VectorComponent` should scale up from `0.0` to `1.0` rapidly (e.g., within 200-300ms).
    - The `VectorComponent` should feature a brief, intense outer glow pulse upon appearance.

### 3. Dissolution
- **Mote Cleanup**: The 10 `MoteComponent` instances are removed from the game world after the burst.
- **Trail Effect**: As the Motes move towards the center during the Accumulation stage, they should leave short-lived, fading neon trails.

## Audio Requirements
- **Sound Effect**: A high-frequency "energy surge" or "impact" sound effect (one-shot) must play at the exact moment of the burst.
- **Volume**: The sound should be impactful but balanced against the background music.

## Technical Constraints
- **Performance**: The animation must not cause frame drops, even if multiple fusions occur in rapid succession.
- **State Separation**: The animation logic should be decoupled from the `GameState` mutation. The `GameState` updates immediately, and the animation layer reacts to the event/notification.
- **Blending**: All new visual elements MUST use `BlendMode.plus` for additive lighting.