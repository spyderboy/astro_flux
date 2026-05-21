// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/models/game_state_provider.dart';

void main() {
  group('StarDecayProvider', () {
    late ProviderContainer container;
    late GameStateNotifier notifier;

    setUp(() {
      container = ProviderContainer();
      notifier = container.read(gameServiceProvider.notifier);
    });

    test('star decay respects tier', () {
      notifier.addStar(1, 3);
      final state = container.read(gameServiceProvider);
      expect(state.stars.first.tier, equals(3));
    });

    test('star can be removed', () {
      notifier.addStar(1, 1);
      notifier.removeStar(1);
      final state = container.read(gameServiceProvider);
      expect(state.stars.isEmpty, isTrue);
    });
  });
}