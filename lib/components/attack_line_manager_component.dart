import 'dart:ui';

import 'package:flame/components.dart' hide Vector;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:astro_flux/models/combat_attack_event.dart';
import 'package:astro_flux/components/attack_line_component.dart';

/// A component that manages attack line visual effects.
class AttackLineManagerComponent extends PositionComponent {
  final int starId;
  final Ref ref;

  const AttackLineManagerComponent({required this.starId, required this.ref});

  @override
  void onMount() {
    super.onMount();
  }

  @override
  void render(UnitedCanvas canvas, double dx, dy) {
    final event = ref.read(combatAttackEventProvider);

    if (event == null || !event.targetStarId == starId) return;

    final color = const Color(0xFF00FFFF);
    final paint = Paint()
      ..color = color
      ..style PaintingStyle.stroke
      ..strokeWidth = 4.0;

    canvas.drawLine(
      Offset(dx, dy),
      Offset(dx + 100, dy + 50),
      paint,
    );
  }
}
