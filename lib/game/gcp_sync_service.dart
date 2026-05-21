// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'gcp_sync_handler.dart';
import '../models/game_state_provider.dart';
import '../providers/gcp_sync_status_provider.dart';
import '../services/server_validation_service.dart';
import '../utils/logger.dart';
class GcpSyncService {
  final Ref _ref;
  final GcpSyncHandler _handler;
  final List<int> _offlineVectorIds = [];

  GcpSyncService(this._ref, this._handler);

  /// Synchronizes the current game state with the GCP backend.
  Future<void> sync() async {
    final currentStatus = _ref.read(gcpSyncStatusProvider);
    if (currentStatus == GcpSyncStatus.syncing) {
      Logger.warning('Sync already in progress. Skipping redundant sync attempt.');
      return;
    }

    await _handler.syncWithRetry(() async {
      // 1. Simulate network latency for a cloud-based sync.
      await Future.delayed(const Duration(milliseconds: 800));

      // Reconcile offline vectors against server state.
      final offlineIds = await readOfflineVectors();
      if (offlineIds.isNotEmpty) {
        Logger.info('Reconciling ${offlineIds.length} offline vectors...');
        final failedIds = <int>[];
        for (final id in offlineIds) {
          try {
            await syncVectorUpdate(id);
          } catch (e) {
            Logger.warning('Failed to reconcile offline vector $id: $e');
            failedIds.add(id);
          }
        }

        if (failedIds.isNotEmpty) {
          await writeOfflineVectors(failedIds);
        }
      }
    });
  }

  /// Synchronizes a specific vector update with the GCP backend.
  Future<void> syncVectorUpdate(int vectorId) async {
    await _handler.syncWithRetry(() async {
      final validationService = _ref.read(serverValidationServiceProvider);
      final state = _ref.read(gameServiceProvider);

      final isValid = await validationService.validateVectorCount(state.vectors.length);
      if (!isValid) {
        throw Exception('Server-side validation failed for vector $vectorId');
      }

      // Simulate network latency for a vector-specific sync.
      await Future.delayed(const Duration(milliseconds: 500));

      Logger.info('Vector $vectorId successfully synchronized.');
    });
  }

  /// Adds vector IDs that failed to sync to the offline queue.
  Future<void> writeOfflineVectors(List<int> ids) async {
    _offlineVectorIds.addAll(ids);
  }

  /// Retrieves and clears the offline vector IDs from the queue.
  Future<List<int>> readOfflineVectors() async {
    final ids = [..._offlineVectorIds];
    _offlineVectorIds.clear();
    return ids;
  }

  /// Get the level of a star from the GCP backend.
  Future<int> getStarLevel(int starId) async {
    try {
      // Simulate network latency for a cloud-based sync.
      await Future.delayed(const Duration(milliseconds: 500));

      final response = await _handler.fetchData('stars/$starId/level');
      final data = jsonDecode(response.body);

      return data['level'] as int;
    } catch (e) {
      Logger.error('Failed to get star level for id $starId: $e');
      rethrow;
    }
  }
}
