// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/components/star_defense_component.dart';
import 'package:astro_flux/models/game_state_provider.dart';

void main() {
  group('StarDefenseComponent', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    test('defense cooldown activation, blocking, and expiry', () {
      final ref = container.read(gameServiceProvider.notifier);

      // Initial setup: Star owned by player1, Vector nearby
      final star1 = const Star(id: 1, tier: 1, ownerId: 'player1');
      ref.addStar(star1.id, star1.tier);

      final vector1 = const Vector(id: 101);
      ref.addVector(vector1.id);

      // Verify defense works initially (no cooldown)
      expect(ref.read(StarDefenseComponent(starId: star1.id, ref: ref).state), equals(true));

      // Capture: Add a second star component with same ID but different owner
      final star2 = const Star(id: 1, tier: 1, ownerId: 'player2');
      ref.addStar(star2.id, star2.tier);

      // First update to process the capture and start cooldown
      await container.pump(Duration(seconds: 1));

      // Verify defense is blocked during cooldown
      expect(ref.read(StarDefenseComponent(starId: star2.id, ref: ref).state), equals(false));

      // Wait for cooldown to expire
      await container.pump(Duration(seconds: 5));

      // Verify defense is active after cooldown expires
      expect(ref.read(StarDefenseComponent(starId: star2.id, ref: ref).state), equals(true));
    });
  });
}