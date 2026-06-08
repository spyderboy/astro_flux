// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/models/vector.dart';

void main() {
  test('Vector.power returns correct value for each tier', () {
    final mote = Vector(id: 1, owner: 'player', tier: 1);
    expect(mote.power, equals(3));

    final vector = Vector(id: 2, owner: 'player', tier: 2);
    expect(vector.power, equals(9));

    final surge = Vector(id: 3, owner: 'player', tier: 3);
    expect(surge.power, equals(27));
  });
}