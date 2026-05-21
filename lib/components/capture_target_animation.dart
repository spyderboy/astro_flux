import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';

/// A component that manages and renders the visual progress of a star capture.
/// It uses the component's update loop as its animation manager.
class CaptureTargetAnimation extends PositionComponent {
  final Color color;
  final double radius;
  final double duration;

  /// The current progress of the capture (0.0 to 1.0).
  final ValueNotifier<double> progress = ValueNotifier<double>(0.0);

  double _elapsed = 0.0;
  bool _isActive = false;

  CaptureTargetAnimation({
    required Vector2 position,
    required this.color,
    this.radius = 25.0,
    this.duration = 5.0,
  }) : super(position: position);

  /// Starts the capture animation from the beginning.
  void start() {
    _elapsed = 0.0;
    _isActive = true;
    progress.value = 0.0;
  }

  @override
  void update(double dt) {
    if (!_isActive) return;

    _elapsed += dt;
    progress.value = (_elapsed / duration).clamp(0.0, 1.0);

    if (_elapsed >= duration) {
      _isActive = false;
    }
  }

  @override
  void render(Canvas canvas) {
    final double p = progress.value;
    if (p <= 0) return;

    final Rect rect = Rect.fromCircle(center: Offset.zero, radius: radius);

    // Outer glow effect: fades as progress increases
    final Paint glowPaint = Paint()
      ..color = color.withAlpha(((1.0 - p).clamp(0.0, 1.0) * 150).toInt())
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 3.0);

    // The primary progress arc
    final Paint progressPaint = Paint()
      ..color = color.withAlpha((255 * p).toInt())
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    canvas.drawArc(
      rect,
      -1.5708, // -90 degrees (start at top)
      6.28318 * p, // Sweep angle (2*PI * progress)
      false,
      glowPaint,
    );

    canvas.drawArc(
      rect,
      -1.5708,
      6.28318 * p,
      false,
      progressPaint,
    );
  }
}
