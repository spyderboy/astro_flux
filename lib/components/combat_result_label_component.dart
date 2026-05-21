// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flame/components.dart';

class CombatResultLabelComponent extends PositionComponent {
  final String text;
  final Color color;
  late TextPaint _textPaint;

  CombatResultLabelComponent({
    required this.text,
    required this.color,
    Vector2? initialPosition,
  }) : super(position: initialPosition ?? Vector2.zero());

  @override
  Future<void> onLoad() async {
    _textPaint = TextPaint(
      style: TextStyle(
        color: color,
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  void render(Canvas canvas) {
    final offset = position.toOffset();
    _textPaint.render(canvas, text, offset);
  }
}