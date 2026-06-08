// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/models/star_production_rate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  test('Star production rate for tier 1 should be 2', () {
    expect(StarProductionRate.tierRates[1], 2);
  });

  test('Edge case: Production rate with zero elapsed decay time', () async {
    final controller = StreamController<Map<int, int>>.broadcast();
    final starProductionRateProvider = StreamProvider<Map<int, int>>((ref) => controller.stream);

    final providerContainer = ProviderContainer();
    addTearDown(providerContainer.dispose);

    await providerContainer.read(starProductionRateProvider.future);

    expect(providerContainer.read(starProductionRateProvider), StarProductionRate.tierRates);
  });

  test('Star production rate for tier 2 with multiplier should be 7.5', () async {
    final controller = StreamController<Map<int, int>>.broadcast();
    final starProductionRateProvider = StreamProvider<Map<int, int>>((ref) => controller.stream);

    final providerContainer = ProviderContainer()
      ..read(starProductionRateControllerProvider.notifier).state[2] *= 1.5;

    await providerContainer.read(starProductionRateProvider.future);

    expect(providerContainer.read(starProductionRateProvider), {1: 2, 2: 7.5, 3: 10});
  });
}