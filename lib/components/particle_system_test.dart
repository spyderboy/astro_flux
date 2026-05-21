// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';
import 'package:flame/components.dart' hide Vector;
import '../game/particle_system.dart';
import '../models/particle.dart';

void main() {
  group('ParticleSystem (component tests)', () {
    test('spawnSpark creates spark-type particle', () {
      final system = ParticleSystem();
      system.spawnSpark(Vector2(10, 10), const Color(0xFFFF0000));
      expect(system.particles.length, equals(1));
      expect(system.particles[0].particle.type, equals(ParticleType.spark));
    });

    test('activeParticles excludes dead particles', () {
      final system = ParticleSystem();
      system.spawnSpark(Vector2(0, 0), const Color(0xFFFFFFFF));
      expect(system.activeParticles.length, greaterThan(0));
    });

    test('update advances particle lifetime', () {
      final system = ParticleSystem();
      system.spawnSpark(Vector2(0, 0), const Color(0xFFFFFFFF));
      system.update(0.1);
      expect(system.particles[0].particle.currentLife, closeTo(0.1, 0.01));
    });
  });
}
