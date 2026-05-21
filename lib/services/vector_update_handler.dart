// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/game_state_provider.dart';
import '../game/gcp_sync_handler.dart';

class VectorUpdateHandler {
  final Ref ref;
  DateTime? _lastVectorSyncTimestamp;

  VectorUpdateHandler(this.ref);

  /// Asynchronously checks for enough motes to perform fusion.
  /// If 10 or more motes exist, it removes them and adds a new vector.
  /// Uses GcpSyncHandler to trigger a backend sync for the new vector.
  Future<void> attemptFusion() async {
    final now = DateTime.now();

    // Deduplication window: avoid multiple sync attempts for vectors within 5s.
    if (_lastVectorSyncTimestamp != null &&
        now.difference(_lastVectorSyncTimestamp!) < const Duration(seconds: 5)) {
      return;
    }

    final syncHandler = ref.read(gcpSyncHandlerProvider);
    final notifier = ref.read(gameServiceProvider.notifier);
    final state = ref.read(gameServiceProvider);

    if (state.motes.length >= 10) {
      // Identify the 10 oldest motes (lowest ID)
      final targets = state.motes.toList()
        ..sort((a, b) => a.id.compareTo(b.id));
      
      final motesToFuse = targets.take(10).toList();

      // Determine the next vector ID based on existing vectors
      final nextId = (state.vectors.isEmpty
          ? 1
          : state.vectors.map((v) => v.id).reduce((a, b) => a > b ? a : b)) + 1;

      // Update timestamp to start the 5s window to prevent duplicate syncs.
      _lastVectorSyncTimestamp = now;

      // Trigger the sync process to ensure the vector creation is persisted.
      // This handles the Firebase App SDK trigger for player vector sync.
      await syncHandler.syncWithRetry(() async {
        // Perform local mutation
        for (final mote in motesToFuse) {
          notifier.removeMote(mote.id);
        }
        notifier.addVector(nextId);
      });
    }
  }
}

/// Provider for the VectorUpdateHandler.
final vectorUpdateHandlerProvider = Provider<VectorUpdateHandler>((ref) {
  return VectorUpdateHandler(ref);
});