// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'game_ui/hud.dart';
import 'game_ui/combat_score_text_component.dart';

/// Wraps a Flame game canvas with the [CombatScoreWidget] HUD overlay.
/// 
/// Usage:
///   GameWidget(child: flame.GameWidget<AstroGame>(game: _game, ...))
/// 
/// Do NOT import `package:flame/game.dart` here — it re-exports vector_math
/// and conflicts with direct vector_math imports. Wrap Flame's GameWidget
/// externally and pass it as [child].
/// 
/// Do NOT use CombatScoreTextComponent or CombatResultLabelComponent here —
/// those are Flame PositionComponents, not Flutter widgets. They cannot be
/// placed in a Stack. Use CombatScoreWidget (a ConsumerWidget) instead.
class GameWidget extends ConsumerWidget {
  final Widget child;

  const GameWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        child,
        CombatScoreWidget(ref),
        const HUD(),
      ],
    );
  }
}

class CombatScoreWidget extends ConsumerWidget {
  final WidgetRef ref;

  CombatScoreWidget(this.ref);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      top: 10,
      right: 10,
      child: CombatScoreTextComponent()
        ..text = 'SCORE: ${ref.watch(gameServiceProvider).motes.length * 10}',
    );
  }
}