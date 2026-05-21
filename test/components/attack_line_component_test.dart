import 'package:flame/game.dart' hide Vector;
import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';

import 'package:astro_flux/components/combat_particle_component.dart';

class AttackLineComponentTest {
  final testRenderer = RenderedElement()
    ..renderedSize = const Size(1920.0, 1080.0);
}

void main() {
  test('AttackLineComponent renders correctly', () {
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