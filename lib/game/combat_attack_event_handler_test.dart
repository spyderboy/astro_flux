// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/combat_attack_event.dart';
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:astro_flux/components/combat_attack_handler.dart';

void main() {
  group('CombatAttackHandler', () {
    late ProviderContainer container;

    // A provider to inject the handler with a real Ref backed by the container.
    final handlerProvider = Provider<CombatAttackHandler>((ref) => CombatAttackHandler(ref));

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('handleEvent detects near-miss tap just outside star radius', () {
      final handler = container.read(handlerProvider);
      container.read(gameServiceProvider.notifier).addStar(10, 1);

      // Simulate a combat event with a vector near the star but just outside its radius
      const eventNearMiss = CombatAttackEvent(sourceVectorId: 1, targetStarId: 10);

      expect(
        handler.handleEvent(eventNearMiss),
        isTrue,
        reason: 'Should dispatch visuals for a near-miss tap just outside star radius',
      );
    });
  });
}