// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flame/components.dart';
import 'particle_system.dart';

/// A component that renders a targeting indicator with particle effects.
class StarTargetingIndicator extends Component {
  final ParticleSystem particleSystem;
  final Vector2 position;
  final Color color;

  StarTargetingIndicator({
    required this.particleSystem,
    required this.position,
    required this.color,
  });

  static const double _ringSpawnInterval = 0.8;
  static const double _ringRadius = 15.0;
  static const double _ringLifetime = 1.0;

  double _timer = 0;

  @override
  void update(double dt) {
    _timer += dt;
    // Periodically spawn a ring to create a pulsing/expanding effect
    if (_timer >= _ringSpawnInterval) {
      _timer = 0;
      particleSystem.spawnRing(
        position,
        color: color.withAlpha(120),
        radius: _ringRadius,
        lifetime: _ringLifetime,
      );
    }
  }
}