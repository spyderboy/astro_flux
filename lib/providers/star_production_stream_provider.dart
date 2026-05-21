// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:astro_flux/providers/star_production_rate_provider.dart';

/// Provider that returns a stream of the total production rate of all stars.
final starProductionStreamProvider = StreamProvider.autoDispose<int>((ref) {
  final gameState = ref.watch(gameServiceProvider);
  final rates = ref.watch(starProductionRatesProvider).valueOrNull ?? {};

  int totalRate = 0;
  for (final star in gameState.stars) {
    totalRate += rates[star.tier] ?? 0;
  }

  return Stream.value(totalRate);
});