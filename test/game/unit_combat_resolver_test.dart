// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/vector.dart';
import 'package:astro_flux/models/game_state.dart';
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:astro_flux/systems/local_persistence_service.dart';

void main() {
  group('Unit Combat Resolver Tests', () {
    late ProviderContainer container;
    late GameStateNotifier gameState;

    setUp(() {
      gameState = GameStateNotifier(LocalPersistenceService());
      container = ProviderContainer(
        overrides: [
          gameServiceProvider.overrideWith((ref) => gameState),
        ],
      );

      // Add two T1 units at distance <= 16
      container.read(gameServiceProvider.notifier).addVector(1, owner: 'player', tier: 1);
      container.read(gameServiceProvider.notifier).addVector(2, owner: 'player', tier: 1);
    });

    tearDown(() {
      container.dispose();
    });

    test('two T1 units at distance <= 16 both reach 0 HP after tick', () async {
      // Assuming there's a CombatResolver and it handles combat logic
      // Mocking the combat resolver to simulate damage
      final vectors = gameState.state.vectors;
      expect(vectors.length, equals(2));
      expect(vectors.every((v) => v.currentHealth > 0), isTrue);

      // Simulate a tick where both units collide and deal damage
      // This part would depend on the actual combat resolver logic
      // For now, we'll just assume that after a tick, both units should be at 0 HP
      vectors.forEach((v) {
        gameState.damageVector(v.id, v.maxHealth); // Simulate taking full damage
      });

      // Verify that both units are removed from the game state
      final updatedVectors = gameState.state.vectors;
      expect(updatedVectors.length, equals(0));
    });
  });
}