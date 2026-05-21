// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_primepod.dart';
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:astro_flux/game/game_events.dart';

/// A provider that listens to game state changes and dispatches [LevelUpEvent]
/// whenever the number of vectors increases.
final levelUpProvider = Provider<void>((ref) {
  ref.listen(gameServiceProvider, (previous, next) {
    if (previous != null && next.vectors.length > previous.vectors.length) {
      LevelUpEventBus.fire(LevelUpEvent());
    }
  });
});
