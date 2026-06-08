// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';

import 'package:flame/components.dart' hide Vector;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:astro_flux/models/combat_attack_event.dart';
import 'package:astro_flux/components/attack_line_component.dart';

class AttackLineManagerComponent extends PositionComponent {
  final int starId;
  final Ref ref;

  const AttackLineManagerComponent({required this.starId, required this.ref});

  @override
  void onMount() {
    super.onMount();
  }

  @override
  void render(Canvas canvas) {
    final event = ref.read(combatAttackEventProvider);

    if (event == null || !event.targetStarId == starId) return;

    final color = const Color(0xFF00FFFF);
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    canvas.drawLine(
      Offset(position.x, position.y),
      Offset(position.x + 100, position.y + 50),
      paint,
    );
  }
}
