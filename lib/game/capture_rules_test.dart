// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/models/mote.dart';
import 'package:astro_flux/models/star.dart';
import 'package:astro_flux/models/game_state.dart';
import 'package:astro_flux/game/capture_rules.dart';
import 'package:flutter/fake_async.dart';

void main() {
  test('CaptureRules should allow capturing a star', () {
    final gameState = GameState(
      motes: List.generate(10, (index) => Mote(id: index)),
      vectors: [],
      stars: [Star(id: 1, tier: 1, ownerId: 'player')],
    );

    expect(CaptureRules.canCapture(1, 1, gameState), true);

    fakeAsync((async) {
      CaptureRules.tryPerformCapture(ref.read(gameServiceProvider.notifier), 1, 1);
      async.elapse(Duration(seconds: 1));
      expect(gameState.motes.length, equals(0));
      expect(gameState.vectors.length, equals(1));
    });
  });

  test('CaptureRules should transition from tier 1 to tier 2 at capture threshold', () {
    final gameState = GameState(
      motes: List.generate(20, (index) => Mote(id: index)),
      vectors: [],
      stars: [Star(id: 1, tier: 1, ownerId: 'player')],
    );

    expect(CaptureRules.canCapture(1, 1, gameState), true);

    fakeAsync((async) {
      CaptureRules.tryPerformCapture(ref.read(gameServiceProvider.notifier), 1, 1);
      async.elapse(Duration(seconds: 1));
      final newState = ref.read(gameServiceProvider);
      expect(newState.stars[0].tier, equals(2));
    });
  });
}
