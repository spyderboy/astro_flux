// ignore_for_file: depend_on_referenced_packages
import 'package:astro_flux/models/game_state.dart';

enum VictoryCondition {
  capturedAllStars,
  fusionCountReached,
  timeExpired,
}

class VictoryRules {
  /// Checks if the specified player has captured all stars.
  static bool isVictory(GameState state, String playerId) {
    return state.stars.every((star) => star.ownerId == playerId);
  }

  /// Checks if any victory condition has been met for the specified player.
  static bool checkVictoryConditions(GameState state, String playerId) {
    return isVictory(state, playerId);
  }
}
