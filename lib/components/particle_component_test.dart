// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart' hide Vector;
import 'package:astro_flux/components/particle_component.dart';
import 'package:astro_flux/models/particle.dart';

void main() {
  test('ParticleComponent renders without error', () {
    final particle = Particle(
      position: Vector2(100, 100),
      velocity: Vector2(10, 0),
      color: Colors.red,
      lifeTime: 1.0,
      size: 5,
    );
    final component = ParticleComponent(particle: particle);

    expect(component.particle.position.x, 100);
    expect(component.particle.velocity.x, 10);
    expect(component.particle.isDead, false);
   });

  test('ParticleComponent lifetime decreases over time', () {
    final particle = Particle(
      position: Vector2(100, 100),
      velocity: Vector2(0, 0),
      color: Colors.blue,
      lifeTime: 1.0,
      size: 5,
    );
    final component = ParticleComponent(particle: particle);

    component.update(0.5);
    expect(component.particle.currentLife, closeTo(0.5, 0.01));
    expect(component.particle.isDead, false);

    component.update(0.6);
    expect(component.particle.isDead, true);
   });
}