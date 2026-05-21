// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/fusion_log_entry.dart';
import 'package:astro_flux/services/fusion_log_service.dart';

final fusionLogServiceProvider = Provider<FusionLogService>((ref) {
  return FirestoreFusionLogService();
});

void main() {
  group('FusionLogService Trigger Test', () {
    late ProviderContainer container;
    late FusionLogService service;

    setUp(() {
      service = FirestoreFusionLogService();
      container = ProviderContainer(
        overrides: [
          fusionLogServiceProvider.overrideWith((ref) => service),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('should trigger stream emission when a new fusion log entry is written', () async {
      // This test verifies that writing a FusionLogEntry (representing a vector creation)
      // triggers a notification via the service's stream.
      
      // We assume FusionLogService implements streamEntries().
      final stream = service.streamEntries();
      bool received = false;
      
      final subscription = stream.listen((entry) {
        received = true;
      });

      final entry = FusionLogEntry(
        timestamp: DateTime.now(),
        moteIds: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        resultVectorId: 555,
      );

      await service.saveEntry(entry);

      // Wait for async propagation
      await Future.delayed(const Duration(milliseconds: 100));

      expect(received, isTrue, reason: 'Writing a vector entry should trigger the stream listener');

      await subscription.cancel();
    });
  });
}
