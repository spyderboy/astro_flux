Philosophy: Resolution over perfection.

Core Rule: 10 small units (Motes) can fuse into 1 larger unit (Vector).

Units:
- Base units are 'Motes' (simple dots).
- 10 Motes can be 'Fused' into a 'Vector'.

Stars:
- Capture-able nodes that produce Motes.
- They have 3 tiers of growth.

Aesthetic:
- Dark background.
- High-saturation neon glows.
- Additive blending for combat.

Tech Stack: Flutter/Flame + GCP Functions v2.

---

## Flame / Riverpod API Rules
These rules exist because violations have caused the most repeated failures. Treat them as hard constraints.

### Imports

**Vector math — always use vector_math_64, never vector_math:**
```dart
// CORRECT — Flame uses 64-bit floats internally
import 'package:vector_math/vector_math_64.dart' as vm;
// or just get Vector2 from Flame's re-export:
import 'package:flame/components.dart'; // exposes Vector2 (= vector_math_64.Vector2)

// WRONG — 32-bit variant, incompatible type with Flame's Vector2
import 'package:vector_math/vector_math.dart';
```

**Never import `package:flame/game.dart` in component files.** It re-exports Flame's `Notifier` mixin, which conflicts with Riverpod's `Notifier` class and produces an ambiguous-export error.

**Project ParticleSystemComponent vs Flame's built-in:** When a file imports both `package:flame/components.dart` and `particle_system.dart`, hide Flame's version:
```dart
import 'package:flame/components.dart' hide ParticleSystemComponent;
import 'particle_system.dart';
```

### Flame Lifecycle

**Always call super in every lifecycle override — no exceptions:**
```dart
@override
void onMount() {
  super.onMount(); // REQUIRED first line
  // ...
}

@override
void update(double dt) {
  super.update(dt); // REQUIRED first line
  // ...
}

@override
Future<void> onLoad() async {
  await super.onLoad(); // REQUIRED first line
  // ...
}
```

**`Component.add()` is asynchronous.** Children are not immediately visible in `children` after `add()` — they are flushed on the next `updateTree()` call. Never assert on `parent.children.length` synchronously after an `add()` call in tests. Instead, test via return values or Riverpod state.

If you genuinely need to assert on `children.length` (e.g. verifying a particle cap), flush pending additions first using a `FlameGame` test harness:
```dart
import 'package:flame_test/flame_test.dart';

testWithFlameGame('cap test', (game) async {
  final manager = ParticleManager();
  await game.add(manager);
  await game.ready(); // flushes onLoad queue

  for (int i = 0; i < ParticleManager.maxParticles; i++) {
    manager.spawn(AttackParticle(velocity: Vector2(1, 0), neonColor: Colors.red, lifetime: 1.0), Vector2.zero());
  }
  game.update(0); // flushes pending children
  expect(manager.children.length, ParticleManager.maxParticles);
});
```
`game.update(0)` (or `await game.ready()`) is required before any `children.length` assertion. Without it the count will be 0 regardless of how many `add()` calls were made. The `bool` return value of `spawn()` is reliable immediately and should be preferred for cap-enforcement assertions.

**Do not call `Game.update(double dt)` directly.** It is called by the game loop. Calling it manually is an API error.

### Vector2 / Offset

**`Vector2` has no `.toOffset()` method.** Convert manually:
```dart
// CORRECT
final offset = Offset(vector.x, vector.y);

// WRONG — this method does not exist
final offset = vector.toOffset();
```

**`ParticleSystem.spawnSpark()` takes `vm.Vector2`, not `Offset`:**
```dart
// CORRECT — pass Vector2 directly
system.spawnSpark(currentPosVec, color: ..., velocity: direction * 150.0);

// WRONG — Offset is not accepted
system.spawnSpark(Offset(x, y), ...);
```

### Riverpod

**`ref.listenManual()` was removed in Riverpod 2.x.** Use `ref.listen()`:
```dart
// CORRECT
ref.listen(myProvider, (previous, next) { ... });

// WRONG — does not exist in Riverpod 2.x
ref.listenManual(myProvider, (previous, next) { ... });
```

**`GameState` is the value; `GameStateNotifier` is the controller.** Methods like `addStar()`, `captureStar()`, `addVector()` live on the *notifier*, not the state:
```dart
// CORRECT
ref.read(gameServiceProvider.notifier).captureStar(id, ownerId);
final state = ref.read(gameServiceProvider); // returns GameState

// WRONG — GameState has no such methods
ref.read(gameServiceProvider).captureStar(id, ownerId);
```

**`GameStateNotifier` constructor takes a `PersistenceService`, not a `GameState`:**
```dart
// CORRECT — for mocks, call super with LocalPersistenceService() then set state
class MockNotifier extends GameStateNotifier {
  MockNotifier(GameState initial) : super(LocalPersistenceService()) {
    state = initial;
  }
}

// WRONG — type error
MockNotifier(GameState initial) : super(initial);
```

