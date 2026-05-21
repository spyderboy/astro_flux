
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

  @override
  void render(Canvas canvas) {
    final state = ref.read(fusionIndicatorProvider);
    final count = state.pendingCount;
    const neonColor = Color(0xFF00FFFF);

    // Glow effect using additive blending
    final glowPaint = Paint()
      ..color = neonColor.withAlpha(120)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4.0)
      ..blendMode = BlendMode.plus
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final mainPaint = Paint()
      ..color = neonColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Draw outer ring
    canvas.drawCircle(Offset.zero, 18, glowPaint);
    canvas.drawCircle(Offset.zero, 18, mainPaint);

    // Draw the count as text
    final textPainter = TextPainter(
      text: TextSpan(
        text: '$count/10',
        style: const TextStyle(
          color: neonColor,
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