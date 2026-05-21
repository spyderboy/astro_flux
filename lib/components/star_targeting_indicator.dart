// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flame/components.dart';
import 'particle_system.dart';

/// A component that animates a pulsing ring effect around a star
/// while it is being targeted for capture.
class StarTargetingIndicator extends Component {
  final ParticleSystem particleSystem;
  final Vector2 position;
  final Color color;

  StarTargetingIndicator({
    required this.particleSystem,
    required this.position,
    required this.color,
  });

  double _timer = 0;

  @override
  void update(double dt) {
    _timer += dt;
    // Periodically spawn a ring to create a pulsing/expanding effect
    if (_timer >= 0.8) {
      _timer = 0;
      // Use dynamic to bypass the Vector2 version mismatch between
      // vector_math and vector_math_64 caused by inconsistent imports
      // in the dependency tree.
      particleSystem.spawnRing(
        position as dynamic,
        color: color.withAlpha(120),
        radius: 15.0,
        lifetime: 1.0,
      );
    }
  }
}