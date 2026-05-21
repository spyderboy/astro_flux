# Error Boundary in Riverpod Providers

## Overview
In Astro Flux, asynchronous operations that can fail (like the fusion process) are managed using Riverpod's `AsyncValue` pattern. This acts as a functional error boundary, ensuring that exceptions during async tasks are caught and reflected in the application state without crashing the provider or the game loop.

## Implementation Pattern: `AsyncValue.guard`

The core of the error handling in `lib/providers/fusion_provider.dart` relies on `AsyncValue.guard`.

### 1. State Definition
We use a `StateNotifierProvider` that holds an `AsyncValue<void>`. This allows the state to represent three distinct phases:
- `AsyncData(null)`: Idle/Success.
- `AsyncLoading()`: Operation in progress.
- `AsyncError(error, stackTrace)`: An error occurred during the operation.

### 2. The Guarded Execution
Within the `requestFusion` method, the asynchronous logic is wrapped in `AsyncValue.guard`:

```dart
statusNotifier.state = await AsyncValue.guard(() async {
  // ... async logic (delays, rules checks, etc.)
});
```

**How it works:**
- **Automatic Catching:** If any code inside the closure throws an exception, `AsyncValue.guard` catches it.
- **State Transition:** It automatically converts the caught exception into an `AsyncError` object.
- **Atomicity:** The notifier's state is updated with the result of the future, meaning the UI is notified of the transition from `loading` to either `data` or `error` in a single step.

### 3. UI Consumption
On the Flutter side (e.g., in `game_ui.dart`), components can listen to `fusionStatusProvider` using the `.when` pattern:

```dart
ref.watch(fusionStatusProvider).when(
  data: (_) => /* Show success/idle UI */,
  error: (err, stack) => /* Trigger error shake/toast/overlay */,
  loading: () => /* Show loading spinner/glow effect */,
);
```

This pattern prevents unhandled exceptions from bubbling up to the main event loop and ensures the game remains responsive even when a fusion attempt fails.