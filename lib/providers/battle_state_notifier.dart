// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A provider that tracks the current battle state manually.
enum BattleState { none, active, intense }

/// The outcome of a completed battle.
enum BattleResult { win, loss, draw }

/// A notifier that allows manual control over the battle state.
class BattleStateNotifier extends Notifier<BattleState> {
  @override
  BattleState build() {
    return BattleState.none;
  }

  /// Transitions the battle state to active.
  void startBattle() {
    state = BattleState.active;
  }

  /// Transitions the battle state back to none, given a result.
  void endBattle(BattleResult result) {
    // result can be used to trigger specific effects/logic in the future.
    state = BattleState.none;
  }
}

/// A provider that exposes the BattleStateNotifier.
final battleStateNotifierProvider = NotifierProvider<BattleStateNotifier, BattleState>(
  () => BattleStateNotifier(),
);