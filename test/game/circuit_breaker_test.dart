// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/game/circuit_breaker.dart';

void main() {
  group('CircuitBreaker', () {
    const int threshold = 5;
    const Duration timeout = Duration(milliseconds: 100);

    late CircuitBreaker circuitBreaker;

    setUp(() {
      circuitBreaker = CircuitBreaker(
        failureThreshold: threshold,
        resetTimeout: timeout,
      );
    });

    test('Initial state is closed and can execute', () {
      expect(circuitBreaker.state, CircuitState.closed);
      expect(circuitBreaker.canExecute(), isTrue);
    });

    test('Transitions to open when failure threshold reached', () {
      for (int i = 0; i < threshold - 1; i++) {
        circuitBreaker.recordFailure();
        expect(circuitBreaker.state, CircuitState.closed);
      }

      circuitBreaker.recordFailure();
      expect(circuitBreaker.state, CircuitState.open);
      expect(circuitBreaker.canExecute(), isFalse);
    });

    test('Transitions to halfOpen after reset timeout', () async {
      for (int i = 0; i < threshold; i++) {
        circuitBreaker.recordFailure();
      }
      expect(circuitBreaker.state, CircuitState.open);

      // Wait for the reset timeout to pass
      await Future.delayed(timeout + const Duration(milliseconds: 50));

      expect(circuitBreaker.state, CircuitState.halfOpen);
      expect(circuitBreaker.canExecute(), isTrue);
    });

    test('Transitions to closed on success', () {
      for (int i = 0; i < threshold; i++) {
        circuitBreaker.recordFailure();
      }
      expect(circuitBreaker.state, CircuitState.open);

      circuitBreaker.recordSuccess();
      expect(circuitBreaker.state, CircuitState.closed);
      expect(circuitBreaker.canExecute(), isTrue);
    });

    test('Transitions back to open if failure occurs after reaching halfOpen state', () async {
      // Reach open state
      for (int i = 0; i < threshold; i++) {
        circuitBreaker.recordFailure();
      }
      expect(circuitBreaker.state, CircuitState.open);

      // Wait for halfOpen
      await Future.delayed(timeout + const Duration(milliseconds: 50));
      expect(circuitBreaker.state, CircuitState.halfOpen);

      // Record failure - this should immediately make it open again because 
      // the difference between now and new lastFailureTime is 0.
      circuitBreaker.recordFailure();
      expect(circuitBreaker.state, CircuitState.open);
    });
  });
}