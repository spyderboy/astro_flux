// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:astro_flux/game/fusion_rules.dart';

/// True when the active mote count meets or exceeds the fusion threshold (10).
final canFuseProvider = Provider<bool>((ref) {
  final state = ref.watch(gameServiceProvider);
  return state.motes.length >= FusionRules.fusionThreshold;
});
