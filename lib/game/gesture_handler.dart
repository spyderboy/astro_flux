// ignore_for_file: depend_on_referenced_packages
import 'package:flame/components.dart' hide Vector;
import 'package:flame/events.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Transparent full-screen component that intercepts single-finger taps.
///
/// Detects which star (if any) was tapped by checking world-space distance
/// to each star's position. Invokes [onStarTapped] with the star's id.
///
/// ⚠️  TapCallbacks MUST be on PositionComponent, NOT on FlameGame.
///     ScaleDetector (pinch-zoom) remains on AstroGame.
class GestureHandler extends PositionComponent with TapCallbacks {
  final Ref ref;
  final Map<int, Vector2> starPositions;
  final void Function(int starId) onStarTapped;

  static const double _tapRadius = 44.0; // generous tap target in world pixels

  GestureHandler({
    required this.ref,
    required this.starPositions,
    required this.onStarTapped,
    super.size,
  });

  @override
  void onTapDown(TapDownEvent event) {
    final tapPos = event.localPosition;
    for (final entry in starPositions.entries) {
      if ((tapPos - entry.value).length <= _tapRadius) {
        onStarTapped(entry.key);
        return;
      }
    }
  }
}
