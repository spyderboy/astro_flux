import 'dart:ui';
import 'package:flame/components.dart';

enum AnimationState { inactive, active }

class BurstAnimationComponent extends PositionComponent {
  Color color;
  double opacity = 1.0;
  final double radius;
  final double glowRadius;
  AnimationState state = AnimationState.inactive;

  BurstAnimationComponent({
    required this.color,
    Vector2? position,
    this.radius = 8.0,
    this.glowRadius = 12.0,
  }) : super(position: position, size: Vector2.all(radius * 2));

  @override
  void update(double dt) {
    if (state == AnimationState.active) {
      opacity -= 0.05;
      if (opacity <= 0) {
        opacity = 0;
        state = AnimationState.inactive;
      }
    }
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()..color = color.withAlpha((opacity * 255).round());
    canvas.drawCircle(
      Offset(position.x, position.y),
      radius + glowRadius * opacity,
      paint,
    );
  }
}
