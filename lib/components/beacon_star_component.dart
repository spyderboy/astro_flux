// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flame/components.dart';

/// A component that renders a pulsing aura ring at radius ±8px at 1Hz.
class BeaconStarComponent extends PositionComponent {
  static const double _auraRadius = 8.0;
  static const Duration _pulseInterval = Duration(seconds: 1);
  static const Color _auraColor = Color(0xFF00FFFF);

  late Timer _timer;
  bool _isPulsing = true;

  @override
color(Color color) {
    // Placeholder for potential color customization if needed.
  }

  @override
  void onMount() {
    super.onMount();
    _startPulseTimer();
  }

  void _startPulseTimer() {
    _timer = Timer.periodic(_pulseInterval, (Timer timer) {
      _isPulsing = !_isPulsing;
      update();
    });
  }

  @override
  void onRemove() {
    super.onRemove();
    _timer.cancel();
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()
      ..color = _auraColor.withAlpha(_isPulsing ? 128 : 64)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..blendMode = BlendMode.plus;

    canvas.drawCircle(position.toOffset(), _auraRadius, paint);
  }
}