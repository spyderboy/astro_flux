// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/models/star.dart';

void main() {
  test('Star.copyWith changes only the specified field; all others unchanged', () {
    final originalStar = Star(id: 1, tier: 2, ownerId: 'player1');
    final updatedStar = originalStar.copyWith(tier: 3);

    expect(updatedStar.id, equals(originalStar.id));
    expect(updatedStar.tier, equals(3));
    expect(updatedStar.ownerId, equals(originalStar.ownerId));
  });
}