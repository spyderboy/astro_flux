// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flame/components.dart';

/// A component that handles combat attack visual effects.
class AttackLineComponent extends PositionComponent {
  final Vector2 start;
  final Vector2 end;

  AttackLineComponent({required this.start, required this.end});

  @override
  void render(Canvas canvas) {
    final paint = Paint()
      ..color = const Color(0xFF00FFFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    canvas.drawLine(start.toOffset(), end.toOffset(), paint);
  }
}
