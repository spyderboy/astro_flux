// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:astro_flux/game/combat_attack_event.dart';
import 'package:astro_flux/game/capture_rules.dart';
import 'package:astro_flux/game/capture_event_notifier.dart';

/// Handles star-capture attack events dispatched by the gesture layer.
///
/// Single responsibility: validate eligibility then execute star captures.
///
/// ⚠️  This class ONLY handles player→star attacks.
///     Unit-vs-unit combat (simultaneous damage, health, removal) lives in
///     unit_combat_resolver.dart — do NOT add tick() or collision logic here.
///
/// ⚠️  Takes a Ref — NEVER a GameStateNotifier directly.
///     Read state via: ref.read(gameServiceProvider)
///     Mutate via:     ref.read(gameServiceProvider.notifier).someMethod()
///     NEVER write:    notifier.state or _gameStateNotifier.state
///
/// ⚠️  Do NOT import package:particle_effects — it does not exist.
///     Particles are in package:astro_flux/game/particle_effects.dart.
class CombatAttackHandler {
  final Ref _ref;

  CombatAttackHandler(this._ref);

  void handle(CombatAttackEvent event) {
    final state = _ref.read(gameServiceProvider);
    if (!CaptureRules.canAttack(event.sourceVectorId, event.targetStarId, state)) {
      _ref.read(captureMessageProvider.notifier).showCaptureFailure('Capture failed');
      return;
    }
    _ref.read(gameServiceProvider.notifier).captureStar(event.targetStarId, 'player');
    _ref.read(captureMessageProvider.notifier).showCaptureSuccess('Star captured!');
  }
}
