// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flutter/material.dart' show Color;
import 'package:astro_flux/models/attack_particle.dart';

class AttackParticleComponent extends PositionComponent {
  final AttackParticle particle;
  double remainingLifetime;

  AttackParticleComponent({
    required this.particle,
  }) : remainingLifetime = particle.lifetime,
    super(size: Vector2.all(10.0));

  @override
  void update(double dt) {
    remainingLifetime -= dt;
    if (remainingLifetime <= 0) {
      removeFromParent();
    }
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()
      ..color = particle.neonColor
      ..blendMode = particle.blendMode;
    
    canvas.drawCircle(
      Offset(size.x / 2, size.y / 2),
      size.x / 2,
      paint,
    );
  }
}