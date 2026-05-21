/// Game constants and configuration
/// Do not change the fusion ratio without explicit approval
class GameConstants {
  /// Motes required to create one Vector
  static const int fusionRatio = 10;

  /// Minimum tier value for Stars
  static const int minTier = 1;

  /// Maximum tier value for Stars
  static const int maxTier = 3;

  /// Base mote production rate for tier 1 Star (per second)
  static const double baseProductionRate = 1.0;

  /// Production multiplier per tier
  static const double tierMultiplier = 2.0;
}
