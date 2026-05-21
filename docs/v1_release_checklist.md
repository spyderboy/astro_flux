# Astro Flux V1.0 Release Checklist

## Pre-Release Requirements

### Core Mechanics
- [ ] 10 Motes fuse into 1 Vector (FUSION_THRESHOLD = 10)
- [ ] Stars produce Motes at tier-based rates (tier 1-3)
- [ ] No changes to these ratios without explicit approval

### Visual Requirements
- [ ] Dark background only (no white/light-mode)
- [ ] High-saturation neon glows (no pastels)
- [ ] Combat effects use BlendMode.plus (additive blending)
- [ ] No Material widgets in Flame canvas

### Technical Requirements
- [ ] models/ pure Dart only (no Flame/Flutter imports)
- [ ] components/ depend on models/, not reverse
- [ ] All async operations handle loading/error states
- [ ] Riverpod providers for state exposure

### Code Quality
- [ ] All files under 150 lines
- [ ] Const constructors where possible
- [ ] One class per file
- [ ] No deprecated APIs (.withValues() for alpha)

### Testing
- [ ] All unit tests pass
- [ ] Game loop runs at 60fps
- [ ] Star capture works correctly
- [ ] Fusion mechanic verified

## V1.0 Features
- [ ] Star capture system
- [ ] Mote production
- [ ] Vector fusion (10 Motes → 1 Vector)
- [ ] Basic combat particles
- [ ] Local persistence (save/load state)

## Known Issues
- [ ] None (release ready)

## Release Notes
- Initial release of core gameplay loop
- Dark neon aesthetic
- Star capture and mote production
- Vector fusion system
- Local state persistence
