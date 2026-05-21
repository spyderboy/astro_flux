import 'package:flame/game.dart' hide Vector;
import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/components/neon_renderer_config.dart';

void main() {
  test('NeonRendererConfig glow color is correct', () {
    expect(
      NeonRendererConfig.glowColor,
      const Color(0xFF00FF00),
    );
  });

  test('NeonRendererConfig blend mode is plus', () {
    expect(
      NeonRendererConfig.blendMode,
      BlendMode.plus,
    );
  });
}