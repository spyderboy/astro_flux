// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/game/retry_scheduler.dart';

void main() {
  group('RetryScheduler', () {
    test('run executes operation successfully', () async {
      final scheduler = RetryScheduler(baseDelay: const Duration(milliseconds: 1), maxAttempts: 3);
      await scheduler.run(() async => 'success');
      expect(scheduler.attemptCount, equals(1));
    });

    test('run retries on failure', () async {
      final scheduler = RetryScheduler(baseDelay: const Duration(milliseconds: 1), maxAttempts: 3);
      try {
        await scheduler.run(() async => throw Exception('test'));
      } catch (e) {
        expect(scheduler.attemptCount, equals(3));
      }
    });

    test('run stops after maxAttempts', () async {
      int callCount = 0;
      final scheduler = RetryScheduler(baseDelay: const Duration(milliseconds: 1), maxAttempts: 2);
      try {
        await scheduler.run(() async {
          callCount++;
          throw Exception('test');
        });
      } catch (e) {
        expect(callCount, equals(2));
      }
    });
  });
}