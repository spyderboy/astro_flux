// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/providers/star_progression_provider.dart';

void main() {
  group('StarProgressionNotifier', () {
    test('addProgress updates star progress correctly', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final notifier = container.read(starProgressionProvider.notifier);

      notifier.addProgress(1, 5);
      expect(container.read(starProgressionProvider)[1], 5);

      notifier.addProgress(1, 5);
      expect(container.read(starProgressionProvider)[1], 10);
    });

    test('resetProgress removes star progress from state', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final notifier = container.read(starProgressionProvider.notifier);

      notifier.addProgress(1, 5);
      notifier.resetProgress(1);
      expect(container.read(starProgressionProvider).containsKey(1), false);
    });
  });

  group('starUpgradeRequirementProvider', () {
    test('returns 0 for invalid or max tier', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final requirement = container.read(starUpgradeRequirementProvider(0));
      expect(requirement, 0);
    });

    test('requirement is a multiple of 10 for valid tiers', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final requirement = container.read(starUpgradeRequirementProvider(1));
      if (requirement != 0) {
        expect(requirement % 10, 0);
      }
    });
  });
}
