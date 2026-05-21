// ignore_for_file: depend_on_referenced_packages
import 'dart:math' as math;
import 'dart:ui';
import 'package:flame/components.dart' hide Vector;
import 'package:astro_flux/components/particle_component.dart';
import 'package:astro_flux/models/particle.dart';

class ParticleSystem extends Component {
  final List<ParticleComponent> _particles = [];
  ParticleSystem();

  List<ParticleComponent> get particles => List.unmodifiable(_particles);

  void spawnBurst(Vector2 position, Color color, {int count = 10}) {
    final random = math.Random();
    for (var i = 0; i < count; i++) {
      final angle = (i / count) * 2 * math.pi;
      final speed = 50.0 + (random.nextDouble() * 50.0);
      final velocity = Vector2(
          (math.cos(angle) * speed),
          (math.sin(angle) * speed),
          );
      final size = 2.0 + (random.nextDouble() * 4.0);
      final particle = Particle(
        position: Vector2(position.x, position.y),
        velocity: velocity,
        color: color,
        lifeTime: 0.5 + (random.nextDouble() * 0.5),
        size: size,
        type: ParticleType.burst,
        );
      addParticle(particle);
      }
     }

  void spawnTrail(Vector2 position, Vector2 velocity, Color color) {
    final particle = Particle(
      position: Vector2(position.x, position.y),
      velocity: Vector2(velocity.x * 0.9, velocity.y * 0.9),
      color: color,
      lifeTime: 1.0,
      size: 3.0,
      type: ParticleType.trail,
      );
    addParticle(particle);
     }

  List<ParticleComponent> get activeParticles =>
      List.unmodifiable(_particles.where((p) => !p.particle.isDead));

  void spawnSpark(Vector2 position, Color color) {
    final particle = Particle(
      position: Vector2(position.x, position.y),
      velocity: Vector2.zero(),
      color: color,
      lifeTime: 0.3,
      size: 2.0,
      type: ParticleType.spark,
    );
    addParticle(particle);
  }

  void addParticle(Particle particle) {
    final component = ParticleComponent(particle: particle);
    _particles.add(component);
     }

  @override
  void update(double dt) {
    _particles.removeWhere((p) => p.particle.isDead);
    for (final particle in _particles) {
      particle.update(dt);
      }
     }

  void clear() {
    _particles.clear();
     }
}