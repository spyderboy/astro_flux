// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/mote.dart';
import 'package:astro_flux/models/game_state.dart';
import 'package:astro_flux/providers/fusion_provider.dart';

void main() {
  group('Fusion Request Validation Tests', () {
    test('should validate fusion request', () async {
      final container = ProviderContainer();
      final notifier = container.read(gameServiceProvider.notifier);
      final fusionProvider = container.listen(fusionProvider, (prev, next) {});

      final motes = List.generate(10, (i) => Mote(id: i));
      notifier.state = GameState(motes: motes, vectors: [], stars: []);

      final canFuse = container.read(canFuseProvider);

      expect(canFuse, isTrue);
    });

    test('should not validate fusion with insufficient motes', () async {
      final container = ProviderContainer();
      final notifier = container.read(gameServiceProvider.notifier);
      final fusionProvider = container.listen(fusionProvider, (prev, next) {});

      final motes = List.generate(5, (i) => Mote(id: i));
      notifier.state = GameState(motes: motes, vectors: [], stars: []);

      final canFuse = container.read(canFuseProvider);

      expect(canFuse, isFalse);
    });
  });
}
