// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/game/scoring_service.dart';
import 'package:astro_flux/models/game_state_provider.dart';

void main() {
  group('ScoringService', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('calculates zero score for initial state', () {
      final state = container.read(gameServiceProvider);
      expect(ScoringService.calculateScore(state), 0);
    });

    test('calculates score for Motes (1 pt each)', () {
      final notifier = container.read(gameServiceProvider.notifier);
      notifier.addMote(1);
      notifier.addMote(2);

      final state = container.read(gameServiceProvider);
      expect(ScoringService.calculateScore(state), 2);
    });

    test('calculates score for Vectors (100 pts each)', () {
      final notifier = container.read(gameServiceProvider.notifier);
      notifier.addVector(1);
      notifier.addVector(2);

      final state = container.read(gameServiceProvider);
      expect(ScoringService.calculateScore(state), 200);
    });

    test('calculates score for Stars (Tier based)', () {
      final notifier = container.read(gameServiceProvider.notifier);
      notifier.addStar(1, 1); // 50
      notifier.addStar(2, 2); // 150
      notifier.addStar(3, 3); // 300

      final state = container.read(gameServiceProvider);
      expect(ScoringService.calculateScore(state), 500);
    });

    test('calculates cumulative score with mixed entities', () {
      final notifier = container.read(gameServiceProvider.notifier);

      // 2 Motes = 2
      notifier.addMote(1);
      notifier.addMote(2);

      // 1 Vector = 100
      notifier.addVector(1);

      // 1 Star Tier 2 = 150
      notifier.addStar(1, 2);

      // Total: 2 + 100 + 150 = 252
      final state = container.read(gameServiceProvider);
      expect(ScoringService.calculateScore(state), 252);
    });
  });
}