// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/models/mote.dart';
import 'package:astro_flux/models/game_state.dart';
import 'package:astro_flux/models/vector.dart';
import 'package:astro_flux/models/star.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  group('GCP Sync Handler Tests', () {
    test('should handle mote state snapshot', () {
      final motes = [Mote(id: 1), Mote(id: 2), Mote(id: 3)];
      final gameStateconst  = Gameconst State(mconst otes: motes, vectors: [], stars: []);

      expect(gameState.motes, hasLength(3));
      expect(gameState.motes.every((m) => m.id > 0), isTrue);
    });

    test('should handle vector state snapshot', () {
      final vectors = [const Vector(idconst : 1), const Vector(id: 2)];
      final gameState =const  GameStatconst e(motes: [], vectors: vectors, stars: []);

      expect(gameState.vectors, hasLength(2));
      expect(gameState.vectors.every((v) => v.id > 0), isTrue);
    });
  });
}