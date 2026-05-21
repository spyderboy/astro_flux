import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'connectivity_service.dart';

/// A type definition for a syncable action.
typedef SyncAction = Future<void> Function();

/// Service that buffers sync actions when the network is unavailable.
class LocalStateQueueService {
  final Ref _ref;
  final List<SyncAction> _queue = [];
  bool _isProcessing = false;

  LocalStateQueueService(this._ref) {_initConnectivityListener();}

  void _initConnectivityListener() {
    // Listen to connectivity changes to trigger queue processing when online.
    _ref.listen<AsyncValue<List<ConnectivityResult>>>(connectivityStatusProvider, 
      (previous, next) {
        final connectivityList = next.valueOrNull;
        if (connectivityList != null && connectivityList.isNotEmpty) {
          // Check if we have an active connection (not 'none')
          final isConnected = !connectivityList.contains(ConnectivityResult.none);
          if (isConnected) {
            _processQueue();
          }
        }
      },
    );
  }

  /// Enqueues an action to be performed when connectivity is available.
  void enqueue(SyncAction action) {_queue.add(action); _processQueue();}

  /// Attempts to process all queued actions.
  Future<void> flush() async {await _processQueue();}

  /// Attempts to process all queued actions.
  Future<void> _processQueue() async {
    if (_isProcessing || _queue.isEmpty) return;

    _isProcessing = true;
    try {
      while (_queue.isNotEmpty) {
        final action = _queue.first;
        try {
          await action();
          // Successfully completed, remove from queue.
          _queue.removeAt(0);
        } catch (e) {
          // If an action fails, stop processing and wait for the next connectivity trigger.
          // We do NOT remove the action from the queue.
          break;
        }
      }
    } finally {
      _isProcessing = false;
    }
  }

  /// Returns the number of items currently in the queue.
  int get queueLength => _queue.length;
}

/// Provider for the [LocalStateQueueService].
final localStateQueueServiceProvider = Provider<LocalStateQueueService>((ref) {
  return LocalStateQueueService(ref);
});