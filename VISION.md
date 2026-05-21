# Project Vision — Astro Flux

## Philosophy
Resolution over perfection. Ship small, working slices and iterate.

## What we're building
A real-time strategy / idle game built with Flutter and Flame. Players capture
Stars, accumulate Motes, and fuse them into Vectors to grow their force. The
aesthetic is dark and neon — high-saturation glows, additive blending in combat,
no flat UI chrome.

## Core mechanics
- **Motes** — the base unit. Simple dots produced by Stars.
- **Vectors** — fused units. 10 Motes combine into 1 Vector.
- **Stars** — capture-able nodes that produce Motes automatically. Three tiers
  of growth; higher tiers produce faster.
- **Fusion** — 10 Motes → 1 Vector. This is the primary progression loop.

## Aesthetic rules (non-negotiable)
- Dark background always.
- All glows use high-saturation neon colours.
- Combat rendering uses additive blending (BlendMode.add or Flame equivalent).
- No white backgrounds, no flat Material widgets inside the game canvas.

## Tech stack
- Game engine: Flutter + Flame
- State:       flutter_riverpod
- Math:        vector_math
- Audio:       flame_audio
- Backend:     GCP Cloud Functions v2 (for persistence / leaderboards — future)

## Project structure
```
lib/
  game/        — FlameGame subclass and game loop (astro_game.dart)
  models/      — Pure Dart data models (Mote, Vector, Star)
  components/  — Flame components (rendered game objects)
```

## What is currently built
- AstroGame shell (FlameGame, basic update loop)
- Mote model with fuseWith() stub
- Vector model (id only)

## What is NOT built yet
- Star model and production logic
- Flame components for Mote, Vector, Star rendering
- Capture / combat mechanics
- Riverpod providers wiring game state to UI
- GCP backend integration

## Definition of done for v1.0
A playable loop: Stars produce Motes → player directs Motes → 10 Motes auto-fuse
into a Vector → Vectors can capture Stars. Runs on iOS and Android.
