// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flame/components.dart';

class StarProductionIndicator extends PositionComponent {
  final int tier;

  StarProductionIndicator(this.tier) : super();

  static const Color _productionColor = Color(0xFF00FF00);
  static const double _circleRadiusMultiplier = 0.5;

  @override
  void render(Canvas canvas) {
    Paint paint = Paint()..color = _productionColor..style = PaintingStyle.stroke;
    canvas.drawCircle(position.toOffset(), size.x * _circleRadiusMultiplier, paint);
  }
}
