// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:vector_math/vector_math.dart';

void main() {
  group('GameStateProvider Integration Test', () {
    late ProviderContainer container;
    late GameStateNotifier gameState;

    setUp(() {
      gameState = GameStateNotifier();
      container = ProviderContainer(
        overrides: [
          gameServiceProvider.overrideWith((ref) => gameState),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('fusion triggers at exactly 10 motes', () async {
      // Add 9 motes to game state
      for (int i = 1; i <= 9; i++) {
        await container.read(gameServiceProvider.notifier).addMote(i);
      }

      // Trigger fusion at position where exactly 10 motes exist
      final position = Vector2(100, 200);
      container.read(fusionProvider.notifier).requestFusion(position); // Request fusion for 10 motes

      await tester.pumpAndSettle();

      expect(gameState.motes.length, 9); // Motes should be reduced by 10
      expect(gameState.vectors.length, 1); // One vector should be created
    });
  });
}