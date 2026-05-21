// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/game/astro_game_state_provider.dart';
import 'package:astro_flux/components/fusion_effect_service.dart';

void main() {
  group('FusionEffectService Integration Test', () {
    late ProviderContainer container;
    late GameStateNotifier gameState;
    late FusionEffectService fusionEffectService;

    setUp(() {
      gameState = GameStateNotifier();
      fusionEffectService = FusionEffectService(gameState);
      container = ProviderContainer(
        overrides: [
          astroGameStateProvider.overrideWith((ref) => GameStateNotifier()),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('should trigger fusion explosion and update game state', () async {
      final position = Vector2(100, 200);
      await tester.pumpWidget(
        ProviderScope(
          container: container,
          child: MaterialApp(home: Scaffold()),
        ),
      );

      fusionEffectService.triggerFusion(position);
      await tester.pumpAndSettle();

      expect(gameState.motes.length, 0);
      expect(gameState.vectors.length, 1);
    });

    test('should handle partial fusion failure scenario', () async {
      // Add 9 motes to game state
      for (int i = 1; i <= 9; i++) {
        await container.read(gameServiceProvider.notifier).addMote(i);
      }

      // Trigger fusion at position where only 9 motes exist
      final position = Vector2(100, 200);
      fusionEffectService.triggerFusion(position);

      // Verify that no vectors are created and mote count is unchanged
      expect(gameState.vectors.length, 0);
      expect(gameState.motes.length, 9);
    });
  });
}