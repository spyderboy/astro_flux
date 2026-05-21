// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flame/components.dart';

/// A visual effect that plays when a vector is fused.
/// It renders a neon circle that fades away after a short duration.
class FusionExplosionComponent extends PositionComponent {
  final Paint _paint;

  FusionExplosionComponent({required Vector2 position})
      : _paint = Paint()
            ..color = const Color(0xFF00FFAA).withAlpha(200)
            ..style = PaintingStyle.fill
            ..blendMode = BlendMode.plus,
        super(position: position, size: Vector2.all(0));

  @override
  void onMount() {
    super.onMount();
    // Remove the component after a short delay.
    add(
      TimerComponent(
        period: 0.5,
        repeat: false,
        onTick: () => removeFromParent(),
      ),
    );
  }

  @override
  void onRender(Canvas canvas) {
    // Draw a small neon circle at the component's origin.
    canvas.drawCircle(Offset.zero, 20.0, _paint);
  }
}
