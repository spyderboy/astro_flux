// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/fusion_log_entry.dart';
import 'package:astro_flux/services/fusion_log_service.dart';

/// A provider for the FusionLogService to allow easy overriding in tests.
final fusionLogServiceProvider = Provider<FusionLogService>((ref) {
  return FirestoreFusionLogService();
});

void main() {
  group('FusionLogService Integration Test', () {
    late ProviderContainer container;
    late FirestoreFusionLogService service;

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

    test('should persist and retrieve fusion log entries', () async {
      final timestamp = DateTime.now();
      final entry = FusionLogEntry(
        timestamp: timestamp,
        moteIds: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        resultVectorId: 101,
      );

      // Save the entry
      await service.saveEntry(entry);

      // Retrieve entries
      final entries = await service.getEntries();

      expect(entries.length, 1);
      expect(entries.first.resultVectorId, 101);
      expect(entries.first.moteIds, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      expect(entries.first.timestamp, timestamp);
    });

    test('should handle multiple entries chronologically', () async {
      final entry1 = FusionLogEntry(
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
        moteIds: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        resultVectorId: 101,
      );
      final entry2 = FusionLogEntry(
        timestamp: DateTime.now(),
        moteIds: [11, 12, 13, 14, 15, 16, 17, 18, 19, 20],
        resultVectorId: 102,
      );

      await service.saveEntry(entry1);
      await service.saveEntry(entry2);

      final entries = await service.getEntries();

      expect(entries.length, 2);
      expect(entries[0].resultVectorId, 101);
      expect(entries[1].resultVectorId, 102);
    });
  });
}