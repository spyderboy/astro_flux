# Code Review Notes — astro_flux
_Last updated: 2026-05-07. Written for LLMs and humans reviewing this codebase._

---

## What this project is

A Flutter/Flame RTS game built by an autonomous pipeline (35B coding model + 4B planner/advisor).
Many files were written by AI under constraints. This document records what to watch for.

---

## High-confidence stable files (do not modify without care)

These were hand-verified and are the architectural foundation:

- `lib/models/game_state.dart` — named-param const constructor, `GameState.empty`, `fromMap/toMap/copyWith`
- `lib/models/game_state_provider.dart` — `GameStateNotifier extends StateNotifier<GameState>`, provider is `gameServiceProvider`
- `lib/systems/persistence_service.dart` — `PersistenceService` abstract + `LocalPersistenceService` with `saveGame(Map)/loadGame()`
- `lib/game/audio_service.dart` — `FlameAudio.bgm` / `FlameAudio.audioCache` only
- `lib/models/mote.dart` — immutable, lifecycle via `setCreated/setActive/setFused` (return new Mote)

---

## Known AI failure patterns — things to check in every review

### 1. Flame/dart:ui import confusion
- **`import 'dart:ui'` is required** in any file using `Color`, `Canvas`, `Offset`, `Paint`,
  `MaskFilter`, `BlendMode`, `Rect`. These are NOT re-exported by `flame` or `flutter/material`.
- **`import 'package:flame/components.dart' hide Vector`** is required in any file that imports
  both flame components AND `lib/models/vector.dart`. Missing `hide Vector` → `ambiguous_import`.
- **`import 'package:flame/game.dart' hide Vector`** — same rule.

### 2. Invented classes (hallucinated API)
The AI has invented these non-existent classes in past runs. If you see them, delete them:
- `FlameAudioPlayer`, `SoundManager`, `SoundPlayer`, `AudioPlayerEffect`
- `Bgm` as a standalone type (use `FlameAudio.bgm` — it's a getter, not a type to annotate)
- `AudioCache` instantiated directly (use `FlameAudio.audioCache`)
- `FlameAudio.stopAll()` — does not exist
- `FlameAudio.play(..., isLooping: true)` — no `isLooping` param on `play()`
- `FlameAudio.bgm.isPlaying()` — `isPlaying` is a bool getter, not a method

### 3. Model purity violations
`Mote`, `Vector`, `Star` are pure data classes. Watch for:
- Game logic methods added directly to models (`fuseWith`, `attack`, `move`, `collide`, etc.)
- Models importing Flame packages (`flame/components`, `flame/game`)
- `position` field on models — position is a rendering concern, belongs on the Component not the model

### 4. Riverpod misuse
- `gameServiceProvider.notifier()` — WRONG. `.notifier` is a getter, no parentheses.
  Correct: `container.read(gameServiceProvider.notifier)`
- `GameStateNotifier` must extend `StateNotifier<GameState>`, never a plain class
- Do not create parallel state management alongside Riverpod (no raw singletons managing mote lists)

### 5. Flame API misuse
- `super.update(dt)` inside a `FlameGame` subclass — `Game.update` is abstract, never call super
- `PositionComponent` is NOT const — never use `const` on subclass constructors
- `canvas.drawCircle` takes `Offset` not `Vector2` — wrap: `Offset(pos.x, pos.y)`
- `canvas.drawLine` takes `Offset` not `Vector2`
- `Vector2.toOffset()` converts correctly — use it
- `BlendMode.add` does not exist — use `BlendMode.plus` for additive glow

### 6. Rogue file locations
The AI tends to create files in wrong directories. Watch for:
- `lib/pubspec.yaml` — pubspec belongs at project root only
- `lib/models/*_test.dart` — tests belong in `test/`, not `lib/models/`
- `lib/game/game_state.dart` — game_state belongs in `lib/models/`
- `lib/models/combat_rules.dart` — combat logic belongs in `lib/game/`
- Any file at `lib/models/` that contains Flame imports

### 7. Deprecated Flutter/Dart APIs
- `.withOpacity()` — deprecated, use `.withAlpha(int 0–255)` or `.withValues(alpha: x)`
- `Color.value` — deprecated, use `.toARGB32()`
- `.normalized()` on Vector2 — unreliable, use `(diff / diff.length)` pattern

### 8. Const correctness
- `prefer_const_constructors`: add `const` wherever all constructor args are compile-time constants
- `prefer_const_declarations`: `final x = const Foo()` → `const x = Foo()`
- `const Vector2(...)` — Vector2 is NOT const-constructable (backed by Float64List)

### 9. Test file placement and imports
- Test files under `lib/` MUST start with `// ignore_for_file: depend_on_referenced_packages`
- Test files under `lib/` use relative imports
- Test files under `test/` use `package:astro_flux/...` imports
- README.dart files MUST start with `// ignore_for_file: file_names`

---

## Architecture invariants

- **10 Motes fuse into 1 Vector** — this ratio is fixed, never change it
- **State flows through Riverpod only** — no direct game state reads from widgets
- **models/ is pure Dart** — zero Flame or Flutter imports allowed in lib/models/
- **components/ depend on models/**, never the reverse
- **Persistence is in-memory** (`LocalPersistenceService`) — no Firebase, no SharedPreferences
- `gameServiceProvider` is the canonical provider name (not `gameStateProvider`)

---

## Files created by AI that should be reviewed before trusting

- `lib/game/fusion_rules.dart` — AI-generated, check 10:1 ratio is respected
- `lib/models/mote_color_picker.dart` — AI-generated, check no Flame imports
- Any file in `lib/components/` not in the original locked set
- Any file created after task 12 (pipeline was stable from task 7 onward)

---

## flutter analyze baseline

`flutter analyze --no-fatal-infos --no-fatal-warnings` must return **zero issues** (not just zero errors).
This Flutter SDK version exits non-zero for any issue including info-level ones.
