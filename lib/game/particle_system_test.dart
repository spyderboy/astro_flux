// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';
import 'package:flame/components.dart' hide Vector;
import 'package:astro_flux/game/particle_system.dart';

void main() {
  group('ParticleSystem', () {
    test('starts empty', () {
      final system = ParticleSystem();
      expect(system.particles.isEmpty, isTrue);
    });

    test('spawnBurst adds particles', () {
      final system = ParticleSystem();
      system.spawnBurst(Vector2(10, 10), const Color(0xFFFF0000), count: 5);
      expect(system.particles.length, equals(5));
    });

    test('spawnTrail adds one particle', () {
      final system = ParticleSystem();
      system.spawnTrail(Vector2(10, 10), Vector2(1, 0), const Color(0xFF00FF00));
      expect(system.particles.length, equals(1));
    });

    test('clear removes all particles', () {
      final system = ParticleSystem();
      system.spawnBurst(Vector2(0, 0), const Color(0xFFFFFFFF), count: 3);
      system.clear();
      expect(system.particles.isEmpty, isTrue);
    });
  });
}
