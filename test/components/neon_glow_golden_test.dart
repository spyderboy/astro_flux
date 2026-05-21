// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flame/components.dart' hide Vector;
import 'package:flame/game.dart' hide Vector;
import 'package:astro_flux/components/neon_renderer.dart';
import 'package:astro_flux/components/neon_renderer_config.dart';

/// A component that simulates the visual appearance of a mote's neon glow.
/// It renders a series of glowing points to represent the mote.
class MoteNeonGlowTestComponent extends PositionComponent with NeonRenderer {
  @override
  double get glowRadius => 12.0;

  @override
  Color get neonColor => NeonRendererConfig.moteGlowColor;

  @override
  void render(Canvas canvas) {
    final paint = Paint()
      ..color = neonColor
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, glowRadius)
      ..blendMode = BlendMode.plus; // Use additive blending for neon effects

    // Simulate the mote's glow using a series of glowing points.
    canvas.drawCircle(position.toOffset(), 2.0, paint);
  }
}

class NeonGlowTestGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    add(MoteNeonGlowTestComponent()
      ..position = Vector2(50, 50));
  }
}

void main() {
  testWidgets('Mote neon glow rendering quality verification', (WidgetTester tester) async {
    final game = NeonGlowTestGame();
    await tester.pumpWidget(
      GameWidget(game: game),
    );
    // Allow time for the component to initialize and render
    await tester.pumpAndSettle();
    // Golden test for neon glow aesthetic of the mote
    await expectLater(
      find.byType(GameWidget),
      matchesGoldenFile('goldens/mote_neon_glow_test.png'),
    );
  });
}
