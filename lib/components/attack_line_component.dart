// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flame/components.dart';

class AttackLineComponent extends PositionComponent {
  final Vector2 start;
  final Vector2 end;

  AttackLineComponent({required this.start, required this.end});

  static const Color _attackLineColor = Color(0xFF00FFFF);
  static const double _lineStrokeWidth = 2.0;

  @override
  void render(Canvas canvas) {
    final paint = Paint()
      ..color = _attackLineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = _lineStrokeWidth;
    canvas.drawLine(start.toOffset(), end.toOffset(), paint);
  }
}
