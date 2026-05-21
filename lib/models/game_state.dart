import 'mote.dart';
import 'vector.dart';
import 'star.dart';

/// Immutable game state container
class GameState {
  final List<Mote> motes;
  final List<Vector> vectors;
  final List<Star> stars;

  const GameState({
    this.motes = const [],
    this.vectors = const [],
    this.stars = const [],
  });

  static const empty = GameState();

  factory GameState.fromMap(Map<String, dynamic> map) {
    return GameState(
      motes: (map['motes'] as List<dynamic>?)
              ?.map((e) => Mote.fromMap(e as Map<String, dynamic>))
              .toList() ?? const [],
      vectors: (map['vectors'] as List<dynamic>?)
              ?.map((e) => Vector.fromMap(e as Map<String, dynamic>))
              .toList() ?? const [],
      stars: (map['stars'] as List<dynamic>?)
              ?.map((e) => Star.fromMap(e as Map<String, dynamic>))
              .toList() ?? const [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'motes': motes.map((m) => m.toMap()).toList(),
      'vectors': vectors.map((v) => v.toMap()).toList(),
      'stars': stars.map((s) => s.toMap()).toList(),
    };
  }

  GameState copyWith({
    List<Mote>? motes,
    List<Vector>? vectors,
    List<Star>? stars,
  }) {
    return GameState(
      motes: motes ?? this.motes,
      vectors: vectors ?? this.vectors,
      stars: stars ?? this.stars,
    );
  }
}
