import 'package:flutter/material.dart';
import 'package:flame/components.dart';

class StarProductionIndicator extends PositionComponent {
  final int tier;

  StarProductionIndicator(this.tier) : super();

  @override
  void render(Canvas canvas) {
    // Render the star production rate based on its tier
    Paint paint = Paint()..color = const Color(0xFF00FF00)..style = PaintingStyle.stroke;
    canvas.drawCircle(position.toOffset(), size.x / 2, paint);
  }
}