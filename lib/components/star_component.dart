// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flame/components.dart';
import 'package:astro_flux/models/star.dart';
import 'neon_renderer.dart';

class StarComponent extends PositionComponent with NeonRenderer {
  final Star star;

  StarComponent({
    required this.star,
    Vector2? position,
  }) : super(position: position);

  @override
  Color get neonColor => const Color.fromARGB(255, 255, 200, 0);

  @override
  double get glowRadius => 20.0;

  @override
  void render(Canvas canvas) {
    renderNeonSelf(canvas);
    final paint = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..blendMode = BlendMode.plus;
    canvas.drawCircle(Offset.zero, 8.0, paint);
  }
}