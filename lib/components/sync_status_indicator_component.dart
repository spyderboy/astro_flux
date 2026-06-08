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

  static const double _pulseSpeed = 8.0;
  static const int _glowAlphaMax = 150;
  static const double _baseGlowBlur = 5.0;
  static const double _ringRadiusMultiplier = 0.6;

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
      pulseMultiplier = 1.0 + 0.3 * (sin(_pulse * _pulseSpeed) + 1.0) / 2.0;
    }

    final glowAlpha = (_glowAlphaMax * pulseMultiplier).clamp(0.0, 255.0).toInt();
    final glowBlur = _baseGlowBlur * pulseMultiplier;

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
      canvas.drawCircle(center, radius * _ringRadiusMultiplier, ringPaint);
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