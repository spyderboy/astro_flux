// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flame/components.dart';
import 'package:astro_flux/models/vector.dart' as model;
import 'package:astro_flux/game/particle_system.dart';

enum CombatEffect {
  attack,
  hit,
  destroy,
  heal,
}

// Alias so tests can refer to ParticleType.attack etc. via this file's import.
typedef ParticleType = CombatEffect;

class CombatParticleComponent extends PositionComponent {
  final model.Vector sourceVector;
  final model.Vector targetVector;
  final CombatEffect particleType;
  final Vector2 startPos;
  final Vector2 endPos;
  final Color color;
  final double duration;
  final ParticleSystem? particleSystem;

  double _elapsed = 0.0;
  late Vector2 _currentPos;

  CombatParticleComponent({
    required this.sourceVector,
    required this.targetVector,
    required this.particleType,
    required this.startPos,
    required this.endPos,
    required this.color,
    required this.duration,
    this.particleSystem,
      }) : super(position: Vector2(startPos.x, startPos.y));

  @override
  void render(Canvas canvas) {
    final paint = Paint()
         ..color = color.withAlpha(180)
         ..blendMode = BlendMode.plus
         ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    canvas.drawCircle(_currentPos.toOffset(), 4.0, paint);
      }

  @override
  void update(double dt) {
      _elapsed += dt;
    if (_elapsed >= duration) {
      removeFromParent();
      return;
        }

      final progress = _elapsed / duration;
      _currentPos = Vector2(
           startPos.x + (endPos.x - startPos.x) * progress,
           startPos.y + (endPos.y - startPos.y) * progress,
           );
      }

  void triggerEffect() {
    final ps = particleSystem;
    if (ps == null) return;
    switch (particleType) {
      case CombatEffect.attack:
        ps.spawnBurst(startPos, color, count: 5);
        ps.spawnTrail(startPos, Vector2(100.0, 0.0), color);
        break;
      case CombatEffect.hit:
        ps.spawnBurst(startPos, color, count: 8);
        ps.spawnTrail(startPos, Vector2(50.0, 50.0), color);
        break;
      case CombatEffect.destroy:
        ps.spawnBurst(startPos, color, count: 15);
        ps.spawnTrail(startPos, Vector2(80.0, -80.0), color);
        break;
      case CombatEffect.heal:
        ps.spawnBurst(startPos, color, count: 6);
        ps.spawnTrail(startPos, Vector2(0.0, -100.0), color);
        break;
    }
  }
}
