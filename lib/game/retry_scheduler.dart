// ignore_for_file: depend_on_referenced_packages
import 'dart:async';

class RetryScheduler {
  final Duration baseDelay;
  final int maxAttempts;
  int attemptCount = 0;

  RetryScheduler({required this.baseDelay, required this.maxAttempts});

  Future<T> run<T>(Future<T> Function() operation) async {
    for (attemptCount = 0; attemptCount < maxAttempts; attemptCount++) {
      try {
        return await operation();
      } catch (e) {
        if (attemptCount < maxAttempts - 1) {
          await Future.delayed(baseDelay);
        } else {
          rethrow;
        }
      }
    }
    throw Exception('Max retries exceeded');
  }
}

/// Retry behavior:
/// - The `RetryScheduler` class provides a mechanism to retry an operation a specified number of times with a base delay between attempts.
/// - If the operation fails, it will be retried up to `maxAttempts - 1` times before throwing an exception.
///
/// Idempotency guarantees:
/// - Operations that are idempotent (i.e., performing the same operation multiple times has the same effect as performing it once) can be safely retried without causing unintended side effects.