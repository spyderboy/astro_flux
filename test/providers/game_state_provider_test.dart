// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/models/game_state_provider.dart';

void main() {
  group('GameStateNotifier', () {
    late ProviderContainer container;
    late GameStateNotifier notifier;

    setUp(() {
      container = ProviderContainer();
      notifier = container.read(gameServiceProvider.notifier);
    });

    test('addMote adds mote to state', () {
      notifier.addMote(1);
      final state = container.read(gameServiceProvider);
      expect(state.motes.length, equals(1));
    });

    test('addVector adds vector to state', () {
      notifier.addVector(1);
      final state = container.read(gameServiceProvider);
      expect(state.vectors.length, equals(1));
    });

    test('addStar adds star to state', () {
      notifier.addStar(1, 1);
      final state = container.read(gameServiceProvider);
      expect(state.stars.length, equals(1));
    });

    test('captureStar updates star owner', () {
      notifier.addStar(1, 1);
      notifier.captureStar(1, 'player1');
      final state = container.read(gameServiceProvider);
      expect(state.stars.first.ownerId, equals('player1'));
    });

    test('clearMotes clears all motes', () {
      notifier.addMote(1);
      notifier.clearMotes();
      final state = container.read(gameServiceProvider);
      expect(state.motes.isEmpty, isTrue);
    });
  });
}