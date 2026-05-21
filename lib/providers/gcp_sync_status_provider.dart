// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SyncStatus { syncing, success, error, circuitOpen }

/// Riverpod 3.x — Notifier<SyncStatus> + NotifierProvider.
class GcpSyncStatusNotifier extends Notifier<SyncStatus> {
  @override
  SyncStatus build() => SyncStatus.syncing;

  void setSyncing()     => state = SyncStatus.syncing;
  void setSuccess()     => state = SyncStatus.success;
  void setError()       => state = SyncStatus.error;
  void setCircuitOpen() => state = SyncStatus.circuitOpen;
}

final gcpSyncStatusProvider = NotifierProvider<GcpSyncStatusNotifier, SyncStatus>(
  () => GcpSyncStatusNotifier(),
);
