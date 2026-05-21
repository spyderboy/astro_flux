# Astro Flux — API Reference for Code Generation

**Read this before creating any new class or file.**  
If an API you need already exists here, use it — do not invent a new one.

---

## Models (`lib/models/`)

### `Mote` — `lib/models/mote.dart`
```dart
enum MoteLifecycle { created, active, fused }

class Mote {
  final int id;
  final MoteLifecycle lifecycleState; // default: MoteLifecycle.active

  const Mote({required this.id, this.lifecycleState = MoteLifecycle.active});

  // Lifecycle helpers — each returns a NEW Mote (immutable)
  Mote setCreated();
  Mote setActive();
  Mote setFused();

  // Getters
  bool get isActive;   // lifecycleState == active
  bool get isFused;    // lifecycleState == fused
  bool get isCreated;  // lifecycleState == created

  Mote copyWith({int? id, MoteLifecycle? lifecycleState});
  Map<String, dynamic> toMap();
  factory Mote.fromMap(Map<String, dynamic> map);
}
```
⚠️ **Mote has NO position field.** Position lives on `MoteComponent`, not the model.  
⚠️ `Mote` requires named args: `Mote(id: 1)` — never `Mote(1)`.

---

### `Star` — `lib/models/star.dart`
```dart
class Star {
  final int id;
  final int tier;       // 1, 2, or 3
  final String ownerId; // '' = uncaptured, 'enemy' = enemy-owned, else player id

  const Star({required this.id, this.tier = 1, this.ownerId = ''});

  bool get isCaptured;            // ownerId.isNotEmpty
  double get productionRate;      // tier * 0.5 motes/sec

  Star copyWith({int? tier, String? ownerId});
  Map<String, dynamic> toMap();
  factory Star.fromMap(Map<String, dynamic> map);
}
```

---

### `Vector` — `lib/models/vector.dart`
```dart
class Vector {
  final int id;
  const Vector({required this.id});

  Map<String, dynamic> toMap();
  factory Vector.fromMap(Map<String, dynamic> map);
}
```
⚠️ Import `package:flame/game.dart` hides `Vector` — use `hide Vector` in that import.

---

### `GameState` — `lib/models/game_state.dart`
```dart
class GameState {
  final List<Mote> motes;
  final List<Vector> vectors;
  final List<Star> stars;

  const GameState({this.motes = const [], this.vectors = const [], this.stars = const []});
  static const empty = GameState();

  GameState copyWith({List<Mote>? motes, List<Vector>? vectors, List<Star>? stars});
  Map<String, dynamic> toMap();
  factory GameState.fromMap(Map<String, dynamic> map);
}
```

---

## State Management (`lib/models/game_state_provider.dart`)

⚠️ **Riverpod 3.x** — `StateNotifier` and `StateNotifierProvider` are **REMOVED**.  
Always use `Notifier<T>` and `NotifierProvider<N, T>` instead.  
`WidgetRef` and `Ref` are **separate types** in Riverpod 3.x — never pass `WidgetRef` where `Ref` is expected.

### `GameStateNotifier extends Notifier<GameState>`
```dart
class GameStateNotifier extends Notifier<GameState> {
  GameStateNotifier(PersistenceService persistenceService);

  @override
  GameState build() => GameState.empty;  // replaces super(initialState)

  // Accessors
  List<Mote> get motes;
  List<Vector> get vectors;
  List<Star> get stars;

  // Mutations (each replaces state immutably)
  void addMote(int id);
  void addVector(int id);
  void addStar(int id, int tier);
  void removeMote(int id);
  void removeVector(int id);
  void removeStar(int id);
  void updateStar(int id, int tier);
  void captureStar(int id, String ownerId);  // ownerId = 'player' or 'enemy'
  void clearMotes();
  void clearVectors();
  void clearStars();
  void reset();

  Future<void> saveGame();
  Future<void> loadGame();
}

// Provider — use this everywhere; do NOT construct GameStateNotifier directly in widgets
final gameServiceProvider = NotifierProvider<GameStateNotifier, GameState>(
  () => GameStateNotifier(LocalPersistenceService()),
);
```
⚠️ `Notifier<T>` has `state` getter/setter — mutations work exactly as before.  
⚠️ `ref.read(gameServiceProvider.notifier)` still works and returns `GameStateNotifier`.  
⚠️ Do NOT write `StateNotifierProvider` or `extends StateNotifier` — those are Riverpod 2.x and will not compile.

---

## Providers (`lib/game/`)

### `canFuseProvider` — `lib/game/fusion_provider.dart`
```dart
final canFuseProvider = Provider<bool>((ref) { ... });
// true when active mote count >= FusionRules.fusionThreshold (10)
```

