// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/combat_attack_event.dart';
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:astro_flux/components/combat_attack_handler.dart';
import 'package:astro_flux/models/mote.dart';
import 'package:astro_flux/models/star.dart';
import 'package:flutter_vector_math/flutter_vector_math.dart';

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

    test('handleEvent detects mote-star hit within radius', () {
      final handler = container.read(handlerProvider);

      // Add a star with radius 20
      container.read(gameServiceProvider.notifier).addStar(1, 1);

      // Add a mote close to the star (radius 5)
      container.read(gameServiceProvider.notifier).addMote(1);
      final mote = container.read(gameServiceProvider.state).motes.first;
      mote.position = Vector2(0, 0);

      // Trigger combat event
      const event = CombatAttackEvent(sourceVectorId: 1, targetStarId: 1);
      handler.handleEvent(event);

      // Check if particles are spawned
      final particleSystem = container.read(gameServiceProvider.state).particleSystem;
      expect(particleSystem.sparks.length, isNonZero, reason: 'Should spawn sparks when mote hits star');
    });
  });
}
