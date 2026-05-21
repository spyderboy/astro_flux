// ignore_for_file: depend_on_referenced_packages
import 'package:flame/components.dart' hide Vector;
import 'package:flame/game.dart' hide Vector;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/components/combat_score_component.dart';
import 'package:astro_flux/components/score_pop_component.dart';

class ScoreGoldenTestGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    // 1. Add Score Component to test text rendering
    final scoreComp = CombatScoreComponent(position: Vector2(20, 20));
    scoreComp.updateScore(100);
    add(scoreComp);

    // 2. Add Score Pop Component to test pop animation
    add(ScorePopComponent(
      position: Vector2(100, 100),
      text: '+10',
      duration: 1.0,
    ));
  }
}

void main() {
  testWidgets('Combat score and pop animation golden test', (WidgetTester tester) async {
    final game = ScoreGoldenTestGame();
    
    await tester.pumpWidget(
      GameWidget(game: game),
    );

    // Keyframe 1: Initial state (t = 0.0s)
    // The score component should reflect the score (100)
    await expectLater(
      find.byType(GameWidget),
      matchesGoldenFile('goldens/score_text_initial.png'),
    );

    // Keyframe 2: Mid animation (t = 0.5s)
    // The ScorePopComponent should have moved up and partially faded
    await tester.pump(const Duration(milliseconds: 500));
    await expectLater(
      find.byType(GameWidget),
      matchesGoldenFile('goldens/score_pop_mid_animation.png'),
    );

    // Keyframe 3: End of animation (t = 1.1s)
    // The ScorePopComponent should have been removed from the tree
    await tester.pump(const Duration(milliseconds: 600));
    final popComponentExists = game.children.whereType<ScorePopComponent>().isNotEmpty;
    expect(popComponentExists, isFalse);
  });
}