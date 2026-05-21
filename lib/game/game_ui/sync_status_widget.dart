// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/gcp_sync_status_provider.dart';

class SyncStatusWidget extends StatelessWidget {
  final double size;

  const SyncStatusWidget({super.key, this.size = 24});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final status = ref.watch(gcpSyncStatusProvider);
      return _buildStatusWidget(status);
    });
  }

  Widget _buildStatusWidget(SyncStatus status) {
    Color color;
    String label;

    switch (status) {
      case SyncStatus.syncing:
        color = const Color(0xFFFFD700); // Gold
        label = 'Syncing...';
        break;
      case SyncStatus.success:
        color = const Color(0xFF00FF00); // Green
        label = 'Synced';
        break;
      case SyncStatus.error:
        color = const Color(0xFFFF0000); // Red
        label = 'Error';
        break;
      case SyncStatus.circuitOpen:
        color = const Color(0xFF808080); // Gray
        label = 'Circuit Open';
        break;
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}