### `captureMessageProvider` — `lib/game/capture_event_notifier.dart`
```dart
// Riverpod 3.x — Notifier<String>, NOT StateNotifier<String>
class CaptureMessageNotifier extends Notifier<String> {
  @override
  String build() => '';
  void showCaptureSuccess(String message);
  void showCaptureFailure(String message);
  // message auto-clears after 3 seconds
}
final captureMessageProvider = NotifierProvider<CaptureMessageNotifier, String>(
  () => CaptureMessageNotifier(),
);
```
Use `ref.watch(captureMessageProvider)` to get the current toast message string.

### `enemyAIProvider` — `lib/game/ai/enemy_ai.dart`
```dart
class EnemyAI {
  EnemyAI(Ref ref, {Duration captureInterval = const Duration(seconds: 30)});
  void start();   // begins periodic capture timer
  void stop();    // cancels timer
}
final enemyAIProvider = Provider<EnemyAI>((ref) => EnemyAI(ref));
```

---

## Game Logic (`lib/game/`)

### `CaptureRules` — `lib/game/capture_rules.dart`
```dart
class CaptureRules {
  static bool canAttack(int vectorId, int starId, GameState state);
  static int minMotesForTier(int tier);  // tier * 3
  static int pointValue(int tier);       // 1, 5, 25 for tiers 1-3
}
```

### `FusionRules` — `lib/game/fusion_rules.dart`
```dart
class FusionRules {
  static const int fusionThreshold = 10;
  static bool canFuse(GameState state);
}
```

---

## Flame Components (`lib/components/`)

### `MoteComponent extends PositionComponent` — `lib/components/mote_component.dart`
```dart
MoteComponent({
  required Mote mote,
  Vector2? position,
  double radius = 8.0,
  double glowRadius = 12.0,
  Color neonColor = const Color(0xFF00FFFF),
});
```

### `StarComponent extends PositionComponent` — `lib/components/star_component.dart`
```dart
StarComponent({required Star star, Vector2? position});
```

### `CombatResultLabelComponent extends PositionComponent` — `lib/components/combat_result_label_component.dart`
```dart
CombatResultLabelComponent({
  required String text,
  required Color color,
  Vector2? initialPosition,
});
```
⚠️ `text` is **final** — create a new instance to change the text; do not assign to `.text`.  
⚠️ Do NOT re-declare `position` as a field — use the inherited `PositionComponent.position`.

### `StarCaptureIndicator extends PositionComponent` — `lib/components/star_capture_indicator.dart`
```dart
StarCaptureIndicator({required int starId, required Color color, Vector2? position});
void startCapture();  // begins fade-in animation, auto-removes when done
```

---

## Top-level Game (`lib/game/astro_game.dart`)

### `AstroGame extends FlameGame with ScaleDetector`
```dart
class AstroGame extends FlameGame with ScaleDetector {
  List<Mote> get motes;
  List<Vector> get vectors;
  List<Star> get stars;

  // Gesture callbacks — already implemented, do NOT re-add:
  @override void onScaleStart(ScaleStartInfo info);   // records start zoom
  @override void onScaleUpdate(ScaleUpdateInfo info); // pinch-zoom + two-finger pan

  // Use GameWidget<AstroGame> in Flutter widget tree:
  // GameWidget<AstroGame>(game: AstroGame(), overlayBuilderMap: {...})
}
```
⚠️ `ScaleDetector` is on `AstroGame` (FlameGame) — NEVER on a PositionComponent.  
⚠️ `GameCore` does NOT exist — always use `AstroGame` directly.  
⚠️ `lib/game/game_core.dart` is a re-export shim, not a class to instantiate.

#### Flame gesture mixin rules
| Mixin | Goes on | NOT on |
|-------|---------|--------|
| `ScaleDetector` | `FlameGame` subclass | `PositionComponent` |
| `TapCallbacks` | individual `Component` | `FlameGame` directly |
| `DragCallbacks` | individual `Component` | `FlameGame` directly |

#### `ScaleUpdateInfo` field types — critical
```dart
// info.delta.global  → Vector2   (NOT Offset — do NOT call .toVector2())
// info.scale.global  → Vector2   (NOT Offset — use .x directly)
// info.pointerCount  → int

// CORRECT:
camera.viewfinder.position -= info.delta.global / zoom;  // Vector2 / double = Vector2
final newZoom = startZoom * info.scale.global.x;          // double

// WRONG (compile error — Vector2 has no toVector2()):
info.delta.global.toVector2()
```

#### `UnitModel` — `lib/models/unit_model.dart`
```dart
abstract class UnitModel {
  final int id;
  final int tier;
  final int currentHealth;

  UnitModel({required int id, required int tier, int? currentHealth});

  int get maxHealth;   // 1 / 5 / 25 for tiers 1-3
  int get power;       // 1 / 3 / 9  for tiers 1-3
  bool get isAlive;    // currentHealth > 0
}
```

#### `SelectionNotifier` — `lib/providers/selection_provider.dart`
```dart
class SelectionNotifier extends StateNotifier<Set<int>> {
  SelectionNotifier() : super({});
  void select(int unitId);      // replaces selection with single unit
  void clearSelection();
}
final selectionProvider = StateNotifierProvider<SelectionNotifier, Set<int>>(...);
```

