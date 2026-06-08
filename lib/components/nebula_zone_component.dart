// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flame/components.dart';

/// A component that renders a radial gradient nebula zone.
class NebulaZoneComponent extends PositionComponent with NeonRenderer {
  final double glowRadius = 100.0;
  final Color neonColor = const Color(0xFF00FFDD);

  @override
  void render(Canvas canvas) {
    final gradient = RadialGradient(
      colors: [neonColor.withAlpha(45), neonColor.withAlpha(25)],
      stops: [0.8, 1.0],
      tileMode: TileMode.clamp,
    );

    final paint = Paint()
      ..shader = gradient.createShader(Rect.fromCircle(
        center: Offset.zero,
        radius: glowRadius,
      ));

    canvas.drawCircle(Offset.zero, glowRadius, paint);
  }
}