### Testing

**`FakeAsync.elapse()`, not `.advanceTime()`:**
```dart
// CORRECT
async.elapse(const Duration(seconds: 30));

// WRONG — this method does not exist
async.advanceTime(const Duration(seconds: 30));
```

**`fake_async` is a transitive dependency** (available via `flutter_test`). It can be imported without adding it to pubspec.yaml: `import 'package:fake_async/fake_async.dart';`

**Hallucinated packages that do not exist:**
- `package:flame/math_engine.dart` — does not exist
- `package:flame/sound_player.dart` — does not exist
Use `package:flame/components.dart` for components, `package:flame_audio/flame_audio.dart` for audio.

### Flame — TextPaint

**`TextPaint` has no `.withTextStyle()` method.** Configure style at construction:
```dart
// CORRECT
final paint = TextPaint(style: const TextStyle(color: Color(0xFF00FFFF), fontSize: 24));

// WRONG — method does not exist
final paint = TextPaint().withTextStyle(TextStyle(...));
```

### Riverpod — Provider Overrides in Tests

**`StreamProvider.overrideWithStreamProvider()` does not exist.** Use `.overrideWith()`:
```dart
// CORRECT — Riverpod 2.x
connectivityStatusProvider.overrideWith((ref) => myStreamController.stream),

// WRONG — hallucinated method
connectivityStatusProvider.overrideWithStreamProvider((ref) => myStreamController.stream),
```

**Never hand-implement `Ref`.** Riverpod's `Ref` interface is internal and changes between versions. `Scope`, `Listener`, `modifyScope()`, `modifyListener()` are not part of the public API. To get a real `Ref` in tests, use a provider:
```dart
// CORRECT — gives a real Ref backed by a ProviderContainer
final myProvider = Provider<MyComponent>((ref) => MyComponent(ref));
final component = container.read(myProvider);

// WRONG — Scope/Listener/modifyScope do not exist on Ref
class TestRef implements Ref {
  void modifyScope(void Function(Scope) body) => ...  // compile error
}
```

### Riverpod — StreamProvider vs ProviderListenable

**`StreamProvider<T>` cannot be passed where `ProviderListenable<T>` is expected.** Use `ref.watch()` or `.future` to unwrap:
```dart
// If you need an int from a StreamProvider<int>:
// CORRECT — use .stream or watch inside a widget/provider
ref.watch(myStreamProvider).when(data: (v) => v, ...);

// WRONG — type error
final int value = ref.read(myStreamProvider); // returns AsyncValue<int>, not int
```

### Dart — `Particle` ambiguous import

**`Particle` is defined in both `particle_system.dart` and `models/particle.dart`.** Always hide one:
```dart
import 'package:astro_flux/components/particle_system.dart' hide Particle;
import 'package:astro_flux/models/particle.dart';
// OR
import 'package:astro_flux/components/particle_system.dart';
import 'package:astro_flux/models/particle.dart' hide Particle;
```

**`ParticleSystem` has no `.particles` getter.** There is no public list of active particles exposed by `ParticleSystem`. Do not attempt to read `system.particles` — it does not exist.

---

## Task scope rules — HARD CONSTRAINTS

These rules govern which files the coding model may touch depending on the task type.
Violating them causes cascading failures across future tasks.

### "Write unit test" tasks
**If the task description starts with "Write unit test" or "Write … test", you MUST only create
or modify files inside `test/`.**

- Do NOT modify any file under `lib/` — not even to add a feature the test requires.
- If the feature under test does not exist or has the wrong API, write a `skip`-marked test that
  documents what is missing, then stop:
  ```dart
  test('ParticleManager.spawn respects cap', () {
    // SKIPPED: ParticleManager.maxParticles not yet implemented — implement task required first.
  }, skip: 'feature not implemented');
  ```
- Never invent an implementation just to make your own test pass. The implement task will follow.

### "Implement" / feature tasks
**If the task description is not a test task, you MUST only create or modify files under `lib/`.**

- Do NOT create test files.
- Do NOT modify existing test files to make them pass — fix the source instead.

### Why this matters
When a coding model modifies both `lib/` and `test/` in a single task, the test is written
against the implementation it just invented, not the agreed API. This breaks the next task in
the queue and defeats the purpose of the test/implement split.

---

### connectivity_plus v4+

**`ConnectivityResult` is returned inside a `List`, not bare.** The stream type is `Stream<List<ConnectivityResult>>`:
```dart
// CORRECT
Stream<List<ConnectivityResult>> get connectivityStream => Connectivity().onConnectivityChanged;
bool isOffline(List<ConnectivityResult> results) => results.contains(ConnectivityResult.none);

// WRONG — was valid in v3, compile error in v4+
Stream<ConnectivityResult> stream = Connectivity().onConnectivityChanged;
```
