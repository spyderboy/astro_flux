// ignore_for_file: depend_on_referenced_packages
import 'dart:math';
import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/gcp_sync_status_provider.dart';

class SyncStatusIndicatorComponent extends PositionComponent {
  final Ref ref;

  SyncStatusIndicatorComponent({
    required this.ref,
    super.position,
    super.size,
  });

  double _pulse = 0.0;

  @override
  void update(double dt) {
    _pulse += dt;
  }

  @override
  void render(Canvas canvas) {
    final status = ref.read(gcpSyncStatusProvider);
    final color = _getStatusColor(status);

    final center = Offset(size.x / 2, size.y / 2);
    final radius = size.x / 2;

    // Core circle
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius, paint);

    // Neon glow effect using additive blending
    double pulseMultiplier = 1.0;
    if (status == GcpSyncStatus.syncing) {
      // Pulse between 0.7 and 1.3
      pulseMultiplier = 1.0 + 0.3 * (sin(_pulse * 8.0) + 1.0) / 2.0;
    }

    final glowAlpha = (150 * pulseMultiplier).clamp(0.0, 255.0).toInt();
    final glowBlur = 5.0 * pulseMultiplier;

    final glowPaint = Paint()
      ..color = color.withAlpha(glowAlpha)
      ..blendMode = BlendMode.plus
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, glowBlur);

    canvas.drawCircle(center, radius + 2 * pulseMultiplier, glowPaint);

    // Show offline indicator (small ring) when status is dirty (writing to local)
    if (status == GcpSyncStatus.dirty) {
      final ringPaint = Paint()
        ..color = const Color(0xFFFFFFFF).withAlpha(200)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5;
      canvas.drawCircle(center, radius * 0.6, ringPaint);
    }
  }

  Color _getStatusColor(GcpSyncStatus status) {
    switch (status) {
      case GcpSyncStatus.idle:
        return const Color(0xFF757575);
      case GcpSyncStatus.syncing:
        return const Color(0xFF00E5FF);
      case GcpSyncStatus.success:
        return const Color(0xFF00E676);
      case GcpSyncStatus.error:
        return const Color(0xFFFF5252);
      case GcpSyncStatus.dirty:
        return const Color(0xFFFFC107); // Amber for out-of-sync
    }
  }
}