// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flutter/widgets.dart';

/// A component that displays high-saturation neon text that floats upwards
/// and fades out over time, providing visual feedback for combat events.
class CombatTextComponent extends PositionComponent {
  final String text;
  final Color color;
  final double duration;
  double _elapsed = 0;

  CombatTextComponent({
    required this.text,
    required this.color,
    required this.duration,
    required Vector2 position,
  }) : super(position: position);

  @override
  void update(double dt) {
    _elapsed += dt;
    // Move upwards
    position.y -= 40 * dt;
    // Remove from parent when duration expires
    if (_elapsed >= duration) {
      removeFromParent();
    }
  }

  /// Override in subclasses to control rendered opacity (0.0–1.0).
  /// Defaults to a linear fade-out over [duration].
  double get renderOpacity => (1.0 - (_elapsed / duration).clamp(0.0, 1.0)).clamp(0.0, 1.0);

  @override
  void render(Canvas canvas) {
    final double opacity = renderOpacity;
    if (opacity <= 0) return;

    final textOffset = position.toOffset();
    final alpha = (opacity * 255).toInt();

    // Define a bounds for the glow effect layer to avoid blurring the whole screen
    final glowBounds = Rect.fromLTWH(
      position.x - 50,
      position.y - 20,
      150,
      40,
    );

    // 1. Draw the Glow Layer using additive blending and blur
    canvas.saveLayer(
      glowBounds,
      Paint()
        ..blendMode = BlendMode.plus
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8.0),
    );

    final textPainterGlow = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: color.withAlpha((alpha * 150).toInt()),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    textPainterGlow.paint(canvas, textOffset);
    canvas.restore();

    // 2. Draw the sharp, primary text on top of the glow
    final textPainterMain = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: color.withAlpha(alpha),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    textPainterMain.paint(canvas, textOffset);
  }
}