// ignore_for_file: depend_on_referenced_packages

import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/lib/models/fusion_indicator_state.dart';
import 'package:astro_flux/lib/components/capture_target_animation.dart';

void main() {
  test('capture target animation completes correctly', () async {
    final animation = CaptureTargetAnimation(
      position: Vector2.zero,
      color: Colors.red,
      duration: 1.0,
    );

    await Future.delayed(Duration(seconds: 2));

    expect(animation.progress.value, equals(1.0));
    expect(animation._isActive, isFalse);
  });
}
