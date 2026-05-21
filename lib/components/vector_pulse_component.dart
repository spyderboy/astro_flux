// ignore_for_file: depend_on_referenced_packages
import 'dart:math';
import 'dart:ui';
import 'package:flame/components.dart';
import 'package:vector_math/vector_math.dart';

class VectorPulseComponent extends PositionComponent {
  VectorPulseComponent({
    required Vector2 position,
    required double size,
  }) : super(
          position: position,
          size: Vector2(size, size),
          anchor: Anchor.center,
        );

  double _timer = 0;
  static const double _pulseSpeed = 4.0;
  static const double _maxScale = 1.5;
  static const Color _pulseColor = Color(0xFF00FFFF);

  @override
  void update(double dt) {
    _timer += dt;
  }

  @override
  void render(Canvas canvas) {
    final double pulseProgress = (sin(_timer * _pulseSpeed) + 1.0) / 2.0;
    final double currentScale = 1.0 + pulseProgress * (_maxScale - 1.0);
    final double opacity = (1.0 - pulseProgress).clamp(0.0, 1.0);
    
    final paint = Paint()
      ..color = _pulseColor.withAlpha((opacity * 255).toInt() & 0xFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4.0)
      ..blendMode = BlendMode.plus;

    final double radius = (size.x / 2) * currentScale;

    canvas.drawCircle(Offset.zero, radius, paint);
  }
}