// ignore_for_file: file_names

# Error Handling Strategy

In Astro Flux, maintaining a stable game loop and UI is critical. We use a multi-layered approach to capture, log, and recover from errors within our Riverpod-driven architecture.

## 1. Provider-Level Errors (AsyncValue)
All asynchronous providers (e.g., those fetching game state from persistence) must return `AsyncValue<T>`. This allows the UI to explicitly handle `AsyncError` states without crashing the widget tree.

```dart
final gameStateProvider = StreamProvider<GameState>((ref) {
  return persistenceService.watchGameState();
});

// In UI:
// gameState.when(
//   data: (state) => GameCanvas(state),
//   loading: () => LoadingSpinner(),
//   error: (err, stack) => ErrorNotification(err),
// );
```

## 2. Global Error Observation (ProviderObserver)
We utilize a custom `ProviderObserver` attached to the `ProviderContainer`. This observer intercepts all state changes and errors occurring within any provider.

- **Intercepting Errors**: The `onError` method is overridden to log errors using the project-wide `Logger`.
- **Tracing**: It captures which provider failed and the associated error details.

```dart
class AstroFluxObserver extends ProviderObserver {
  @override
  void onError(ProviderBase<Object?> provider, Object error, StackTrace stackTrace) {
    Logger.error('Provider Error: ${provider.name}', error: error, stackTrace: stackTrace);
    super.onError(provider, error, stackTrace);
  }
}
```

## 3. UI Error Boundaries
To prevent a single component error from crashing the entire Flame game canvas, we implement `ErrorWidget.builder` overrides at the root of the Flutter application. This ensures that even if a widget fails to build, the user sees a branded error state instead of a red screen of death.

## 4. Logging Infrastructure
All caught errors are routed through `lib/utils/logger.dart`. This ensures that errors are standardized with the `[Astro Flux]` prefix and logged to the developer console with appropriate severity levels.

- **Debug**: Transient logic issues.
- **Info**: Lifecycle changes.
- **Warning**: Recoverable state inconsistencies.
- **Error**: Critical failures requiring investigation.