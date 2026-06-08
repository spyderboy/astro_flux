// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/mote.dart';
import 'package:astro_flux/models/star.dart';
import 'package:astro_flux/models/game_state.dart';
import 'fusion_rules.dart';

void main() {
  group('FusionRules Test', () {
    test('fusionThreshold should be equal to 10', () {
      expect(FusionRules.fusionThreshold, equals(10));
    });

    test('canFuse with 5 T1 units returns true; 4 returns false', () {
      final gameState = GameState(
        motes: List.generate(10, (index) => Mote(id: index)),
        vectors: [],
        stars: [Star(id: 1, tier: 1, ownerId: '')],
      );

      expect(FusionRules.canFuse(gameState), isFalse);

      gameState.motes.addAll(List.generate(5, (index) => Mote(id: index + 10)));

      expect(FusionRules.canFuse(gameState), isTrue);
    });
  });
}