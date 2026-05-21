// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/foundation.dart';

@immutable
class FusionIndicatorState {
  final int pendingCount;
  final bool isAnimating;
  final double progress;

  const FusionIndicatorState({
    this.pendingCount = 0,
    this.isAnimating = false,
    this.progress = 0.0,
  });

  FusionIndicatorState copyWith({
    int? pendingCount,
    bool? isAnimating,
    double? progress,
  }) {
    return FusionIndicatorState(
      pendingCount: pendingCount ?? this.pendingCount,
      isAnimating: isAnimating ?? this.isAnimating,
      progress: progress ?? this.progress,
    );
  }
}