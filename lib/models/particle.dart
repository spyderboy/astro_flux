// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:vector_math/vector_math.dart';

enum ParticleType {
  spark,
  burst,
  trail,
}

class Particle {
  Vector2 position;
  final Vector2 velocity;
  final Color color;
  final double lifeTime;
  double currentLife;
  final double size;
  final ParticleType type;

  Particle({
    required this.position,
    required this.velocity,
    required this.color,
    required this.lifeTime,
    this.currentLife = 0.0,
    this.size = 2.0,
    this.type = ParticleType.spark,
  });

  double get progress => lifeTime > 0 ? currentLife / lifeTime : 1.0;
  bool get isDead => currentLife >= lifeTime;

  Particle copyWith({
    Vector2? position,
    Vector2? velocity,
    Color? color,
    double? lifeTime,
    double? currentLife,
    double? size,
    ParticleType? type,
  }) {
    return Particle(
      position: position ?? this.position,
      velocity: velocity ?? this.velocity,
      color: color ?? this.color,
      lifeTime: lifeTime ?? this.lifeTime,
      currentLife: currentLife ?? this.currentLife,
      size: size ?? this.size,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'position': '${position.x} ${position.y}',
      'velocity': '${velocity.x} ${velocity.y}',
      'color': color.toARGB32(),
      'lifeTime': lifeTime,
      'currentLife': currentLife,
      'size': size,
      'type': type.index,
    };
  }

  factory Particle.fromMap(Map<String, dynamic> map) {
    return Particle(
      position: Vector2(
        double.parse(map['position']!.split(' ').first),
        double.parse(map['position']!.split(' ').last),
      ),
      velocity: Vector2(
        double.parse(map['velocity']!.split(' ').first),
        double.parse(map['velocity']!.split(' ').last),
      ),
      color: Color(map['color'] as int),
      lifeTime: map['lifeTime'] as double,
      currentLife: map['currentLife'] as double,
      size: map['size'] as double,
      type: ParticleType.values[map['type'] as int],
    );
  }
}