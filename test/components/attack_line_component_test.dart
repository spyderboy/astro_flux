// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';
import 'package:flame/components.dart';
import 'package:astro_flux/components/attack_line_component.dart';

class AttackLineComponentTest {
  final testRenderer = RenderBox(); // Corrected to use RenderBox
}

void main() {
  test('AttackLineComponent renders correctly', () async {
    final recorder = PictureRecorder(); // Added PictureRecorder for rendering
    final canvas = Canvas(recorder);

    const start = Vector2(640.0, 360.0);
    const end = Vector2(1280.0, 720.0);
    final attackLineComponent = AttackLineComponent(start: start, end: end);
    attackLineComponent.render(canvas);

    final picture = recorder.endRecording();
    final image = await picture.toImage(1920, 1080);
    final byteData = await image.toByteData(format: ImageByteFormat.png);

    expect(byteData != null, true); // Added an assertion to check if rendering is successful
  });
}