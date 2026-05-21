// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';
import 'package:flame/components.dart' hide Vector;
import '../game/particle_system.dart';
import '../game/particle_effects.dart';

void main() {
  group('ParticleEffects (component tests)', () {
    test('trigger adds particles to system', () {
      final system = ParticleSystem();
      ParticleEffects(system).trigger(
        CombatEffect.attack, Vector2(10, 10), const Color(0xFFFF0000),
      );
      expect(system.particles.length, greaterThan(0));
    });

    test('all CombatEffect values are handled', () {
      for (final effect in CombatEffect.values) {
        final system = ParticleSystem();
        ParticleEffects(system).trigger(
          effect, Vector2(0, 0), const Color(0xFFFFFFFF),
        );
        expect(system.particles.length, greaterThan(0));
      }
    });
  });
}
