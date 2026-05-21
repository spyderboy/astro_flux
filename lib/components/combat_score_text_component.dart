import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class CombatScoreTextComponent extends TextComponent {
  CombatScoreTextComponent({
    super.position,
super.text,
super.textRenderer,
  }) : super(
    text: 'SCORE: 0',
    textRenderer: BitmapFont('assets/fonts/kenvector_future.ttf'),
    size: Vector2(100, 50),
    anchor: Anchor.center,
  );

  void updateScore(int score) {
    text = 'SCORE: $score';
  }
}
