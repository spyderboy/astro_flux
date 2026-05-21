// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/mote.dart';
import 'package:astro_flux/models/game_state.dart';
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:astro_flux/providers/fusion_provider.dart';
import 'package:astro_flux/game/fusion_rules.dart';

void main() {
  group('Game Loop Integration Tests', () {
    test('should allow fusion when enough motes exist', () {
      final motes = List.generate(10, (i) => Mote(id: i));
      final gameState = GameState(motes: motes, vectors: [], stars: []);
      final notifier = GameStateNotifier();
      notifier.state = gameState;

      final canFuse = FusionRules.canFuse(gameState.motes);

      expect(canFuse, isTrue);
      expect(notifier.motes, hasLength(10));
    });

    test('should not allow fusion when not enough motes exist', () {
      final motes = List.generate(5, (i) => Mote(id: i));
      final gameState = GameState(motes: motes, vectors: [], stars: []);

      final canFuse = FusionRules.canFuse(gameState.motes);

      expect(canFuse, isFalse);
      expect(notifier.motes, hasLength(5));
    });

    test('should handle fusion request through provider', () async {
      final container = ProviderContainer();
      final fusionProvider = container.read(fusionProviderProvider);

      expect(fusionProvider, isNotNull);
      expect(fusionProvider.fusionReadyEvents, isA<Stream<FusionReadyEvent>>());
    });
  });
}