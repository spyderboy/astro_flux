# Memory Management Guidelines

In a real-time strategy game like Astro Flux, maintaining a stable frame rate (60/120 FPS) is critical. High heap churn leads to frequent Garbage Collection (GC) spikes, causing visible stutter (jank). Follow these guidelines to minimize memory pressure.

## 1. Object Pooling & Reusability
Frequent allocation and deallocation of small objects (like `Mote`, `Vector`, or `Particle`) are the primary causes of GC pressure.

- **Avoid frequent `new` or `add` calls**: Instead of creating a new `Particle` object every time a spark is spawned, maintain a pre-allocated pool of `Particle` objects.
- **Reuse Vectors**: Use `Vector2.zero()` or `clone()..setZero()` instead of creating new `Vector2` instances in every `update` loop.
- **Immutable Models vs. Mutable Components**: While `models/` should remain immutable for state integrity, `components/` should reuse their internal properties to avoid object churn during physics/movement updates.

## 2. Component Lifecycle Management
Flame components must be removed from the component tree when they are no longer active.

- **Explicit Removal**: When a `Mote` is fused into a `Vector`, ensure the corresponding `MoteComponent` is explicitly removed via `removeFromParent()`.
- **Clean up Listeners/Streams**: If a component subscribes to a Riverpod provider or a Stream, it **must** cancel that subscription in `onRemove()`.
- **Avoid Leaks via Closures**: Be cautious with long-lived closures in `update` loops that capture references to `Component` or `FlameGame` instances.

## 3. Particle System Optimization
Particle systems can quickly scale to hundreds of active elements.

- **Fixed Capacity**: Cap the maximum number of active particles in `ParticleSystem`. If the cap is reached, either ignore new particles or recycle the oldest ones.
- **Avoid heavy Paint objects**: Do not instantiate `Paint` objects inside the `render` loop. Create them once and update their properties (color, alpha, etc.) to avoid per-frame allocations.
- **Use Primitive Primitives**: Prefer `canvas.drawCircle` with simple properties over complex path-based geometries where possible.

## 4. Asset & Texture Management
Loading assets is expensive in terms of both I/O and memory.

- **Single Loading**: Ensure textures and audio clips are loaded once (e.g., during a loading screen) and referenced via a central cache or service.
- **Texture Atlases**: For larger projects, use Sprite Sheets (Atlases) to reduce the number of texture swaps in the GPU, which improves both memory and rendering performance.

## 5. State Management (Riverpod)
- **Keep GameState Slim**: The `GameState` model should only contain the minimum necessary data for the simulation. Do not store rendering-specific data (like `Offset` or `Paint`) in the `GameState`.
- **Avoid Deeply Nested Observables**: Large, deeply nested object trees in Riverpod can lead to expensive rebuilds/recomputations of the game logic.

## Summary Checklist for Developers
- [ ] Does this update loop create any new objects every frame?
- [ ] Does this component properly call `removeFromParent()` when destroyed?
- [ ] Are all `Paint` objects instantiated outside the `render` loop?
- [ ] If I add a new particle type, is there a limit on how many can exist at once?