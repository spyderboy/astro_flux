// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/models/star.dart';
import 'package:astro_flux/game/level_up_event_bus.dart';
import 'package:astro_flux/game/star_decay_manager.dart';
import 'package:astro_flux/game/audio_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/systems/local_persistence_service.dart';

void main() {
  group('Star Decay Manager', () {
    test('State consistent when decay fires mid-capture', () async {
      final manager = StarDecayManager();
      final gameStateNotifier = GameStateNotifier(LocalPersistenceService());
      gameStateNotifier.addStar(1, 2);
      gameStateNotifier.captureStar(1, 'player');

      // Start the decay timer for a short duration
      manager.startDecayTimer(10);
      expect(manager.decayTimer.isActive, isTrue);

      // Simulate the decay firing mid-capture
      await Future.delayed(const Duration(seconds: 5));
      manager.decayTimer.tick();

      // Ensure star ownership remains player-owned despite decay
      final gameState = gameStateNotifier.gameState;
      expect(gameState.stars.first.ownerId, 'player');
    });
  });
}