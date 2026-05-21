import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:flame/components.dart';
import 'package:astro_flux/components/combat_score_text_component.dart';
import 'package:astro_flux/providers/battle_state_notifier.dart';

export 'package:astro_flux/providers/battle_state_notifier.dart' show BattleState;

/// A provider that computes the combat score based on the number of vectors.
final combatScoreProvider = Provider<int>((ref) {
  final gameState = ref.watch(gameServiceProvider);
  return gameState.vectors.length;
});

/// A provider that tracks the current battle state, combining manual and score-based logic.
final battleStateProvider = Provider<BattleState>((ref) {
  final manualState = ref.watch(battleStateNotifierProvider);
  if (manualState != BattleState.none) return manualState;

  final score = ref.watch(combatScoreProvider);
  if (score == 0) return BattleState.none;
  if (score < 3) return BattleState.active;
  return BattleState.intense;
});

/// A stream of battle state transitions, allowing UI widgets to consume
/// phase changes as events.
final battleStateTransitionProvider = StreamProvider<BattleState>((ref) async* {
  yield ref.watch(battleStateProvider);
});

/// A provider that indicates if a battle is currently active.
final battleActiveProvider = Provider<bool>((ref) {
  return ref.watch(battleStateProvider) != BattleState.none;
});

/// A provider that computes battle intensity (0.0 to 1.0).
final battleIntensityProvider = Provider<double>((ref) {
  final score = ref.watch(combatScoreProvider);
  if (score == 0) return 0.0;
  return (score / 10).clamp(0.0, 1.0);
});

/// A provider that provides a TextComponent for displaying the combat score.
final combatScoreTextComponentProvider = Provider<CombatScoreTextComponent>((ref) {
  final component = CombatScoreTextComponent(
    position: Vector2(20, 40),
    text: 'SCORE: 0',
  );

  ref.listen(combatScoreProvider, (prev, next) {
    component.updateScore(next);
  });

  return component;
});