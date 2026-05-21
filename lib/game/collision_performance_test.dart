// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/models/vector.dart';
import 'package:flame/game.dart' hide Vector;
import 'package:flame/components.dart';
import 'package:astro_flux/game/collision_manager.dart';

void main() {
  test('100 simultaneous collision checks complete under 16ms', () async {
    final game = Game();
    await game.initialize()
      ..update(0) // Initialize and update the game to set up the world
      ..update(0);

    final collisionManager = CollisionManager(game);
    final stopwatch = Stopwatch()..start();

    for (int i = 0; i < 100; i++) {
      final vector = Vector(i.toDouble(), i.toDouble());
      final star = Star(i, 1, 'player');
      final event = CombatAttackEvent(sourceVectorId: i, targetStarId: i);

      // Simulate collision check
      collisionManager.handleCollision(event);
    }

    stopwatch.stop();
    expect(stopwatch.elapsedMicroseconds / 1000, lessThan(16));
  });
}