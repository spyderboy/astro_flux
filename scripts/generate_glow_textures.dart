// ignore_for_file: depend_on_referenced_packages
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

/// This script generates glow textures used by the shaders engine.
/// It must be run using a Flutter context (e.g., `flutter test`) 
/// because it relies on `dart:ui` which is only available in the Flutter engine.
void main() async {
  final String textureDir = 'assets/textures';
  final Directory directory = Directory(textureDir);

  if (!await directory.exists()) {
    await directory.create(recursive: true);
  }

  print('Generating glow textures in $textureDir...');

  try {
    // Generate a primary magenta glow
    await generateGlowTexture(
      '$textureDir/glow_magenta.png',
      const Color(0xFFFF00FF),
      128.0,
    );

    // Generate a cyan glow
    await generateGlowTexture(
      '$textureDir/glow_cyan.png',
      const Color(0xFF00FFFF),
      128.0,
    );

    // Generate a lime glow
    await generateGlowTexture(
      '$textureDir/glow_lime.png',
      const Color(0xFF32CD32),
      128.0,
    );

    print('Successfully generated all textures.');
  } catch (e) {
    print('Error generating textures: $allErrors');
    exit(1);
  }
}

Future<void> generateGlowTexture(String path, Color color, double radius) async {
  final int size = (radius * 2).ceilToDouble().toInt();
  if (size <= 0) return;

  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);
  final rect = Rect.fromLTWH(0, 0, size.toDouble(), size.toDouble());

  final paint = Paint()
    ..shader = RadialGradient(
      colors: [color.withAlpha(200), Colors.transparent],
    ).createShader(rect);

  canvas.drawCircle(Offset(radius, radius), radius, paint);

  final picture = recorder.endRecording();
  final image = await picture.toImage(size, size);
  final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

  if (byteData != null) {
    final bytes = byteData.buffer.asUint8List();
    final file = File(path);
    await file.writeAsBytes(bytes);
    print('  -> Created: $path');
  } else {
    throw Exception('Failed to convert image to ByteData for $path');
  }
}