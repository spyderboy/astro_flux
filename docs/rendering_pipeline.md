# Rendering Pipeline — Astro Flux

The Astro Flux rendering pipeline follows the standard Flame engine loop, optimized for high-saturation neon aesthetics and additive blending effects.

## 1. The Update Phase (`update(dt)`)
Before any pixels are drawn, the game state is updated for the current frame delta (`dt`).

- **State Synchronization**: The game loop reads from the `gameServiceProvider` to determine the positions and existence of Motes, Vectors, and Stars.
- **Physics & Movement**: 
  - Star gravity calculations are applied to units.
  - Mote/Vector movement vectors are integrated.
- **Production Logic**: Stars increment their Mote counts based on their tier.
- **Fusion Detection**: Checking if 10 Motes have reached a Vector threshold.
- **Lifecycle Management**: Removal of fused Motes and creation of new Vectors.

## 2. The Rendering Phase (`render(canvas)`)
Drawing occurs in a specific order to ensure correct layering and transparency blending.

### Layer 1: The Void (Background)
- A solid dark background is rendered first to clear the previous frame.

### Layer 2: Infrastructure (Stars)
- **Star Core**: The base color of the Star component.
- **Star Glow**: Application of the `NeonRenderer` mixin to create a high-saturation aura around the star.

### Layer 3: Dynamic Entities (Motes & Vectors)
- **Motes**: Simple, high-speed particles representing the base resource.
- **Vectors**: Larger, more complex units.
- Rendering uses standard alpha blending for these entities to maintain visibility against the star glows.

### Layer 4: Visual Effects (VFX)
- **Particle Systems**: Combat sparks and fusion effects.
- **Additive Blending**: Crucial step. All combat particles and neon glows use `BlendMode.plus`. This allows overlapping colors to "brighten" the screen, creating the signature neon flare.

### Layer 5: Overlay (UI/HUD)
- While the HUD is often a separate Flutter widget overlaying the `GameWidget`, any in-canvas indicators (like selection rings) are rendered last.

## 3. Aesthetic Constraints & Implementation
- **No Flatness**: Every light source must imply depth through glow.
- **Color Blending**: Avoid `BlendMode.src_over` for effects; prioritize `BlendMode.plus` to prevent "muddy" overlapping colors.
- **Resolution**: The pipeline is optimized for resolution-independent movement via vector math.