import 'package:flutter_vector_math/flutter_vector_math.dart';
import 'dart:ui' show Colors;
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:astro_flux/game/fusion_provider.dart';

class CombatAttackHandler {
  final Ref ref;

  CombatAttackHandler(this.ref);

  void handleEvent(CombatAttackEvent event) {
    final state = ref.read(gameServiceProvider);
    if (state == null) return; // Handle the case where gameState is not available

    final sourceVector = state.vectors.firstWhere((v) => v.id == event.sourceVectorId);
    final targetStar = state.stars.firstWhere((s) => s.id == event.targetStarId);

    if (FusionRules.canFuse(state)) {
      // Fusion logic here
    }
  }
}