---

## Services

### `AudioService` — `lib/services/audio_service.dart`
```dart
class AudioService {
  static void play(String filename);  // uses FlameAudio.play()
}
```
Import from: `package:astro_flux/services/audio_service.dart`  
⚠️ Do NOT import from `../audio_service.dart` or `../../audio_service.dart`.

### `PersistenceService` / `LocalPersistenceService` — `lib/systems/persistence_service.dart`
```dart
abstract class PersistenceService {
  Future<Map<String, dynamic>?> loadGame();
  Future<void> saveGame(Map<String, dynamic> gameData);
}
class LocalPersistenceService implements PersistenceService { ... }
```

---

## Import Path Quick Reference

| File | Package import |
|------|---------------|
| Mote | `package:astro_flux/models/mote.dart` |
| Star | `package:astro_flux/models/star.dart` |
| Vector | `package:astro_flux/models/vector.dart` |
| GameState | `package:astro_flux/models/game_state.dart` |
| GameStateNotifier / gameServiceProvider | `package:astro_flux/models/game_state_provider.dart` |
| canFuseProvider | `package:astro_flux/game/fusion_provider.dart` |
| captureMessageProvider | `package:astro_flux/game/capture_event_notifier.dart` |
| CaptureRules | `package:astro_flux/game/capture_rules.dart` |
| FusionRules | `package:astro_flux/game/fusion_rules.dart` |
| EnemyAI / enemyAIProvider | `package:astro_flux/game/ai/enemy_ai.dart` |
| AudioService | `package:astro_flux/services/audio_service.dart` |
| PersistenceService | `package:astro_flux/systems/persistence_service.dart` |
| MoteComponent | `package:astro_flux/components/mote_component.dart` |
| StarComponent | `package:astro_flux/components/star_component.dart` |
| CombatResultLabelComponent | `package:astro_flux/components/combat_result_label_component.dart` |
| StarCaptureIndicator | `package:astro_flux/components/star_capture_indicator.dart` |
| AstroGame | `package:astro_flux/game/astro_game.dart` |
| CombatAttackHandler | `package:astro_flux/game/combat_attack_handler.dart` |
| UnitCombatResolver | `package:astro_flux/game/unit_combat_resolver.dart` |

---

## Combat Architecture

### `CombatAttackHandler` — `lib/game/combat_attack_handler.dart`
```dart
class CombatAttackHandler {
  CombatAttackHandler(Ref ref);
  void handle(CombatAttackEvent event);  // validates + executes star capture
}
```
⚠️ **Star-capture dispatch ONLY.** Takes a `Ref`, never a `GameStateNotifier` directly.  
⚠️ Does NOT have a `tick()` method. Unit combat lives in `UnitCombatResolver`.  
⚠️ Never access `notifier.state` — use `ref.read(gameServiceProvider)` for state reads.

### `UnitCombatResolver` — `lib/game/unit_combat_resolver.dart`
```dart
class UnitCombatResolver {
  UnitCombatResolver(Ref ref);
  void tick(double dt);  // called from AstroGame.update(dt)
  static double collisionRadiusForTier(int tier);  // 16/24/36 px for tiers 1/2/3
}
```
Collision radii: Tier-1 = 16 px, Tier-2 = 24 px, Tier-3 = 36 px.  
⚠️ Does NOT pause movement — MoveOrderHandler runs independently in the same update tick.  
⚠️ Simultaneous damage rule: compute BOTH new health values before writing either to state.

### `CombatAttackEvent` — `lib/game/combat_attack_event.dart`
```dart
class CombatAttackEvent {
  final int sourceVectorId;
  final int targetStarId;
  const CombatAttackEvent({required this.sourceVectorId, required this.targetStarId});
}
```
⚠️ Named constructor only — `CombatAttackEvent(1, 2)` is a compile error.

### `ParticleEffects` — `lib/game/particle_effects.dart`
```dart
enum CombatEffect { attack, hit, destroy, heal }
class ParticleEffects {
  ParticleEffects(ParticleSystem system);
  void trigger(CombatEffect effect, Vector2 position, Color color);
  void clear();
}
```
⚠️ Import as `package:astro_flux/game/particle_effects.dart` — NOT `package:particle_effects/...`.  
⚠️ `package:particle_effects` does NOT exist and is not in pubspec.yaml.

---

## Files That Do NOT Exist (do not create or import)

- `game_events.dart` — no such file
- `LevelUpEventBus` — no such class
- `VectorFusedEvent` — no such class
- `GameCore` — not a class; `game_core.dart` is a re-export shim only
- `game_rules_engine.dart` at `lib/` root — use `lib/game/game_rules_engine.dart`
- `capture_result_label_component.dart` — use `combat_result_label_component.dart`
- `combat_result_label.dart` — use `combat_result_label_component.dart`
- `level_up_event_bus.dart` — does not exist
- `package:particle_effects/particle_effects.dart` — does not exist; use `lib/game/particle_effects.dart`
