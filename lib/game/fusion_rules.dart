// ignore_for_file: depend_on_referenced_packages
import 'package:astro_flux/models/game_state.dart';
import 'package:astro_flux/models/mote.dart';

/// Rules for fusion events.
class FusionRules {
  static const int fusionThreshold = 10;

  static bool canFuse(GameState state) {
    return state.motes
            .where((m) => m.lifecycleState == MoteLifecycle.active)
            .length >=
        fusionThreshold;
  }
}
