// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/providers/fusion_indicator_provider.dart';

class FusionIndicatorComponent extends PositionComponent {
  final Ref ref;

  FusionIndicatorComponent(this.ref)
      : super(
          size: Vector2(40, 40),
          anchor: Anchor.center,
        );

  static const double _glowRadius = 18.0;
  static const int _neonAlpha = 120;
  static const Color _neonColor = Color(0xFF00FFFF);
  static const double _strokeWidthGlow = 4.0;
  static const double _strokeWidthMain = 2.0;

  @override
  void render(Canvas canvas) {
    final state = ref.read(fusionIndicatorProvider);
    final count = state.pendingCount;

    // Glow effect using additive blending
    final glowPaint = Paint()
      ..color = _neonColor.withAlpha(_neonAlpha)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4.0)
      ..blendMode = BlendMode.plus
      ..strokeWidth = _strokeWidthGlow
      ..style = PaintingStyle.stroke;

    final mainPaint = Paint()
      ..color = _neonColor
      ..strokeWidth = _strokeWidthMain
      ..style = PaintingStyle.stroke;

    // Draw outer ring
    canvas.drawCircle(Offset.zero, _glowRadius, glowPaint);
    canvas.drawCircle(Offset.zero, _glowRadius, mainPaint);

    // Draw the count as text
    final textPainter = TextPainter(
      text: TextSpan(
        text: '$count/10',
        style: const TextStyle(
          color: _neonColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    // Center the text within the component's local coordinate system (0,0 is center)
    final textOffset = Offset(
      -textPainter.width / 2,
      -textPainter.height / 2,
    );
    textPainter.paint(canvas, textOffset);
  }
}
