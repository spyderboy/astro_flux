# Astro Flux V1.0 Release Checklist

## Pre-Release Requirements

### Code Quality
- [ ] All tests pass: `flutter test`
- [ ] Static analysis clean: `flutter analyze`
- [ ] Code coverage > 80%
- [ ] CHANGELOG.md updated with semantic versioning
- [ ] Version number bumped in constants

### Build Verification
- [ ] Debug build works on Android
- [ ] Debug build works on iOS
- [ ] Release build works on Android (APK generated)
- [ ] Release build works on iOS (IPA generated)

### Core Mechanics Verification
- [ ] 10 Motes fuse into 1 Vector (unchanged ratio)
- [ ] Star production rates match tier configuration
- [ ] Star tiers 1-3 produce correct mote rates
- [ ] Capture mechanics work correctly

### Visual Requirements
- [ ] Dark background only (no white/light-mode)
- [ ] All glows use high-saturation neon colours
- [ ] Combat rendering uses `BlendMode.plus`
- [ ] No flat Material widgets in game canvas

### Performance
- [ ] Target 60fps on mid-range devices
- [ ] Memory usage within acceptable limits
- [ ] No significant memory leaks

### Documentation
- [ ] README.md updated
- [ ] API documentation complete
- [ ] Release notes written
- [ ] CHANGELOG.md follows Keep a Changelog format

## Post-Release

- [ ] Create GitHub release
- [ ] Update version in pubspec.yaml
- [ ] Tag commit with version number
- [ ] Announce release to stakeholders