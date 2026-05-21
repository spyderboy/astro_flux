// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flame/components.dart' hide Vector;
import 'package:astro_flux/models/particle.dart';

class ParticleComponent extends PositionComponent {
  final Particle particle;

  ParticleComponent({
    required this.particle,
    super.position,
  });

  @override
  void update(double dt) {
    particle.currentLife += dt;
    if (particle.isDead) {
      removeFromParent();
    }
  }

  @override
  void render(Canvas canvas) {
    if (particle.isDead) return;
    final alpha = ((particle.lifeTime - particle.currentLife) / particle.lifeTime).clamp(0.0, 1.0) * 255;
    final paint = Paint()
      ..color = particle.color.withAlpha(alpha.toInt())
      ..blendMode = BlendMode.plus;
    canvas.drawCircle(Offset(particle.position.x, particle.position.y), particle.size / 2, paint);
  }

  ParticleComponent copyWith({
    Particle? particle,
  }) {
    return ParticleComponent(
      particle: particle ?? this.particle,
    );
  }
}