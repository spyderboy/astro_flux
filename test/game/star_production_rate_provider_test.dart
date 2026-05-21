// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/models/star_production_rate.dart';
import 'package:astro_flux/providers/star_production_rate_provider.dart';

void main() {
  test('StarProductionRateProvider should return production rate for tier 1', () async {
    final provider = starProductionRatesProvider;
    final result = await provider.future;

    expect(result[1], equals(2)); // Assuming tier 1 has a production rate of 2 motes per minute
  });
}
