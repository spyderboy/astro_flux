class CooldownTimer {
  double _remainingSeconds = 0.0;
  double _totalSeconds = 0.0;

  /// Starts the timer with the given [duration].
  void start(Duration duration) {
    _totalSeconds = duration.inMicroseconds / 1000000.0;
    _remainingSeconds = _totalSeconds;
  }

  /// Returns true if the timer is currently active (greater than zero).
  bool isActive() => _remainingSeconds > 0;

  /// Returns the progress of the cooldown (1.0 to 0.0).
  double get progress => _totalSeconds > 0 ? _remainingSeconds / _totalSeconds : 0.0;

  /// Resets the timer to zero.
  void reset() {
    _remainingSeconds = 0.0;
    _totalSeconds = 0.0;
  }

  /// Updates the remaining time by subtracting [dt].
  void update(double dt) {
    if (_remainingSeconds > 0) {
      _remainingSeconds -= dt;
      if (_remainingSeconds < 0) {
        _remainingSeconds = 0.0;
      }
    }
  }

  /// Returns the remaining time as a [Duration].
  Duration get remainingDuration => Duration(microseconds: (_remainingSeconds * 1000000).round());
}