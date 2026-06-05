// ignore_for_file: depend_on_referenced_packages
import 'package:flame/components.dart';
import 'dart:math';

mixin CameraShakeMixin on PositionComponent {
  double _intensity = 0.0;
  double _decayFactor = 0.0;
  double _elapsedTime = 0.0;
  late Function(double, double) applyOffset;

  void startShake(double intensity) {
    _intensity = intensity;
    _decayFactor = (1.0 / 0.3);
    _elapsedTime = 0.0;
  }

  @override
  void update(double dt) {
    if (_elapsedTime < 0.3) {
      final randomOffsetX = Random().nextDouble() * _intensity * 2 - _intensity;
      final randomOffsetY = Random().nextDouble() * _intensity * 2 - _intensity;
      applyOffset(randomOffsetX, randomOffsetY);
      _elapsedTime += dt;
    } else {
      // Reset shake effect
      _intensity = 0.0;
      _decayFactor = 0.0;
      _elapsedTime = 0.0;
    }
  }
}
