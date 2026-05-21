// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flame/components.dart';

/// A visual indicator showing which player owns a star.
/// It renders a neon-glowing ring around the star's position using a rendering path.
class StarOwnershipBorder extends PositionComponent {
  final Color color;
  final double radius;

  StarOwnershipBorder({
    required this.color,
    required this.radius,
    required Vector2 position,
  }) : super(
          position: position,
          size: Vector2.all(radius * 2),
          anchor: Anchor.center,
        );

  @override
  void render(Canvas canvas) {
    final center = Offset(size.x / 2, size.y / 2);
    final path = Path()..addOval(Rect.fromCircle(center: center, radius: radius));

    // The sharp neon edge
    final edgePaint = Paint()
      ..color = color.withAlpha(255)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    // The soft additive glow
    final glowPaint = Paint()
      ..color = color.withAlpha(120)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..blendMode = BlendMode.plus
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3.0);

    canvas.drawPath(path, edgePaint);
    canvas.drawPath(path, glowPaint);
  }
}