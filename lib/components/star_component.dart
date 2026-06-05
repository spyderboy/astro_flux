// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StarComponent extends PositionComponent with TapCallbacks, DragCallbacks {
  final int id;
  late double _productionTimer;
  late double _captureFlashElapsed;
  late TextPainter _tierTextPainter;
  late AnimationController _animationController;
  late Animation<double> _glowRadiusAnimation;

  StarComponent({required this.id, required super.position}) : _productionTimer = 0.0, _captureFlashElapsed = 0.0 {
    _initTierTextPainter();
    _setupGlowAnimation();
  }

  void _initTierTextPainter() {
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 12.0,
    );
    _tierTextPainter = TextPainter(
      text: TextSpan(text: '1', style: textStyle),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    )..layout();
  }

  void _setupGlowAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _glowRadiusAnimation = Tween<double>(begin: 18, end: 26).animate(_animationController);
    _animationController.repeat(reverse: true);
  }

  @override
  Future<void> onLoad() async {
    size = Vector2(32.0, 32.0); // Example size
  }

  void capture() {
    _captureFlashElapsed = 0.4;
    _animationController.forward();
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (ownerId.isNotEmpty) {
      _productionTimer += dt;
      if (_productionTimer >= 5.0) {
        _productionTimer = 0.0; // Reset timer after a full cycle
      }
    }
    if (_captureFlashElapsed > 0) {
      _captureFlashElapsed -= dt;
    }
    _updateTierTextPainter();
  }

  void _updateTierTextPainter() {
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 12.0,
    );
    _tierTextPainter.text = TextSpan(text: tier.toString(), style: textStyle);
    _tierTextPainter.layout();
  }

  @override
  void render(Canvas canvas) {
    final Paint paint = Paint()
      ..color = ownerId == 'player' ? const Color(0xFF00DDFF) : (ownerId == 'enemy' ? const Color(0xFFFF3366) : const Color(0xFF888888));

    // Draw the filled circle
    canvas.drawCircle(position.toOffset(), 18, paint);

    // Draw the outer glow ring
    final Paint glowPaint = Paint()
      ..color = Colors.white.withAlpha(64)
      ..blendMode = BlendMode.plus;
    canvas.drawCircle(position.toOffset(), _glowRadiusAnimation.value, glowPaint);

    if (ownerId.isNotEmpty) {
      // Draw production timer ring
      final double sweepAngle = (_productionTimer / 5.0).clamp(0, 1) * 2 * 3.14159;

      final Paint arcPaint = Paint()
        ..color = ownerId == 'player' ? const Color(0xFF00DDFF).withAlpha(102) : (ownerId == 'enemy' ? const Color(0xFFFF3366).withAlpha(102) : Colors.white.withAlpha(102))
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke;

      canvas.drawArc(
        Rect.fromCircle(center: position.toOffset(), radius: 25),
        -1.5 * 3.14159,
        sweepAngle,
        false,
        arcPaint,
      );
    }
  }
}
