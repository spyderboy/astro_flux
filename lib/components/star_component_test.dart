// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:flame/components.dart' hide Vector;
import 'package:astro_flux/components/star_component.dart';
import 'package:astro_flux/models/star.dart';

void main() {
  test('StarComponent initialises with correct star', () {
    final component = StarComponent(
      star: const Star(id: 1, tier: 2, ownerId: 'player1'),
      position: Vector2(100.0, 100.0),
    );
    expect(component.star.tier, equals(2));
    expect(component.star.ownerId, equals('player1'));
  });

  test('StarComponent position is set correctly', () {
    final component = StarComponent(
      star: const Star(id: 1, tier: 1, ownerId: ''),
      position: Vector2(50.0, 75.0),
    );
    expect(component.position, equals(Vector2(50.0, 75.0)));
  });
}
