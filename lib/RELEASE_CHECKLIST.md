# Astro Flux - V1.0 Release Checklist

## Pre-Release Requirements

### Core Mechanics
- [ ] 10 Motes fuse into 1 Vector (ratio verified)
- [ ] Stars produce Motes at tier-based rates
- [ ] Star capture mechanic functional
- [ ] No hardcoded values outside configuration

### Code Quality
- [ ] All const constructors applied
- [ ] No flat Material widgets in Flame canvas
- [ ] Additive blending uses BlendMode.plus
- [ ] Dart imports properly organized (dart:ui for Canvas/Color/BlendMode)
- [ ] File naming follows lower_case_with_underscores
- [ ] Models stay pure Dart (no Flame/Flutter imports)
- [ ] Components depend on models only (never reverse)

### State Management
- [ ] GameState exposed via gameServiceProvider only
- [ ] GameStateNotifier methods implemented:
  - [ ] addMote(id), addVector(id), addStar(id, tier)
  - [ ] removeMote(id), removeVector(id), removeStar(id)
  - [ ] updateStar(id, tier), captureStar(id, ownerId)
  - [ ] clearMotes(), clearVectors(), clearStars()
  - [ ] saveGame(), loadGame(), reset()
- [ ] No direct game state reads from widgets

### Persistence
- [ ] LocalPersistenceService functional
- [ ] GameState serialization via toMap()/fromMap()
- [ ] No Firebase dependencies in pubspec.yaml
- [ ] In-memory storage working correctly

### Testing
- [ ] All test files use package:astro_flux imports
- [ ] No mockito imports (use Riverpod ProviderContainer)
- [ ] No firebase_core imports (stub with in-memory fakes)
- [ ] No shared_preferences imports

### Aesthetic
- [ ] Dark background only (no white/light-mode)
- [ ] High-saturation neon glows
- [ ] Combat uses additive blending
- [ ] No pastels

## Release Notes
- Version: 1.0.0
- Type: Major Release
- Changes: Core game loop, state management, persistence

## Known Issues
- None for V1.0

## Next Steps
- V1.1: Add unit abilities system
- V1.2: Add combat rules
- V1.3: Add level system

---
*Generated for Astro Flux V1.0 Release*