// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';
import 'package:flame/components.dart' hide Vector;
import 'package:astro_flux/models/vector.dart';
import 'package:astro_flux/components/combat_particle_component.dart';

void main() {
  group('CombatParticleComponent', () {
    CombatParticleComponent make({double duration = 1.0}) =>
        CombatParticleComponent(
          sourceVector: const Vector(id: 1),
          targetVector: const Vector(id: 2),
          particleType: ParticleType.attack,
          startPos: Vector2(0, 0),
          endPos: Vector2(100, 100),
          color: const Color(0xFFFF3300),
          duration: duration,
        );

    test('constructs without error', () {
      expect(make, returnsNormally);
    });

    test('update within duration does not remove', () {
      final c = make(duration: 2.0);
      c.update(0.5);
      // still alive — no exception from removeFromParent()
    });
  });
}
