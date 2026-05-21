// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/game_state_provider.dart';

/// A provider that manages the local storage mechanism,
/// handling initial loading and auto-saving of the game state.
///
/// This provider implements an offline-first approach by ensuring
/// that the game state is loaded from local storage on startup
/// and automatically persisted to local storage whenever it changes.
final localStorageProvider = Provider<void>((ref) {
  // Load game on initialization.
  // We use a microtask to ensure the provider is fully initialized
  // before we start the async loading process.
  Future.microtask(() async {
    try {
      await ref.read(gameServiceProvider.notifier).loadGame();
    } catch (e) {
      // Fail silently to allow the game to start with a fresh state.
      // In a real production environment, this error would be logged.
    }
  });

  // Auto-save the game state whenever it changes.
  // This ensures that the local storage is always in sync with the game state,
  // providing a seamless experience even if the app is closed unexpectedly.
  ref.listen(gameServiceProvider, (previous, next) {
    if (previous != next) {
      try {
        ref.read(gameServiceProvider.notifier).saveGame();
      } catch (e) {
        // Handle or log saving errors.
      }
    }
  });
});