// ignore_for_file: depend_on_referenced_packages
import 'package:flame/components.dart';
import 'package:astro_flux/models/attack_particle.dart';
import 'package:astro_flux/components/attack_particle_component.dart';

class ParticleManager extends Component {
  /// Maximum number of live particles allowed at any time.
  static const int maxParticles = 200;

  /// Spawns a new [AttackParticleComponent] at the given [position].
  ///
  /// Returns `true` if the particle was added, or `false` when the
  /// [maxParticles] cap has already been reached.
  bool spawn(AttackParticle particle, Vector2 position) {
    if (children.length >= maxParticles) return false;
    final component = AttackParticleComponent(particle: particle);
    component.position = position.clone();
    add(component);
    return true;
  }
}
