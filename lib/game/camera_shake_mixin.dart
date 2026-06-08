// ignore_for_file: depend_on_referenced_packages
import 'package:flame/components.dart';
import 'dart:math';

class CameraShakeMixin {
  double _shakeIntensity = 0.0;
  double _shakeDuration = 0.0;

  void startShake(double intensity, double duration) {
    _shakeIntensity = intensity;
    _shakeDuration = duration;
  }

  void update(double dt) {
    if (_shakeDuration > 0) {
      final randomOffsetX = Random().nextDouble() * _shakeIntensity * 2 - _shakeIntensity;
      final randomOffsetY = Random().nextDouble() * _shakeIntensity * 2 - _shakeIntensity;
      // applyOffset(randomOffsetX, randomOffsetY);
      _shakeDuration -= dt;
    }
  }
}