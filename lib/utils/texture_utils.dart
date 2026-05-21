// ignore_for_file: depend_on_referenced_packages
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class TextureUtils {
  /// Creates a canvas-based texture for star particle backgrounds.
  static Future<ui.Image> loadStarTexture({
    required Color color,
    required double radius,
    required double sigma,
  }) async {
    final double diameter = (radius * 2).ceilToDouble();
    final int width = diameter.toInt() < 1 ? 1 : diameter.toInt();
    final int height = diameter.toInt() < 1 ? 1 : diameter.toInt();

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final Offset center = Offset(radius, radius);
    final Rect rect = Rect.fromLTWH(0, 0, width.toDouble(), height.toDouble());

    final paint = Paint()
      ..shader = RadialGradient(
        colors: [color.withAlpha(150), Colors.transparent],
        sigma: sigma,
      ).createShader(rect);

    canvas.drawCircle(center, radius, paint);

    final picture = recorder.endRecording();
    return await picture.toImage(width, height);
  }
}