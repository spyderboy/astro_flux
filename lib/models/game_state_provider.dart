// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/game_state.dart';
import '../models/mote.dart';
import '../models/vector.dart';
import '../models/star.dart';
import '../systems/persistence_service.dart';

/// Riverpod 3.x — uses Notifier<T> + NotifierProvider.
///
/// ⚠️  StateNotifier and StateNotifierProvider are REMOVED in Riverpod 3.x.
///     Always use Notifier<T> / NotifierProvider instead.
///
/// ⚠️  Never access notifier.state directly from outside this class.
///     Read state via: ref.read(gameServiceProvider)
///     Mutate via:     ref.read(gameServiceProvider.notifier).someMethod()
class GameStateNotifier extends Notifier<GameState> {
  final PersistenceService _persistenceService;
  int _nextMoteId = 0;
  int _nextVectorId = 0;
  int _nextStarId = 0;

  GameStateNotifier(this._persistenceService);

  @override
  GameState build() => GameState.empty;

  // Accessors
  List<Mote> get motes => state.motes;
  List<Vector> get vectors => state.vectors;
  List<Star> get stars => state.stars;

  // Mutations (each replaces state immutably)
  void addMote(int id) {
    _nextMoteId = id > _nextMoteId ? id + 1 : _nextMoteId + 1;
    state = state.copyWith(motes: [...state.motes, Mote(id: id)]);
  }

  void addVector(int id, {String owner = 'player', int tier = 1}) {
    _nextVectorId = id > _nextVectorId ? id + 1 : _nextVectorId + 1;
    state = state.copyWith(
      vectors: [...state.vectors, Vector(id: id, owner: owner, tier: tier)],
    );
  }

  /// Apply [amount] damage to the vector with [id].
  /// Caller must compute all damage values before calling this for any unit
  /// (simultaneous-damage rule — neither death should reduce the other's damage).
  void damageVector(int id, int amount) {
    state = state.copyWith(
      vectors: state.vectors.map((v) {
        if (v.id != id) return v;
        return v.copyWith(currentHealth: (v.currentHealth - amount).clamp(0, v.maxHealth));
      }).toList(),
    );
  }

  /// Spawn a Tier-3 surge unit (power=9, hp=25) for [owner].
  /// AstroGame is responsible for creating the Flame VectorComponent at the world position.
  void spawnSurge(int id, {String owner = 'player'}) {
    _nextVectorId = id > _nextVectorId ? id + 1 : _nextVectorId + 1;
    state = state.copyWith(
      vectors: [...state.vectors, Vector(id: id, owner: owner, tier: 3)],
    );
  }

  void addStar(int id, int tier) {
    _nextStarId = id > _nextStarId ? id + 1 : _nextStarId + 1;
    state = state.copyWith(stars: [...state.stars, Star(id: id, tier: tier, ownerId: '')]);
  }

  void removeMote(int id) {
    state = state.copyWith(motes: state.motes.where((m) => m.id != id).toList());
  }

  void removeVector(int id) {
    state = state.copyWith(vectors: state.vectors.where((v) => v.id != id).toList());
  }

  void removeStar(int id) {
    state = state.copyWith(stars: state.stars.where((s) => s.id != id).toList());
  }

  void updateStar(int id, int tier) {
    final updated = state.stars.map((s) => s.id == id ? Star(id: id, tier: tier, ownerId: s.ownerId) : s).toList();
    state = state.copyWith(stars: updated);
  }

  void captureStar(int id, String ownerId) {
    final updated = state.stars.map((s) => s.id == id ? Star(id: id, tier: s.tier, ownerId: ownerId) : s).toList();
    state = state.copyWith(stars: updated);
  }

  void clearMotes()   { state = state.copyWith(motes: const []); }
  void clearVectors() { state = state.copyWith(vectors: const []); }
  void clearStars()   { state = state.copyWith(stars: const []); }

  Future<void> saveGame() async { await _persistenceService.saveGame(state.toMap()); }

  Future<void> loadGame() async {
    final saved = await _persistenceService.loadGame();
    if (saved != null) { state = GameState.fromMap(saved); }
  }

  void reset() { state = GameState.empty; }
}

/// Provider — use this everywhere; do NOT construct GameStateNotifier directly in widgets.
///
/// ⚠️  Riverpod 3.x: NotifierProvider, not StateNotifierProvider.
final gameServiceProvider = NotifierProvider<GameStateNotifier, GameState>(
  () => GameStateNotifier(LocalPersistenceService()),
);
