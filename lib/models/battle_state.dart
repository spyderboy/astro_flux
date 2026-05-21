// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Represents the current state of a battle.
enum BattlePhase { idle, active, victory, defeat }

/// A data model to track the battle state and score.
class BattleState {
  final BattlePhase phase;
  final int playerScore;
  final int enemyScore;

  const BattleState({
    required this.phase,
    required this.playerScore,
    required this.enemyScore,
  });

  BattleState copyWith({BattlePhase? phase, int? playerScore, int? enemyScore}) {
    return BattleState(
      phase: phase ?? this.phase,
      playerScore: playerScore ?? this.playerScore,
      enemyScore: enemyScore ?? this.enemyScore,
    );
  }

  @override
  String toString() => 'BattleState(phase: $phase, playerScore: $playerScore, enemyScore: $enemyScore)';
}
