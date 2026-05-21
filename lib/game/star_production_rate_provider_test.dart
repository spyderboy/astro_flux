import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/models/star_production_rate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  test('Star production rate for tier 1 should be 10', () {
    expect(StarProductionRate.tierRates[1], 10);
  });

  test('Edge case: Production rate with zero elapsed decay time', () async {
    final controller = StreamController<Map<int, int>>.broadcast();
    final starProductionRateProvider = StreamProvider<Map<int, int>>((ref) => controller.stream);

    final providerContainer = ProviderContainer();
    addTearDown(providerContainer.dispose);

    await providerContainer.read(starProductionRateProvider.future);

    expect(providerContainer.read(starProductionRateProvider), StarProductionRate.tierRates);
  });

  test('Star production rate for tier 2 with multiplier should be 15', () async {
    final controller = StreamController<Map<int, int>>.broadcast();
    final starProductionRateProvider = StreamProvider<Map<int, int>>((ref) => controller.stream);

    final providerContainer = ProviderContainer()
      ..read(starProductionRateProvider.notifier).state[2] *= 1.5;

    await providerContainer.read(starProductionRateProvider.future);

    expect(providerContainer.read(starProductionRateProvider), {1: 10, 2: 15, 3: 20});
  });
}