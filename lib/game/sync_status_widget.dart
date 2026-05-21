// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/gcp_sync_status_provider.dart';

enum GcpSyncStatus { idle, syncing, success, offline, error }

class SyncStatusWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syncStatus = ref.watch(gcpSyncStatusProvider);

    return Text(
      syncStatus.toString(),
      style: TextStyle(color: Colors.white),
    );
  }
}
