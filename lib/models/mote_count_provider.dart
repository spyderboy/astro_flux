// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/game_state.dart';

final moteCountProvider = Provider<int>((ref) {
  final gameState = ref.watch(gameStateProvider);
  return gameState.motes.length;
});