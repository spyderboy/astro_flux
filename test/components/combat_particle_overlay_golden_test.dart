// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flame/game.dart' hide Vector;
import 'package:astro_flux/components/combat_particle_overlay.dart';
import 'package:vector_math/vector_math.dart';

/// A test game specifically for verifying the visual properties of [CombatParticleOverlay].
class CombatParticleOverlayGoldenTestGame extends FlameGame {
  late CombatParticleOverlay overlay;

  @override
  Future<void> onLoad() async {
    overlay = CombatParticleOverlay(
      particles: [
        AttackParticle.fromCollision(
          collisionPoint: Vector2(100, 100),
          targetPoint: Vector2(200, 200),
          neonColor: Color(0xFFFFFFFF), // White for contrast
          lifetime: 1.5,
        ),
      ],
    );
    add(overlay);
  }
}

void main() {
  testWidgets('CombatParticleOverlay golden test', (WidgetTester tester) async {
    final game = CombatParticleOverlayGoldenTestGame();

    await tester.pumpWidget(
      GameWidget(game: game),
    );

    // Keyframe 1: Initial state (t = 0.0)
    await expectLater( find.byType(GameWidget), matchesGoldenFile('goldens/combat_particle_overlay_start.png'), );

    // Keyframe 2: First particle emitted and fading (t = 0.5s)
    await tester.pump(const Duration(milliseconds: 500));
    await expectLater( find.byType(GameWidget), matchesGoldenFile('goldens/combat_particle_overlay_first_fading.png'), );

    // Keyframe 3: All particles faded out (t = 1.0s)
    await tester.pump(const Duration(milliseconds: 500));
    await expectLater( find.byType(GameWidget), matchesGoldenFile('goldens/combat_particle_overlay_all_faded.png'), );

    // Keyframe 4: End of life (t = 1.2s)
    await tester.pump(const Duration(milliseconds: 200));
    expect(game.children.whereType<CombatParticleOverlay>().isEmpty, isTrue);
  });
}
