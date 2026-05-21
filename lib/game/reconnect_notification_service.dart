// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'gcp_sync_service.dart';
import '../providers/gcp_sync_status_provider.dart';
import '../utils/logger.dart';

/// Service that listens for connectivity/sync recovery events 
/// to re-trigger GCP synchronization.
class ReconnectNotificationService {
  final Ref _ref;

  ReconnectNotificationService(this._ref) {
    _init();
  }

  /// Initializes the listener to monitor [GcpSyncStatus] transitions.
  void _init() {
    _ref.listen<GcpSyncStatus>(
      gcpSyncStatusProvider,
      (previous, next) {
        // Detect when we move from an error state to a non-error state (recovery).
        if (previous == GcpSyncStatus.error && next != GcpSyncStatus.error) {
          Logger.info('Reconnection event detected: Sync status recovered. Triggering retry...');
          _handleReconnect();
        }
      },
    );
  }

  /// Triggers the GCP sync service.
  Future<void> _handleReconnect() async {
    try {
      final syncService = _ref.read(gcpSyncServiceProvider);
      await syncService.sync();
    } catch (e) {
      Logger.error('Failed to execute reconnect sync.', error: e);
    }
  }
}

/// Provider for the [ReconnectNotificationService].
final reconnectNotificationServiceProvider = Provider<ReconnectNotificationService>((ref) {
  return ReconnectNotificationService(ref);
});