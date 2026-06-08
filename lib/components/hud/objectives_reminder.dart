// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flame/components.dart';

/// A component that renders an objectives reminder.
class ObjectivesReminder extends PositionComponent {
  static const double _duration = 8.0;

  ObjectivesReminder({Vector2? position})
      : super(
          position: position ?? Vector2.zero(),
          size: Vector2(200, 50),
          anchor: Anchor.center,
        );

  double _progress = 0.0;

  @override
  void update(double dt) {
    _progress += dt / _duration;
    if (_progress >= 1.0) removeFromParent();
  }

  @override
  void render(Canvas canvas) {
    final alpha = (255 - (_progress * 255)).clamp(0, 255).toInt();

    final paint = Paint()
      ..color = Colors.cyan.withAlpha(alpha)
      ..style = PaintingStyle.fill;

    canvas.drawRect(Rect.fromLTWH(-size.x / 2, -size.y / 2, size.x, size.y), paint);

    final textPaint = TextPaint(
      style: TextStyle(
        color: Colors.black.withAlpha(alpha),
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );

    textPaint.render(canvas, 'Capture all 7 stars', Vector2(-size.x / 2 + 5, -size.y / 2 + 10));
  }
}