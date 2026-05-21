import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import '../models/mote.dart';

class MoteComponent extends PositionComponent with TapCallbacks {
  final Mote mote;
  final double radius;
  final double glowRadius;
  final Color neonColor;

  MoteComponent({
    required this.mote,
    Vector2? position,
    this.radius = 8.0,
    this.glowRadius = 12.0,
    this.neonColor = const Color(0xFF00FFFF),
  }) : super(position: position) {
    size = Vector2.all(radius * 2);
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()
      ..color = neonColor
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.plus
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, glowRadius / 2);

    canvas.drawCircle(Offset.zero, radius, paint);
  }

  @override
  Future<void> onTapDown(TapDownEvent event) async {
    // Handle mote tap
  }
}
