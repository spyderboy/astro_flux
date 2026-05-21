// ignore_for_file: depend_on_referenced_packages

import 'package:astro_flux/models/game_state.dart';

/// Service responsible for calculating player scores.
/// The scoring algorithm is designed to be deterministic so it can be
/// calculated both client-side (for UI/prediction) and server-side
/// (for official leaderboard validation).
class ScoringService {
  /// Calculates the player's score based on their current game state.
  ///
  /// Score components:
  /// - **Vectors**: 100 points each.
  /// - **Stars**: Tier-based points (Tier 1: 50, Tier 2: 150, Tier 3: 300).
  /// - **Motes**: 1 point each.
  static int calculateScore(GameState state) {
    int score = 0;

    // 1. Vectors contribution
    score += state.vectors.length * 100;

    // 2. Stars contribution
    for (final star in state.stars) {
      score += switch (star.tier) {
        1 => 50,
        2 => 150,
        3 => 300,
        _ => 0,
      };
    }

    // 3. Motes contribution
    score += state.motes.length * 1;

    return score;
  }
}