// ignore_for_file: depend_on_referenced_packages
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

/// A component that displays a popping score animation (e.g., "+10").
class ScorePopComponent extends TextComponent {
  final String text;
  final double duration;
  double _elapsed = 0.0;

  ScorePopComponent({
    required Vector2 position,
    required this.text,
    this.duration = 1.0,
  }) : super(
          position: position,
          text: text,
          textRenderer: TextPaint(
            style: const TextStyle(
              color: Colors.yellow,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        );

  @override
  void update(double dt) {
    _elapsed += dt;
    final progress = (_elapsed / duration).clamp(0.0, 1.0);
    final opacity = (1.0 - progress).clamp(0.0, 1.0);

    // Move upwards
    position.y -= 50 * dt;

    // Update text rendering with fading effect
    textRenderer = TextPaint(
      style: TextStyle(
        color: Colors.yellow.withAlpha((opacity * 255).toInt()),
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );

    if (_elapsed >= duration) {
      removeFromParent();
    }
  }
}