# Fusion Transition Animation Specification

## Overview
The fusion transition animation is a critical visual effect in Astro Flux, showcasing the transformation of 10 Motes into a single Vector. This animation must be smooth, visually appealing, and adhere to the project's aesthetic rules.

## Animation Details
### Duration
- **Total Duration:** 2 seconds
- **Mote Fade-In/Out:** 0.5 seconds each
- **Vector Spawn:** 1 second

### Keyframes
1. **Initial State (t=0s):**
   - All Motes are fully visible.
   - No Vector exists.
2. **Middle State (t=1s):**
   - All Motes fade out, becoming invisible except for 3.
   - 3 Motes begin to form a partial Vector shape at the center of their original positions.
3. **Final State (t=2s):**
   - Remaining 7 Motes fade out completely.
   - The complete Vector appears, fully formed and glowing neon.

### Visual Effects
- **Glow:** All Motes and the forming Vector should glow with high-saturation neon colours using additive blending (`BlendMode.plus`).
- **Particles:** Emit a few small particles around the Motes during the fade-out phase to simulate dust or debris.

## Implementation Notes
- Use `FusionEffectService` to trigger the animation at the appropriate game state changes.
- Implement the visual effects in custom components extending `PositionComponent`, such as `MoteComponent` and `VectorComponent`.
- Ensure the animation does not interfere with other UI elements or gameplay mechanics.
