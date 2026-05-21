// ignore_for_file: depend_on_referenced_packages
import 'dart:math';
import 'dart:ui';
import 'package:flame/components.dart';
import 'package:vector_math/vector_math_64.dart' as vm;

/// Represents a single particle in the system.
class Particle {
  final vm.Vector2 position;
  final vm.Vector2 velocity;
  final Color color;
  final double radius;
  final double lifetime;
  double age;
  final bool isRing;
  final double strokeWidth;

  Particle({
    required this.position,
    required this.velocity,
    required this.color,
    required this.radius,
    required this.lifetime,
    required this.age,
    required this.isRing,
    this.strokeWidth = 1.0,
  });
}

/// A particle system manager that can be used both in tests and as a Flame Component.
class ParticleSystem {
  final List<Particle> _particles = [];
  final int maxParticles;

  ParticleSystem({this.maxParticles = 200});

  /// Returns a view of active particles.
  List<Particle> get activeParticles => _particles;

  /// Spawns a spark at the given [position] with optional [color] and
  /// [radius].
  void spawnSpark(vm.Vector2 position,
      {Color? color, double? radius, vm.Vector2? velocity, double? lifetime}) {
    if (_particles.length >= maxParticles) return;

    final random = Random();
    _particles.add(
      Particle(
        position: position.clone(),
        velocity: velocity ?? vm.Vector2(
          (random.nextDouble() * 2 - 1) * 50,
          (random.nextDouble() * 2 - 1) * 50,
        ),
        color: color ?? const Color(0xFFFF00FF),
        radius: radius ?? 5.0,
        lifetime: lifetime ?? 1.0,
        age: 0.0,
        isRing: false,
      ),
    );
  }

  /// Spawns a ring-shaped particle for hit indicators.
  void spawnRing(vm.Vector2 position,
      {Color? color, double? radius, double? lifetime}) {
    if (_particles.length >= maxParticles) return;

    _particles.add(
      Particle(
        position: position.clone(),
        velocity: vm.Vector2.zero(),
        color: color ?? const Color(0xFF00FFFF),
        radius: radius ?? 20.0,
        lifetime: lifetime ?? 0.5,
        age: 0.0,
        isRing: true,
        strokeWidth: 3.0,
      ),
    );
  }

  /// Updates all particles. Should be updated in the game loop.
  void update(double dt) {
    for (int i = _particles.length - 1; i >= 0; i--) {
      final p = _particles[i];
      p.age += dt;
      if (p.age >= p.lifetime) {
        _particles.removeAt(i);
        continue;
      }
      p.position.add(p.velocity * dt);
    }
  }
}

/// A Flame Component that manages and renders particles using a [ParticleSystem].
class ParticleSystemComponent extends Component {
  final ParticleSystem system;
  final BlendMode blendMode;

  ParticleSystemComponent(this.system, {this.blendMode = BlendMode.plus});

  @override
  void update(double dt) {
    system.update(dt);
  }

  @override
  void render(Canvas canvas) {
    final particles = system.activeParticles;
    for (final p in particles) {
      final progress = (p.age / p.lifetime).clamp(0.0, 1.0);
      final opacity = (1.0 - progress).clamp(0.0, 1.0);

      final paint = Paint()
        ..color = p.color.withAlpha((opacity * 255).toInt())
        ..strokeWidth = p.isRing ? p.strokeWidth : 0.0
        ..style = p.isRing ? PaintingStyle.stroke : PaintingStyle.fill
        ..maskFilter = p.isRing ? const MaskFilter.blur(BlurStyle.normal, 2.0) : null
        ..blendMode = blendMode;

      canvas.drawCircle(
        Offset(p.position.x, p.position.y),
        p.radius,
        paint,
      );
    }
  }
}