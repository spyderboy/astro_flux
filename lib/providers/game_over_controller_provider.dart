import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/game_state_provider.dart';

class GameOverController {
  final ProviderRef ref;
  GameOverController(this.ref);

  void resetGame() {
    ref.read(gameServiceProvider).reset();
  }
}

final gameOverControllerProvider = Provider((ref) => GameOverController(ref));