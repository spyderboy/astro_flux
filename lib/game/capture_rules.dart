// ignore_for_file: depend_on_referenced_packages
import 'package:astro_flux/models/game_state.dart';

/// Pure logic for determining capture eligibility.
/// No Riverpod, no Flame — plain Dart so it can be tested without a Flutter environment.
class CaptureRules {
  const CaptureRules._();

  /// Returns true if at least one Vector in [state] is close enough to [starId]
  /// to initiate a capture attempt. Actual proximity check is done in the
  /// CaptureEventNotifier; this method is a placeholder for rule extensions.
  static bool canAttack(int vectorId, int starId, GameState state) {
    final vector = state.vectors.where((v) => v.id == vectorId);
    if (vector.isEmpty) return false;
    final star = state.stars.where((s) => s.id == starId);
    if (star.isEmpty) return false;
    return true;
  }

  /// Minimum number of active motes on a star to sustain its current tier.
  static int minMotesForTier(int tier) => tier * 3;

  /// Calculate the point value based on the tier of the star captured.
  static int pointValue(int tier) {
    switch (tier) {
      case 1:
        return 1;
      case 2:
        return 5;
      case 3:
        return 25;
      default:
        throw ArgumentError('Invalid star tier: $tier');
    }
  }
}
