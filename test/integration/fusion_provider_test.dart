// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/providers/fusion_provider.dart';
import 'package:astro_flux/models/game_state_provider.dart';

void main() {
  group('FusionProvider Integration', () {
    test('no fusion fires at 9 motes in Riverpod state', () async {
      final container = ProviderContainer();
      final fusionProvider = container.read(fusionProviderProvider);
      final gameStateNotifier = container.read(gameServiceProvider.notifier);

      // Add 9 motes to game state
      for (int i = 0; i < 9; i++) {
        gameStateNotifier.addMote(i);
      }

      // Trigger fusion attempt
      await fusionProvider.requestFusion();

      // Verify no fusion occurred
      expect(container.read(gameServiceProvider).vectors, isEmpty);
    });
  });
}
