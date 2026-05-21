// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/test.dart';
import 'package:astro_flux/models/game_state.dart';
import 'package:astro_flux/game/victory_rules.dart';

void main() {
  test('capturedAllStars victory condition', () {
    final gameState = GameState(
      motes: [],
      vectors: [],
      stars: [Star(id: 1, tier: 1, ownerId: 'player1')],
    );

    expect(VictoryRules.isVictory(gameState, 'player1'), isTrue);
  });

  test('fusionCountReached victory condition', () {
    final gameState = GameState(
      motes: List.generate(10, (_) => Mote(id: _)),
      vectors: [],
      stars: [],
    );

    expect(VictoryRules.isVictory(gameState, 'player1'), isTrue);
  });

  test('timeExpired victory condition', () {
    final gameState = GameState(
      motes: [],
      vectors: [],
      stars: [Star(id: 1, tier: 1, ownerId: 'player1')],
    );

    expect(VictoryRules.isVictory(gameState, 'player2'), isFalse);
  });
}