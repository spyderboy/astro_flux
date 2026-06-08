// ignore_for_file: depend_on_referenced_packages
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/vector.dart';
import '../components/flux_particle_component.dart';
import '../models/game_state_provider.dart';

import 'package:flame/components.dart' hide Vector;

class UnitCombatResolver {
  Ref ref;
  int _particleCount = 0;

  UnitCombatResolver(this.ref);

  void tick(double dt) {
    final playerVectors = ref.read(gameServiceProvider.notifier).vectors.where((v) => v.owner == 'player').toList();
    final enemyVectors = ref.read(gameServiceProvider.notifier).vectors.where((v) => v.owner != 'player').toList();

    for (final playerVector in playerVectors) {
      for (final enemyVector in enemyVectors) {
        final distance = (playerVector.position - enemyVector.position).length;
        final collisionRadius = min(playerVector.collisionRadius, enemyVector.collisionRadius);

        if (distance <= collisionRadius) {
          applyDamage(playerVector.id, enemyVector.power);
          applyDamage(enemyVector.id, playerVector.power);

          // Spawn combat sparks on impact
          for (int i = 0; i < 2; i++) {
            final angle = Random().nextDouble() * 2 * pi;
            final velocity = Vector2(cos(angle), sin(angle)) * 100.0;
            ref.read(gameServiceProvider.notifier).addParticle(FluxParticleComponent(position: playerVector.position, velocity: velocity));
          }
        }
      }
    }
  }

  void applyDamage(int vectorId, int damage) {
    final vector = ref.read(gameServiceProvider.notifier).vectors.firstWhere((v) => v.id == vectorId);
    if (vector.shieldHp > 0) {
      final newShieldHp = max(vector.shieldHp - damage, 0);
      ref.read(gameServiceProvider.notifier).damageVector(vectorId, newShieldHp);
      if (newShieldHp == 0) {
        final liveDamage = max(damage - vector.shieldHp, 0);
        ref.read(gameServiceProvider.notifier).damageVector(vectorId, liveDamage);
      }
    } else {
      final remainingHealth = max(vector.currentHealth - damage, 0);
      ref.read(gameServiceProvider.notifier).damageVector(vectorId, remainingHealth);
    }

    if (!vector.isAlive) {
      _destroyUnit(vector);
    }
  }

  void _destroyUnit(Vector vector) {
    for (int i = 0; i < 4; i++) {
      if (_particleCount >= 40) continue;
      final angle = i * pi / 2; // Spread velocities evenly around 360 degrees
      final velocity = Vector2(cos(angle), sin(angle)) * 100.0;
      ref.read(gameServiceProvider.notifier).addParticle(FluxParticleComponent(position: vector.position, velocity: velocity));
      _particleCount++;
    }

    // Remove the unit from the game world and update the state
    vector.removeFromParent();
    ref.read(gameServiceProvider.notifier).removeVector(vector.id);
  }
}
