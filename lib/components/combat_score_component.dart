import 'package:flame/components.dart';
import 'package:flutter/material.dart';

/// A component that displays the combat score in the game canvas.
class CombatScoreComponent extends TextComponent {
  int _score = 0;

  CombatScoreComponent({
    required Vector2 position,
  }) : super(
          position: position,
          text: 'SCORE: 0',
          textRenderer: TextPaint(
            style: const TextStyle(
              color: Colors.cyan,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        );

  /// Updates the displayed score.
  void updateScore(int newScore) {
    _score = newScore;
    text = 'SCORE: $_score';
  }

  /// Updates the component based on battle state.
  void updateBattleState(dynamic state) {
    // Placeholder to satisfy CombatStateObserverComponent.
  }
}