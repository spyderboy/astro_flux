// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flame/components.dart' hide Vector;
import 'particle_system.dart';

enum CombatEffect { attack, hit, destroy, heal } 
class ParticleEffects {
  final ParticleSystem system;

  ParticleEffects(this.system);

  void trigger(CombatEffect effect, Vector2 position, Color color) {
    switch (effect) {
      case CombatEffect.attack:        system.spawnBurst(position, color, count: 5);        system.spawnTrail(position, Vector2(100.0, 0.0), color);        break;
      case CombatEffect.hit:          system.spawnBurst(position, color, count: 8);        system.spawnTrail(position, Vector2(50.0, 50.0), color);        break;
      case CombatEffect.destroy:      system.spawnBurst(position, color, count: 15);       system.spawnTrail(position, Vector2(80.0, -80.0), color);       break;
      case CombatEffect.heal:         system.spawnBurst(position, color, count: 6);        system.spawnTrail(position, Vector2(0.0, -100.0), color);        break;
    }
  }

  void clear() {
    system.clear();
  }
}