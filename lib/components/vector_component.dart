// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flame/components.dart' hide Vector;
import '../models/vector.dart';

/// Flame component for a Vector unit.
///
/// Movement: call [setTarget] with a world-space position; the component
/// moves toward it at [speed] px/s each update() tick.  When it arrives
/// (within 6 px), [onArrived] is invoked and movement stops.
///
/// Rendering: neon glow + solid core.  Colour encodes owner + tier:
///   player tier-1 → cyan   (#00DDFF)
///   player tier-2 → mint   (#00FFAA)
///   player tier-3 → gold   (#FFDD00)
///   enemy  any   → red    (#FF3366)
///
/// ⚠️  TapCallbacks has been removed — GestureHandler owns all tap routing.
/// ⚠️  Positions live here, NOT in Riverpod Vector model.
class VectorComponent extends PositionComponent {
  final Vector vector;
  final void Function(VectorComponent vc)? onArrived;

  /// Mote baseline speed in world-space pixels per second.
  static const double moteSpeed = 100.0;
  /// Vector speed = 80% of Mote speed (per vision: slower but hits harder).
  static const double speed = moteSpeed * 0.8;
  /// Arrival threshold in world-space pixels.
  static const double arrivalThreshold = 6.0;

  Vector2? _target;

  /// Whether this vector is currently selected by the player.
  bool isSelected = false;

  VectorComponent({
    required this.vector,
    Vector2? position,
    Vector2? target,
    this.onArrived,
  }) : super(position: position ?? Vector2.zero()) {
    _target = target?.clone();
    final r = _radiusForTier(vector.tier);
    size = Vector2.all(r * 2);
    anchor = Anchor.center;
  }

  // ── Tier-scaled geometry ────────────────────────────────────────────────────

  static double _radiusForTier(int tier) {
    switch (tier) {
      case 2:  return 20.0;
      case 3:  return 28.0;
      default: return 16.0;
    }
  }

  double get radius => _radiusForTier(vector.tier);

  // ── Owner / tier colour ─────────────────────────────────────────────────────

  /// Public colour accessor used by tests and render.
  Color get neonColor {
    if (vector.owner == 'enemy') return const Color(0xFFFF3366);
    switch (vector.tier) {
      case 2:  return const Color(0xFF00FFAA);
      case 3:  return const Color(0xFFFFDD00);
      default: return const Color(0xFF00DDFF);
    }
  }

  // ── Public API ──────────────────────────────────────────────────────────────

  void setTarget(Vector2 target) => _target = target.clone();
  void clearTarget()             => _target = null;

  // ── Flame overrides ─────────────────────────────────────────────────────────

  @override
  void update(double dt) {
    final t = _target;
    if (t == null) return;

    final dir  = t - position;
    final dist = dir.length;

    if (dist <= arrivalThreshold) {
      position = t.clone();
      _target  = null;
      onArrived?.call(this);
      return;
    }

    final moveStep = speed * dt;
    position += (dir / dist) * moveStep;
  }

  @override
  void render(Canvas canvas) {
    final r     = radius;
    final color = neonColor;

    // Outer glow
    canvas.drawCircle(
      Offset.zero,
      r,
      Paint()
        ..color = Color.fromARGB(
            (color.a * 0.6 * 255).round().clamp(0, 255),
            (color.r * 255).round(),
            (color.g * 255).round(),
            (color.b * 255).round(),
          ),
    );

    // Inner solid core
    canvas.drawCircle(
      Offset.zero,
      r - 1,
      Paint()
        ..color = Color.fromARGB(
            255,
            (color.r * 255).round(),
            (color.g * 255).round(),
            (color.b * 255).round(),
          ),
    );

    // Selection highlight ring
    if (isSelected) {
      canvas.drawCircle(
        Offset.zero,
        r + 4.0,
        Paint()
          ..color = color.withValues(alpha: 0.5)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0,
      );
    }
  }
}
