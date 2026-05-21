// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:astro_flux/providers/star_production_stream_provider.dart';

/// Provider that manages the periodic addition of motes based on the production rate.
/// It watches the `starProductionStreamProvider` and starts a new production timer
/// whenever the rate changes.
final moteProductionEngineProvider = Provider<void>((ref) {
  final rateAsync = ref.watch(starProductionStreamProvider);
  final rate = rateAsync.valueOrNull ?? 0;

  // When the rate changes, this provider is re-evaluated.
  // The old timer is cancelled via ref.onDispose.
  
  final timer = Timer.periodic(const Duration(seconds: 1), (t) {
    if (rate > 0) {
      final notifier = ref.read(gameServiceProvider.notifier);
      final gameState = ref.read(gameServiceProvider);
      
      // Find the current highest mote ID to avoid collisions.
      int maxId = 0;
      if (gameState.motes.isNotEmpty) {
        maxId = gameState.motes.map((m) => m.id).reduce((a, b) => a > b ? a : b);
      }

      // Add 'rate' number of motes.
      for (int i = 1; i <= rate; i++) {
        notifier.addMote(maxId + i);
      }
    }
  });

  // Crucial: cancel the timer when the provider is disposed or re-evaluated.
  ref.onDispose(() => timer.cancel());
});