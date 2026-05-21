// ignore_for_file: depend_on_referenced_packages
import 'package:flame/components.dart';
import 'package:flutter/material.dart' show Color;
import 'package:vector_math/vector_math_64.dart' as vm;
import 'particle_system.dart';

/// A component that visualizes a fusion explosion using particles.
class FusionExplosionComponent extends PositionComponent {
  final double duration = 0.6;
  double _elapsed = 0;

  @override
  void update(double dt) {
    _elapsed += dt;
    if (_elapsed >= duration) {
      removeFromParent();
      return;
    }

    final system = _findParticleSystem();
    if (system != null) {
      // Spawn outward sparks
      for (int i = 0; i < 16; i++) {
        double angle = 2 * pi * i / 16;
        Vector2 velocity = Vector2(cos(angle), sin(angle))..scale(3.0);
        system.spawnSpark(
          position + velocity * 5,
          color: GamePalette.cyan, // Use neon palette color from lib/models/game_palette.dart
          radius: 3.0,
          lifetime: 0.5,
        );
      }
      // Spawn an expansion ring
      system.spawnRing(
        position,
        color: GamePalette.magenta, // Use neon palette color from lib/models/game_palette.dart
        radius: 15.0,
        lifetime: 0.4,
      );
    }
  }

  ParticleSystem? _findParticleSystem() {
    Component? current = parent;
    while (current != null) {
      if (current is ParticleSystemComponent) {
        return current.system;
      }
      current = current.parent;
    }
    return null;
  }
}
