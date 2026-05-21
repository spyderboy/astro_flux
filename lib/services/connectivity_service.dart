// ignore_for_file: depend_on_referenced_packages
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'local_state_queue.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  /// Returns a stream of connectivity changes.
  /// Note: connectivity_plus v6.0.0+ returns List<ConnectivityResult>.
  Stream<List<ConnectivityResult>> get connectivityStream =>
      _connectivity.onConnectivityChanged;

  /// Checks the current connectivity status.
  Future<List<ConnectivityResult>> checkConnectivity() async {
    return await _connectivity.checkConnectivity();
  }
}

/// Provider for the ConnectivityService instance.
final connectivityServiceProvider = Provider<ConnectivityService>((ref) {
  return ConnectivityService();
});

/// Provider that exposes the current connectivity status as a stream.
final connectivityStatusProvider = StreamProvider<List<ConnectivityResult>>((ref) {
  final service = ref.watch(connectivityServiceProvider);
  return service.connectivityStream;
});

/// A provider that listens to connectivity changes and performs side effects.
/// This should be watched in the main application widget (e.g., in main.dart)
/// to activate the listener and react to network state changes.
final connectivityObserverProvider = Provider<void>((ref) {
  ref.listen<AsyncValue<List<ConnectivityResult>>>(connectivityStatusProvider, (previous, next) {
    next.whenData((results) {
      // Check if we have any active connection (not 'none')
      final hasConnection = results.isNotEmpty && !results.contains(ConnectivityResult.none);
      if (hasConnection) {
        try {
          // Flush the local queue on reconnection
          ref.read(localStateQueueProvider).flush();
        } catch (e) {
          // Fail silently to avoid disrupting the observer
        }
      }
      print('Connectivity change detected: $results');
    });
  });
});