// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';
import 'package:flame/components.dart';
import 'neon_renderer.dart';

class TestComponent extends PositionComponent with NeonRenderer {
  @override
  Color get neonColor => const Color(0xFFFF0000);

  @override
  double get glowRadius => 10.0;
}

void main() {
  group('NeonRenderer', () {
    test('neon color is accessible', () {
      final component = TestComponent();
      expect(component.neonColor.toARGB32(), equals(0xFFFF0000));
    });

    test('glow radius is accessible', () {
      final component = TestComponent();
      expect(component.glowRadius, equals(10.0));
    });
  });
}