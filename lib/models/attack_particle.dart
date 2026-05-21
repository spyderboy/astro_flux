// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flutter/material.dart' show Color;
import 'package:flame/components.dart';

class AttackParticle {
  final Vector2 velocity;
  final Color neonColor;
  final double lifetime;
  final BlendMode blendMode;

  const AttackParticle({
    required this.velocity,
    required this.neonColor,
    required this.lifetime,
    this.blendMode = BlendMode.plus,
  });

  factory AttackParticle.fromCollision({
    required Vector2 collisionPoint,
    required Vector2 targetPoint,
    required Color neonColor,
    required double lifetime,
    double magnitude = 100.0,
  }) {
    final velocity = Vector2(
      targetPoint.x - collisionPoint.x,
      targetPoint.y - collisionPoint.y,
    )..normalize()..scale(magnitude);

    return AttackParticle(
      velocity: velocity,
      neonColor: neonColor,
      lifetime: lifetime,
    );
  }
}
