import 'package:flame/flame_game.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/game_over_reason.dart';
import 'package:astro_flux/providers/game_over_provider.dart';
import 'package:astro_flux/models/game_state_provider.dart';

/// A controller that manages the transition into the game over state.
class GameOverController {
  final Ref ref;

  GameOverController(this.ref);

  /// Pauses the game engine and sets the game over state.
  void triggerGameOver(GameOverReason reason, dynamic game) {
    game.pauseEngine();
    ref.read(gameOverProvider.notifier).triggerGameOver(reason);
  }

  /// Resets the game over state to allow the player to restart.
  void resetGame() {
    ref.read(gameServiceProvider.notifier).reset();
    ref.read(gameOverProvider.notifier).reset();
  }
}

/// A provider for accessing the [GameOverController].
final gameOverControllerProvider = Provider<GameOverController>((ref) {
  return GameOverController(ref);
});