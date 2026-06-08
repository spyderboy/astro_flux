// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/models/mote.dart';
import 'package:astro_flux/models/star.dart';
import 'package:astro_flux/models/game_state.dart';
import 'package:astro_flux/game/capture_rules.dart';

void main() {
  test('CaptureRules canAttack returns false for unknown IDs', () {
    final gameState = GameState(
      motes: [],
      vectors: [],
      stars: [Star(id: 1, tier: 1, ownerId: '')],
    );

    expect(CaptureRules.canAttack(-1, gameState), false);
    expect(CaptureRules.canAttack(2, gameState), false);
  });

  test('CaptureRules canAttack returns true for valid pair', () {
    final gameState = GameState(
      motes: [],
      vectors: [],
      stars: [Star(id: 1, tier: 1, ownerId: '')],
    );

    expect(CaptureRules.canAttack(1, gameState), true);
  });
}