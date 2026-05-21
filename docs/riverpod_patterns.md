# Riverpod Change Notification Patterns

This document outlines the patterns used for handling state changes and UI updates in Astro Flux using Riverpod.

## Core Principle
The `gameServiceProvider` (a `GameStateNotifier`) holds the single source of truth for the game state. UI components and derived providers react to changes in this state via Riverpod's dependency tracking.

## 1. Reactive UI Updates (Watching State)
For UI elements that must reflect the current state (e.g., score counters, progress bars, or visibility of buttons), use `ref.watch`.

### Pattern: Derived Providers
Instead of performing logic inside widgets, use derived `Provider`s to compute specific values. This keeps widgets clean and optimizes rebuilds.

```dart
// lib/providers/game_state_provider.dart

/// Recomputes whenever the number of motes changes.
final fusionThresholdReachedProvider = Provider<bool>((ref) {
  final gameState = ref.watch(gameServiceProvider);
  return FusionRules.canFuse(gameState.motes);
});
```

### Pattern: Widget Rebuilds
In `ConsumerWidget` or `ConsumerStatefulWidget`, use `ref.watch` to listen to specific providers.

```dart
// Inside a Widget
@override
Widget build(BuildContext context, WidgetRef ref) {
  final canFuse = ref.watch(fusionThresholdReachedProvider);
  
  return IconButton(
    onPressed: canFuse ? () => _onFusionPressed(ref) : null,
    icon: const Icon(Icons.auto_fix_high),
  );
}
```

## 2. Event-Driven Actions (Reading State/Notifiers)
For actions triggered by user interaction (e.g., clicking a button, spawning a unit), use `ref.read`.

### Pattern: Triggering Mutations
When an action occurs, use `ref.read` to access the `notifier` of the provider.

```dart
// lib/providers/fusion_provider.dart

Future<void> requestFusion() async {
  // Use ref.read to get the notifier for an imperative action.
  final notifier = ref.read(gameServiceProvider.notifier);
  
  // Check if fusion is possible before starting the async process
  final state = ref.read(gameServiceProvider);
  if (!FusionRules.canFuse(state.motes)) {
    return;
  }

  // Simulate fusion delay
  await Future.delayed(const Duration(milliseconds: 800));

  // Perform fusion via the rules engine
  FusionRules.tryPerformFusion(notifier);
}
```

## 3. Summary Table

| Use Case | Method | Purpose |
| :--- | :--- | :--- |
| **Displaying Values** | `ref.watch(provider)` | Automatically rebuilds widget when value changes. |
| **Computed Logic** | `ref.watch(baseProvider)` | Creates a reactive dependency chain in derived providers. |
| **Button Callbacks** | `ref.read(provider.notifier)` | Accesses methods to change state without triggering rebuilds of the caller. |
| **One-off Checks** | `ref.read(provider)` | Checks a value at a specific moment in time (e.g., inside an `onPressed`). |
