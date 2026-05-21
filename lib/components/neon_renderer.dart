import 'dart:ui';
import 'package:flame/components.dart' hide Vector;

/// Base mixin for rendering neon/glow effects
/// Must be used with PositionComponent subclasses
mixin NeonRenderer on PositionComponent {
  /// The neon color to render
  Color get neonColor;

  /// The glow radius in game units
  double get glowRadius;

  /// Renders the neon glow effect to the canvas
  void renderNeonSelf(Canvas canvas) {
    final paint = Paint()
      ..color = neonColor.withAlpha(200)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, glowRadius)
      ..blendMode = BlendMode.plus;

    canvas.drawCircle(Offset.zero, glowRadius / 2, paint);
  }

  /// Renders the core shape with neon glow
  void renderNeonWithShape(Canvas canvas, void Function(Paint paint) shapeRenderer) {
    renderNeonSelf(canvas);

    final shapePaint = Paint()..blendMode = BlendMode.plus;
    shapeRenderer(shapePaint);

    canvas.drawCircle(Offset.zero, glowRadius / 4, shapePaint);
  }
}
