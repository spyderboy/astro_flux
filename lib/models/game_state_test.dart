// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'game_state.dart';
import 'mote.dart';
import 'vector.dart';
import 'star.dart';

void main() {
  test('GameState creates with empty collections', () {
    const state = GameState();
    expect(state.motes.isEmpty, true);
    expect(state.vectors.isEmpty, true);
    expect(state.stars.isEmpty, true);
  });

  test('GameState.empty is an empty state', () {
    expect(GameState.empty.motes.isEmpty, true);
    expect(GameState.empty.vectors.isEmpty, true);
    expect(GameState.empty.stars.isEmpty, true);
  });

  test('GameState toMap and fromMap roundtrip', () {
    const state = GameState(
      motes: [Mote(id: 1), Mote(id: 2)],
      vectors: [Vector(id: 3)],
      stars: [Star(id: 4, tier: 1, ownerId: 'player')],
    );

    final map = state.toMap();
    final restored = GameState.fromMap(map);

    expect(restored.motes.length, 2);
    expect(restored.vectors.length, 1);
    expect(restored.stars.length, 1);
    expect(restored.motes.first.id, 1);
    expect(restored.stars.first.ownerId, 'player');
  });

  test('GameState copyWith replaces specified collections', () {
    const state = GameState(motes: [Mote(id: 1)]);
    final updated = state.copyWith(vectors: const [Vector(id: 2)]);

    expect(updated.motes.length, 1);
    expect(updated.vectors.length, 1);
    expect(updated.vectors.first.id, 2);
    expect(updated.stars.isEmpty, true);
  });

  test('GameState copyWith with no args returns equivalent state', () {
    const state = GameState(motes: [Mote(id: 1)]);
    final copy = state.copyWith();
    expect(copy.motes.length, state.motes.length);
  });
}
