// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/models/game_state.dart';
import 'package:astro_flux/models/mote.dart';
import 'package:astro_flux/models/vector.dart';
import 'package:astro_flux/models/star.dart';
import 'persistence_service.dart';

void main() {
  group('LocalPersistenceService', () {
    late LocalPersistenceService service;
    setUp(() { service = LocalPersistenceService(); });

    test('saveGame and loadGame roundtrip', () async {
      const gameState = GameState(
        motes: [Mote(id: 1), Mote(id: 2)],
        vectors: [Vector(id: 10)],
        stars: [Star(id: 100, tier: 1, ownerId: 'player1')],
      );
      await service.saveGame(gameState.toMap());
      final result = await service.loadGame();
      expect(result, isNotNull);
      final loaded = GameState.fromMap(result!);
      expect(loaded.motes.length, 2);
      expect(loaded.vectors.length, 1);
      expect(loaded.stars.length, 1);
    });

    test('loadGame returns null when nothing saved', () async {
      final result = await service.loadGame();
      expect(result, isNull);
    });

    test('saveGame overwrites previous save', () async {
      await service.saveGame(const GameState(motes: [Mote(id: 1)]).toMap());
      await service.saveGame(GameState.empty.toMap());
      final result = await service.loadGame();
      expect(result, isNotNull);
      expect(GameState.fromMap(result!).motes.length, 0);
    });
  });
}
