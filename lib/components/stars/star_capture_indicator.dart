// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flame/components.dart';

/// A component that renders a neon checkmark when a star is captured.
/// The checkmark fades in over [_duration] seconds and then removes itself.
class StarCaptureIndicator extends PositionComponent {
  final int starId;
  final Color color;
  static const double _duration = 1.5;

  StarCaptureIndicator({
    required this.starId,
    required this.color,
    Vector2? position,
  }) : super(
          position: position ?? Vector2.zero(),
          size: Vector2.all(60.0),
          anchor: Anchor.center,
        );

  double _progress = 0.0;
  bool _captured = false;

  /// Call to start the capture animation.
  void startCapture() {
    _captured = true;
    _progress = 0.0;
  }

  @override
  void update(double dt) {
    if (!_captured) return;
    _progress += dt / _duration;
    if (_progress >= 1.0) removeFromParent();
  }

  @override
  void render(Canvas canvas) {
    if (!_captured) return;

    final alpha = (_progress * 255).clamp(0, 255).toInt();

    final Paint paint = Paint()
      ..color = color.withAlpha(alpha)
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12.0)
      ..blendMode = BlendMode.plus;

    final Paint glow = Paint()
      ..color = color.withAlpha((alpha * 0.4).toInt())
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20.0)
      ..blendMode = BlendMode.plus;

    // Checkmark centred on component origin
    final Path path = Path();
    path.moveTo(-15.0, 0.0);
    path.lineTo(0.0,   15.0);
    path.lineTo(15.0, -15.0);

    canvas.drawPath(path, glow);
    canvas.drawPath(path, paint);
  }
}