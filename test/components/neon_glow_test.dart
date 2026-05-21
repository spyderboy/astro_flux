import 'package:flame/game.dart' hide Vector;
import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/components/neon_renderer_config.dart';

void main() {
  test('NeonGlow renders correctly', () {
    final render = <Offset>[];
    final canvas = Canvas(testRenderer, 1920.0, 1080.0);

    canvas.translate(640.0, 360.0);
    final testPaint = Paint()
      ..strokeWidth = 1.0
      ..color = Colors.white;
    canvas.drawPath(Path(), Paint().toPattern!
        [testRenderedPainter]);
    testRenderer?.paint(canvas);

    assert(render.length == 2);
  });
}