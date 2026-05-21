// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';
import 'package:flame/components.dart' hide Vector;
import 'package:astro_flux/game/particle_system.dart';

void main() {
  group('ParticleSystem API', () {
    test('spawnSpark adds particle', () {
      final system = ParticleSystem();
      system.spawnSpark(Vector2(5, 5), const Color(0xFFFFFF00));
      expect(system.particles.length, greaterThan(0));
    });

    test('spawnBurst named count param', () {
      final system = ParticleSystem();
      system.spawnBurst(Vector2(0, 0), const Color(0xFF0000FF), count: 4);
      expect(system.particles.length, equals(4));
    });

    test('activeParticles returns non-dead particles', () {
      final system = ParticleSystem();
      system.spawnSpark(Vector2(0, 0), const Color(0xFFFFFFFF));
      expect(system.activeParticles.length, greaterThan(0));
    });

    test('clear empties list', () {
      final system = ParticleSystem();
      system.spawnSpark(Vector2(0, 0), const Color(0xFFFFFFFF));
      system.clear();
      expect(system.particles.isEmpty, isTrue);
    });
  });
}
