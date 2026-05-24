// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flutter/painting.dart' show Color;
import 'package:astro_flux/components/neon_renderer.dart';
import 'package:astro_flux/models/mote.dart';

/// A component that renders a "mote" — a small glowing orb — using the
/// [NeonRenderer] mixin for a neon glow effect.
class MoteComponent extends PositionComponent with NeonRenderer {
  /// The base color of this mote's neon glow.
  @override
  final Color neonColor;

  /// The radius used for the glow effect (also the visual size of the mote).
  @override
  final double glowRadius;

  final Mote mote;

  /// Whether this mote is currently selected by the player.
  bool isSelected = false;

  MoteComponent({
    required this.neonColor,
    required this.glowRadius,
    required this.mote,
    super.position,
    super.anchor,
  }) : super(
          size: Vector2.all(glowRadius * 3),
        );

  @override
  void render(Canvas canvas) {
    // The PositionComponent canvas is already translated to this component's
    // top-left corner. Shift to the visual centre before drawing.
    canvas.translate(glowRadius * 1.5, glowRadius * 1.5);
    renderNeonSelf(canvas);

    // Selection highlight ring — drawn on top of glow.
    if (isSelected) {
      canvas.drawCircle(
        Offset.zero,
        glowRadius + 4.0,
        Paint()
          ..color = neonColor.withValues(alpha: 0.5)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0,
      );
    }
  }
}