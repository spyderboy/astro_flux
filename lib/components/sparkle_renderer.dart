// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flame/components.dart' as flame;
import 'package:flutter/material.dart' show Color;
import 'package:vector_math/vector_math.dart' as vm;
import 'particle_system.dart';
import 'neon_renderer_config.dart';

/// A mixin that allows Flame components to trigger sparkling particle effects.
/// It searches the component tree for a [ParticleSystemComponent] to delegate rendering.
mixin SparkleRenderer on flame.PositionComponent {
  /// Spawns a brief, small sparkle at the specified [position].
  void spawnSparkle(Offset position, {Color? color, double? radius}) {
    final particleSystemComponent = _findParticleSystem();

    if (particleSystemComponent != null) {
      // Add sparkle effect
      particleSystemComponent.system.spawnSpark(
        vm.Vector2(position.dx, position.dy),
        color: color ?? NeonRendererConfig.attackLineColor,
        radius: radius ?? 2.0,
        velocity: vm.Vector2(0, -50), // Add a slight upward velocity for the sparkle effect
      );
    }
  }

  /// Internal helper to locate the [ParticleSystemComponent] in the component tree.
  flame.ParticleSystemComponent? _findParticleSystem() {
    // Start searching from the parent.
    Component? current = parent;
    while (current != null) {
      if (current is flame.ParticleSystemComponent) {
        return current;
      }
      current = current.parent;
    }
    return null;
  }
}
