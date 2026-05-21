// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';
import 'package:flame/components.dart' hide Vector;
import 'package:astro_flux/models/vector.dart';
import 'package:astro_flux/components/vector_component.dart';

void main() {
  test('VectorComponent initialises with correct vector id', () {
    final component = VectorComponent(
      vector: const Vector(id: 1),
      position: Vector2(150.0, 150.0),
    );
    expect(component.vector.id, equals(1));
    expect(component.position, equals(Vector2(150.0, 150.0)));
  });

  test('VectorComponent has correct radius', () {
    final component = VectorComponent(
      vector: const Vector(id: 1),
      position: Vector2(50.0, 50.0),
    );
    expect(component.radius, 16.0);
  });

  test('VectorComponent neon color is correct', () {
    final component = VectorComponent(
      vector: const Vector(id: 1),
      position: Vector2(50.0, 50.0),
    );
    expect(component.neonColor, const Color(0xFF00DDFF));
  });
}
