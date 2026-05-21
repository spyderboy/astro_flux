// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/game_state_provider.dart';

/// A provider that manages the decay of player-owned stars.
/// It periodically triggers a transition of player-owned stars to neutral.
final starDecayProvider = Provider<void>((ref) {
  // Access the notifier to call methods on it.
  final notifier = ref.read(gameServiceProvider.notifier);

  // A periodic timer to simulate the decay mechanism.
  final timer = Timer.periodic(const Duration(seconds: 30), (_) {
    // Read the current state to find player-owned stars.
    // We must use ref.read inside the callback to get the latest state.
    final gameState = ref.read(gameServiceProvider);

    // Identify stars that are currently owned by the player.
    final playerStars = gameState.stars.where((s) => s.ownerId == 'player');

    for (final star in playerStars) {
      // Transition ownership to neutral (empty string).
      notifier.captureStar(star.id, '');
    }
  });

  // Clean up the timer when the provider is disposed.
  ref.onDispose(() => timer.cancel());
});