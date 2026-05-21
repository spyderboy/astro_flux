// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'circuit_breaker.dart';
import 'retry_scheduler.dart';
import '../../models/game_state_provider.dart';

enum GameStateStatus { idle, syncing, success, error }

class GcpSyncHandler {
  final Ref _ref;
  final RetryScheduler _retryScheduler;
  final CircuitBreaker _circuitBreaker;

  int maxInstances = 10; // Add maxInstances limit
  int _instanceCount = 0;

  GcpSyncHandler(this._ref, {int maxRetries = 3, Duration initialDelay = const Duration(seconds: 2)})
      : _retryScheduler = RetryScheduler(baseDelay: initialDelay, maxAttempts: maxRetries),
        _circuitBreaker = CircuitBreaker();

  Future<void> syncWithRetry(Future<void> Function() operation) async {
    if (_instanceCount >= maxInstances) {
      print('Max instances reached. Sync operation aborted.');
      return;
    }

    final statusNotifier = _ref.read(gameServiceProvider.notifier);
    statusNotifier.state = GameStateStatus.syncing;

    _instanceCount++;

    if (!_circuitBreaker.canExecute()) {
      statusNotifier.state = GameStateStatus.error;
      print('Circuit breaker is open. Sync operation aborted.');
      _instanceCount--;
      return;
    }

    try {
      await _retryScheduler.run(operation);
      _circuitBreaker.recordSuccess();
      statusNotifier.state = GameStateStatus.success;
      print('GCP sync successful after ${_retryScheduler.attemptCount} attempt(s).');
    } catch (e) {
      _circuitBreaker.recordFailure();
      statusNotifier.state = GameStateStatus.error;
      rethrow;
    } finally {
      _instanceCount--;
    }
  }
}