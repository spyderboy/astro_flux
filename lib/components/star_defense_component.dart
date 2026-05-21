import 'dart:ui';

import 'package:flame/components.dart' hide Vector;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:astro_flux/models/star.dart';

/// A component that renders a star defense indicator.
class StarDefenseComponent extends PositionComponent {
  final int starId;
  final Ref ref;

  const StarDefenseComponent({required this.starId, required this.ref});

  @override
  void onMount() {
    super.onMount();
  }

  @override
  void render(UnitedCanvas canvas, double dx, dy) {
    final star = ref.read(gameServiceProvider.state).stars.firstWhere(
      (s) => s.id == starId,
      orElse: () => const Star(0, 1, ''),
    );

    if (!star.isDefending()) return;

    final color = Color(0xFF00FFFF);
    final paint = Paint()
      ..color = color
      ..withAlpha((255 - (dx / dy * 2)).toInt());

    canvas.drawCircle(
      Offset(dx, dy),
      10.0,
      paint,
    );
  }
}
