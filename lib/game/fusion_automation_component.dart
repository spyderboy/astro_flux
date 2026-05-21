// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:astro_flux/game/fusion_rules.dart';

/// Utility class that checks whether fusion conditions are met.
///
/// Fusion is driven from AstroGame._checkAutoFusion() each tick via
/// FusionRules.canFuse(state). This class is kept for reference/testing.
///
/// ⚠️  Do NOT call fusionProviderProvider — that provider does not exist.
///     Use ref.read(gameServiceProvider) + FusionRules.canFuse(state) directly.
class FusionAutomationComponent {
  final Ref ref;

  FusionAutomationComponent(this.ref);

  /// Returns true when the active mote count has reached [FusionRules.fusionThreshold].
  bool shouldTriggerFusion() {
    final state = ref.read(gameServiceProvider);
    return FusionRules.canFuse(state);
  }
}
