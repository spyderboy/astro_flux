// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';
import 'package:flame/components.dart' hide Vector;
import 'package:astro_flux/game/particle_system.dart';
import 'package:astro_flux/game/particle_effects.dart';

void main() {
  group('ParticleEffects', () {
    test('trigger attack adds particles', () {
      final system = ParticleSystem();
      ParticleEffects(system).trigger(
        CombatEffect.attack, Vector2(10, 10), const Color(0xFFFF0000),
      );
      expect(system.particles.length, greaterThan(0));
    });

    test('trigger hit adds particles', () {
      final system = ParticleSystem();
      ParticleEffects(system).trigger(
        CombatEffect.hit, Vector2(10, 10), const Color(0xFFFF8800),
      );
      expect(system.particles.length, greaterThan(0));
    });

    test('trigger destroy adds particles', () {
      final system = ParticleSystem();
      ParticleEffects(system).trigger(
        CombatEffect.destroy, Vector2(10, 10), const Color(0xFFFF00FF),
      );
      expect(system.particles.length, greaterThan(0));
    });

    test('clear empties system', () {
      final system = ParticleSystem();
      final effects = ParticleEffects(system);
      effects.trigger(CombatEffect.attack, Vector2(0, 0), const Color(0xFFFFFFFF));
      effects.clear();
      expect(system.particles.isEmpty, isTrue);
    });
  });
}
