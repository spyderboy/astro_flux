// ignore_for_file: depend_on_referenced_packages

/// Represents the possible states of a CircuitBreaker.
enum CircuitBreakerState {
  closed,
  open,
  halfOpen,
}

/// A CircuitBreaker implementation to prevent cascading failures.
/// 
/// - **Closed**: The operation is allowed to proceed. If failures exceed [failureThreshold], it transitions to [CircuitBreakerState.open].
/// - **Open**: The operation is blocked. After [resetTimeout] has passed, it transitions to [CircuitBreakerState.halfOpen].
/// - **HalfOpen**: A trial operation is allowed. If it succeeds, it transitions to [CircuitBreakerState.closed]. If it fails, it transitions back to [CircuitBreakerState.open].
class CircuitBreaker {
  final int failureThreshold;
  final Duration resetTimeout;
  final void Function(CircuitBreakerState)? onStateChanged;

  CircuitBreaker({
    required this.failureThreshold,
    required this.resetTimeout,
    this.onStateChanged,
  });

  CircuitBreakerState _state = CircuitBreakerState.closed;
  int _failureCount = 0;
  DateTime? _lastFailureTime;

  CircuitBreakerState get state => _state;

  void _updateState(CircuitBreakerState newState) {
    if (_state != newState) {
      _api_notifyStateChange(newState);
      _state = newState;
    }
  }

  void _api_notifyStateChange(CircuitBreakerState newState) {
    onStateChanged?.call(newState);
  }

  /// Returns true if the operation is allowed to proceed.
  bool canProceed() {
    if (_state == CircuitBreakerState.open) {
      if (_lastFailureTime != null &&
          DateTime.now().difference(_lastFailureTime!) > resetTimeout) {
        _updateState(CircuitBreakerState.halfOpen);
        return true;
      }
      return false;
    }
    return true;
  }

  /// Called when an operation succeeds.
  void onSuccess() {
    _failureCount = 0;
    _updateState(CircuitBreakerState.closed);
  }

  /// Called when an operation fails.
  void onFailure() {
    _failureCount++;
    _lastFailureTime = DateTime.now();

    if (_state == CircuitBreakerState.halfOpen || _failureCount >= failureThreshold) {
      _updateState(CircuitBreakerState.open);
    }
  }
}