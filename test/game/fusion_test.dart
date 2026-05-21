// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/game/fusion_provider.dart';
import 'package:test/test.dart';

void main() {
  group('FusionProvider', () {
    test('triggers fusion when mote count reaches exactly 10', () async {
      final container = ProviderContainer();
      await container.read(gameServiceProvider.notifier).addMote(1);
      await container.read(gameServiceProvider.notifier).addMote(2);
      await container.read(gameServiceProvider.notifier).addMote(3);
      await container.read(gameServiceProvider.notifier).addMote(4);
      await container.read(gameServiceProvider.notifier).addMote(5);
      await container.read(gameServiceProvider.notifier).addMote(6);
      await container.read(gameServiceProvider.notifier).addMote(7);
      await container.read(gameServiceProvider.notifier).addMote(8);
      await container.read(gameServiceProvider.notifier).addMote(9);

      // Add one more mote to trigger fusion
      await container.read(gameServiceProvider.notifier).addMote(10);

      final event = container.read(fusionReadyEventProvider.stream).first;
      expect(event, isA<FusionReadyEvent>());
    });
  });
}
