import '../models/game_state.dart';

class ScoringService {
  static int calculateScore(GameState state) {
    int score = 0;

    // Vectors contribution
    score += state.vectors.length * 100;

    // Stars contribution
    for (final star in state.stars) {
      score += switch (star.tier) {
        1 => 50,
        2 => 150,
        3 => 300,
        _ => 0,
      };
    }

    // Motes contribution
    score += state.motes.length * 1;

    return score;
  }
}
