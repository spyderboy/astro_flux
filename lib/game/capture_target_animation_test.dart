// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flame/flame.dart';
import 'package:flame/components.dart' hide Vector;
import 'package:astro_flux/game/astro_game.dart';
import 'package:astro_flux/components/capture_target_animation.dart';

void main() {
  group('CaptureTargetAnimation', () {
    test('renders matches baseline at 50% keyframe', () async {
      final animation = CaptureTargetAnimation(
        position: Vector2(100, 100),
        color: Colors.red,
        radius: 25.0,
        duration: 1.0,
      );

      animation.progress.value = 0.5;

      // Set up the test environment and render the component to get the image data
      final tester = await liveTest(
        () => GameWidget(game: _TestGame(animation)),
        fileNamePrefix: 'capture_target_animation',
        goldenFileComparator: goldenFileComparator,
      );

      // Compare the rendered image with the baseline
      expect(tester.matchesGoldenFile('baseline_capture_target_animation_50_percent'), true);
    });
  });
}

class _TestGame extends FlameGame {
  final CaptureTargetAnimation animation;

  _TestGame(this.animation) {
    add(animation);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }
}