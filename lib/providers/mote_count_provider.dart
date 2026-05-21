import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/game_state_provider.dart';

/// Provides the current count of motes.
final moteCountProvider = Provider<int>((ref) {
  final state = ref.watch(gameServiceProvider);
  return state.motes.length;
});