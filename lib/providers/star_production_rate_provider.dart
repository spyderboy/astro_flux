// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/star_production_rate.dart';

/// Event emitted when a star produces motes.
class StarProductionTick {
  final int starId;
  const StarProductionTick(this.starId);
}

/// Controller that allows pushing updates to the production rates.
final starProductionRateControllerProvider = Provider<StreamController<Map<int, int>>>((ref) {
  final controller = StreamController<Map<int, int>>.broadcast();
  // Initialize with the default rates.
  controller.add(StarProductionRate.tierRates);
  ref.onDispose(() => controller.close());
  return controller;
});

/// Provider that exposes the production rates as an async stream.
final starProductionRatesProvider = StreamProvider<Map<int, int>>((ref) {
  final controller = ref.watch(starProductionRateControllerProvider);
  return controller.stream;
});

/// Provider that returns the production rate for a specific star tier via a stream.
final starProductionRateProvider = StreamProvider.family<int, int>((ref, tier) {
  final controller = ref.watch(starProductionRateControllerProvider);
  return controller.stream.map((rates) => rates[tier] ?? 0);
});

/// Controller for star production tick events.
final starProductionTickControllerProvider = Provider<StreamController<StarProductionTick>>((ref) {
  final controller = StreamController<StarProductionTick>.broadcast();
  ref.onDispose(() => controller.close());
  return controller;
});

/// Stream of star production ticks.
final starProductionTickProvider = StreamProvider<StarProductionTick>((ref) {
  final controller = ref.watch(starProductionTickControllerProvider);
  return controller.stream;
});