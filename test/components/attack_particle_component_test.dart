// ignore_for_file: depend_on_referenced_packages
import 'package:flame/components.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:astro_flux/components/attack_particle_component.dart';
import 'package:astro_flux/models/attack_particle.dart';

void main() {
  test('AttackParticleComponent removes itself from parent after lifetime expires', () {
    final parent = Component();
    final particle = AttackParticle(
      velocity: Vector2.zero(),
      neonColor: Colors.red,
      lifetime: 1.0,
    );
    final component = AttackParticleComponent(particle: particle);

    parent.add(component);
    expect(parent.children.contains(component), isTrue);

    // Advance time by 0.5s (lifetime is 1.0s)
    parent.update(0.5);
    expect(parent.children.contains(component), isTrue);

    // Advance time by another 0.6s (total 1.1s)
    // Calling update on parent allows it to process component updates and removals
    parent.update(0.6);
    expect(parent.children.contains(component), isFalse);
  });
}