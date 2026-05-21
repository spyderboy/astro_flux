// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/fusion_indicator_state.dart';
import 'package:astro_flux/models/game_state_provider.dart';

/// Provides the state for the fusion progress indicator.
///
/// Riverpod 3.x — Notifier<FusionIndicatorState> + NotifierProvider.
/// ref.listen() is set up inside build(), not the constructor.
class FusionIndicatorNotifier extends Notifier<FusionIndicatorState> {
  @override
  FusionIndicatorState build() {
    // Listen to game state changes to update fusion progress
    ref.listen(gameServiceProvider, (previous, next) {
      state = _compute(next.motes.length);
    });
    // Initialise from current state
    return _compute(ref.read(gameServiceProvider).motes.length);
  }

  FusionIndicatorState _compute(int moteCount) {
    int countInGroup = moteCount % 10;
    if (countInGroup == 0 && moteCount > 0) countInGroup = 10;
    final progress = countInGroup / 10.0;
    final isAnimating = countInGroup == 10;
    return FusionIndicatorState(
      pendingCount: countInGroup,
      progress: progress,
      isAnimating: isAnimating,
    );
  }
}

final fusionIndicatorProvider = NotifierProvider<FusionIndicatorNotifier, FusionIndicatorState>(
  () => FusionIndicatorNotifier(),
);
