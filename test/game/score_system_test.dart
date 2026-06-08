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

    test('addKill(1) increases score by 10', () async {
      final notifier = container.read(gameServiceProvider.notifier);
      notifier.addKill(1);

      final state = container.read(gameServiceProvider);
      expect(state.score, 10);
    });

    test('addCapture increases by 100', () async {
      final notifier = container.read(gameServiceProvider.notifier);
      notifier.addCapture();

      final state = container.read(gameServiceProvider);
      expect(state.score, 100);
    });
  });
}
