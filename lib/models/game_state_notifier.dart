// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/game_state.dart';

class GameStateNotifier extends StateNotifier<GameState> {
  GameStateNotifier() : super(GameState());

  void addMote(int id) {
    state = state.copyWith(motes: [...state.motes, Mote(id: id)]);
  }

  void removeMote(int id) {
    state = state.copyWith(motes: state.motes.where((mote) => mote.id != id).toList());
  }

  void addVector(int id, {String owner = 'player', int tier = 1}) {
    state = state.copyWith(vectors: [...state.vectors, Vector(id: id, owner: owner, tier: tier)]);
  }

  void removeVector(int id) {
    state = state.copyWith(vectors: state.vectors.where((vector) => vector.id != id).toList());
  }

  void addStar(int id, int tier) {
    state = state.copyWith(stars: [...state.stars, Star(id: id, tier: tier)]);
  }

  void removeStar(int id) {
    state = state.copyWith(stars: state.stars.where((star) => star.id != id).toList());
  }

  void updateStar(int id, int tier) {
    state = state.copyWith(
      stars: state.stars.map((star) => star.id == id ? star.copyWith(tier: tier) : star).toList(),
    );
  }

  void captureStar(int id, String ownerId) {
    state = state.copyWith(
      stars: state.stars.map((star) => star.id == id ? star.copyWith(ownerId: ownerId) : star).toList(),
    );
  }

  void damageVector(int id, int amount) {
    state = state.copyWith(
      vectors: state.vectors.map((vector) => vector.id == id ? vector.copyWith(currentHealth: vector.currentHealth - amount) : vector).toList(),
    );
  }

  void spawnSurge(int id, {String owner = 'player'}) {
    state = state.copyWith(vectors: [...state.vectors, Vector(id: id, owner: owner, tier: 3)]);
  }

  void clearMotes() {
    state = state.copyWith(motes: []);
  }

  void clearVectors() {
    state = state.copyWith(vectors: []);
  }

  void clearStars() {
    state = state.copyWith(stars: []);
  }

  void saveGame() async {}

  void loadGame() async {}

  void reset() {
    state = GameState();
  }
}