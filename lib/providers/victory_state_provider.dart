import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:astro_flux/game/victory_rules.dart';

/// A provider that indicates if the specified player has achieved victory.
final victoryProvider = Provider.family<bool, String>((ref, playerId) {
  final gameState = ref.watch(gameServiceProvider);
  return VictoryRules.isVictory(gameState, playerId);
});