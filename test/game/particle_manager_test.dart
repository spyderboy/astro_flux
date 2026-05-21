// ignore_for_file: depend_on_referenced_packages
import 'package:flame/components.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/game/particle_manager.dart';
import 'package:astro_flux/models/attack_particle.dart';
import 'package:flutter/material.dart';

void main() {
  test('ParticleManager.spawn respects 200-particle cap and returns false when full', () {
    final manager = ParticleManager();
    final position = Vector2(100, 100);

    // Fill the manager up to the maxParticles limit (200).
    for (int i = 0; i < ParticleManager.maxParticles; i++) {
      final particle = AttackParticle(
        velocity: Vector2(1, 0),
        neonColor: Colors.red,
        lifetime: 1.0,
      );
      final success = manager.spawn(particle, position);
      expect(success, isTrue, reason: 'Failed to spawn particle at index $i');
    }

    // The 201st spawn should return false.
    final extraParticle = AttackParticle(
      velocity: Vector2(0, 1),
      neonColor: Colors.blue,
      lifetime: 0.5,
    );
    final failure = manager.spawn(extraParticle, position);
    expect(failure, isFalse, reason: 'Should return false when maxParticles is reached');
    expect(manager.children.length, ParticleManager.maxParticles);
  });
}