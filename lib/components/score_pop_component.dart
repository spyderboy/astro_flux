// ignore_for_file: depend_on_referenced_packages
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ScorePopComponent extends PositionComponent {
  final String text;
  final double duration = 0.8; // Duration for fading effect
  double _elapsed = 0.0;

  ScorePopComponent({
    required Vector2 position,
    required this.text,
  }) : super(
        position: position,
        size: Vector2(50, 30),
      );

  @override
  void render(Canvas canvas) {
    final paint = TextPaint(
      style: TextStyle(
        color: Color.fromARGB((1.0 - (_elapsed / duration)).clamp(0.0, 1.0) * 255, 255, 255, 0),
        fontSize: 24,
        fontWeight: FontWeight.bold,
        blendMode: BlendMode.plus,
      ),
    );
    paint.render(canvas, text, Vector2(0, -30), anchor: Anchor.bottomCenter);
  }

  @override
  void update(double dt) {
    _elapsed += dt;
    position.y -= (30 * dt).clamp(0.0, 30.0); // Move upwards

    if (_elapsed >= duration) {
      removeFromParent();
    }
  }
}
