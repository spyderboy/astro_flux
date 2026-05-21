import 'package:flutter_test/flutter_test.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:astro_flux/models/attack_particle.dart';

void main() {
  test('AttackParticle.fromCollision calculates correct outward velocity', () {
    final collisionPoint = Vector2(50, 50);
    final targetPoint = Vector2(150, 50);
    const color = Colors.red;
    const lifetime = 1.0;
    const magnitude = 100.0;

    final particle = AttackParticle.fromCollision(
      collisionPoint: collisionPoint,
      targetPoint: targetPoint,
      neonColor: color,
      lifetime: lifetime,
      magnitude: magnitude,
    );

    // Velocity should point from collisionPoint (50, 50) to targetPoint (150, 50)
    // The direction is (100, 0). Normalized and scaled by 100 -> (100, 0).
    expect(particle.velocity.x, equals(100.0));
    expect(particle.velocity.y, equals(0.0));
  });
}
