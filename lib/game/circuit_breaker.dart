// ignore_for_file: depend_on_referenced_packages

/// Represents the three possible states of a Circuit Breaker.
enum CircuitState { closed, open, halfOpen }

/// A Circuit Breaker implementation to prevent cascading failures
/// by stopping requests to a failing backend.
class CircuitBreaker {
  final int failureThreshold;
  final Duration resetTimeout;
  final void Function(CircuitState)? onStateChanged;

  CircuitBreaker({
    this.failureThreshold = 5,
    this.resetTimeout = const Duration(seconds: 30),
    this.onStateChanged,
  });

  int _failureCount = 0;
  DateTime? _lastFailureTime;

  CircuitState get state {
    if (_failureCount >= failureThreshold) {
      if (_lastFailureTime != null &&
          DateTime.now().difference(_lastFailureTime!) > resetTimeout) {
        return CircuitState.halfOpen;
      }
      return CircuitState.open;
    }
    return CircuitState.closed;
  }

  /// Checks if the circuit is in a state that allows execution.
  bool canExecute() => state != CircuitState.open;

  /// Resets the circuit to a clean state upon successful operation.
  void recordSuccess() {
    _failureCount = 0;
    _lastFailureTime = null;
    onStateChanged?.call(CircuitState.closed);
  }

  /// Increments the failure count and records the timestamp of the failure.
  void recordFailure() {
    _failureCount++;
    _lastFailureTime = DateTime.now();
    onStateChanged?.call(state);
  }
}