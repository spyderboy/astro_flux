import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/providers/combat_state_provider.dart';
import 'package:astro_flux/models/game_state_provider.dart';

void main() {
  group('Combat State Providers Integration Tests', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('Combat providers react to vector additions', () {
      final notifier = container.read(gameServiceProvider.notifier);

      // Initial state: 0 vectors
      expect(container.read(combatScoreProvider), 0);
      expect(container.read(battleStateProvider), BattleState.none);
      expect(container.read(battleActiveProvider), false);
      expect(container.read(battleIntensityProvider), 0.0);

      // Add first vector
      notifier.addVector(1);
      expect(container.read(combatScoreProvider), 1);
      expect(container.read(battleStateProvider), BattleState.active);
      expect(container.read(battleActiveProvider), true);
      expect(container.read(battleIntensityProvider), 0.1);

      // Add more vectors to reach intense state (>= 3)
      notifier.addVector(2);
      notifier.addVector(3);
      expect(container.read(combatScoreProvider), 3);
      expect(container.read(battleStateProvider), BattleState.intense);
      expect(container.read(battleIntensityProvider), 0.3);

      // Check clamping at 10+ vectors
      for (int i = 4; i <= 15; i++) {
        notifier.addVector(i);
      }
      expect(container.read(combatScoreProvider), 12);
      expect(container.read(battleIntensityProvider), 1.0);
    });

    test('Combat providers react to vector removal', () {
      final notifier = container.read(gameServiceProvider.notifier);

      // Setup: 3 vectors
      notifier.addVector(1);
      notifier.addVector(2);
      notifier.addVector(3);
      expect(container.read(battleStateProvider), BattleState.intense);

      // Remove vectors
      notifier.removeVector(1);
      notifier.removeVector(2);
      
      expect(container.read(combatScoreProvider), 1);
      expect(container.read(battleStateProvider), BattleState.active);
      
      notifier.removeVector(3);
      expect(container.read(combatScoreProvider), 0);
      expect(container.read(battleStateProvider), BattleState.none);
      expect(container.read(battleActiveProvider), false);
    });
  });
}