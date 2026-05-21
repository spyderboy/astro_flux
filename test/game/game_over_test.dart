// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/game_state.dart';
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:astro_flux/game/game_over_controller.dart';

void main() {
  group('Game Over Tests', () {
    test('should handle game over state', () {
      final container = ProviderContainer();
      final notifier = container.read(gameServiceProvider.notifier);
      final state = GameState(motes: [], vectors: [], stars: []);

      notifier.state = state;

      expect(notifier.motes, isEmpty);
      expect(notifier.vectors, isEmpty);
    });

    test('should handle pause resume', () async {
      final container = ProviderContainer();
      final notifier = container.read(gameServiceProvider.notifier);

      expect(notifier.state, isA<GameState>());
    });

    test('should handle reset', () {
      final container = ProviderContainer();
      final notifier = container.read(gameServiceProvider.notifier);

      notifier.reset();

      expect(notifier.motes, isEmpty);
      expect(notifier.vectors, isEmpty);
    });

    test('triggers game over and shows overlay', () {
      final container = ProviderContainer(
        overrides: [
          gameOverProvider.overrideWithValue(GameOverReason.defeat),
        ],
      );
      final controller = GameOverController(container);
      final gameMock = MockGame();

      expect(gameMock.paused, isFalse);
      controller.triggerGameOver(GameOverReason.defeat, gameMock);
      expect(gameMock.paused, isTrue);
    });

    test('resets game and hides overlay', () {
      final container = ProviderContainer(
        overrides: [
          gameOverProvider.overrideWithValue(GameOverReason.defeat),
        ],
      );
      final controller = GameOverController(container);

      expect(controller.ref.read(gameServiceProvider.notifier).motes, isEmpty);
      controller.resetGame();
      expect(controller.ref.read(gameServiceProvider.notifier).motes, isNotEmpty);
    });
  });
}
