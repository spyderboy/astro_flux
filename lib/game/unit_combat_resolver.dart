// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:astro_flux/components/vector_component.dart';

/// Resolves unit-vs-unit combat each game tick.
///
/// Combat fires once per second (not every frame) so tier-2 units survive
/// a few hits rather than dying in milliseconds.
///
/// Simultaneous-damage rule:
///   All damage values are computed first; state is written only afterwards.
///   Neither unit's death reduces the damage the other unit already dealt.
///
/// Positions come from Flame (VectorComponent.position) via [_getComponents].
/// Logical state (health, power, alive) comes from Riverpod.
///
/// ⚠️  Movement is NOT paused during combat. VectorComponent.update() runs
///     every frame independently — never block it from here.
/// ⚠️  Star-capture logic lives in astro_game.dart — do not merge them here.
class UnitCombatResolver {
  final Ref _ref;
  final Map<int, VectorComponent> Function() _getComponents;
  final void Function(int id) _removeComponent;

  static const Map<int, double> _collisionRadius = {
    1: 16.0,
    2: 24.0,
    3: 36.0,
  };

  /// Combat damage is applied once per second, not every frame.
  static const double _combatInterval = 1.0;
  double _timer = 0.0;

  UnitCombatResolver(
    this._ref,
    this._getComponents,
    this._removeComponent,
  );

  /// Call once per game tick from AstroGame.update(dt).
  void tick(double dt) {
    _timer += dt;
    if (_timer < _combatInterval) return;
    _timer -= _combatInterval;
    _resolveCombat();
  }

  void _resolveCombat() {
    final components = _getComponents();
    if (components.isEmpty) return;

    final playerVecs = components.values.where((c) => c.vector.owner == 'player').toList();
    final enemyVecs  = components.values.where((c) => c.vector.owner == 'enemy').toList();

    if (playerVecs.isEmpty || enemyVecs.isEmpty) return;

    // ── Task A: compute all damage before writing any ───────────────────────
    final Map<int, int> damageAccum = {};

    for (final pv in playerVecs) {
      for (final ev in enemyVecs) {
        final threshold = _radiusFor(pv.vector.tier) + _radiusFor(ev.vector.tier);
        if ((pv.position - ev.position).length > threshold) continue;

        damageAccum[pv.vector.id] = (damageAccum[pv.vector.id] ?? 0) + ev.vector.power;
        damageAccum[ev.vector.id] = (damageAccum[ev.vector.id] ?? 0) + pv.vector.power;
      }
    }

    if (damageAccum.isEmpty) return;

    // ── Apply damage to Riverpod state ───────────────────────────────────────
    final notifier = _ref.read(gameServiceProvider.notifier);
    for (final entry in damageAccum.entries) {
      notifier.damageVector(entry.key, entry.value);
    }

    // ── Task B: remove dead units ────────────────────────────────────────────
    final freshVectors = _ref.read(gameServiceProvider).vectors;
    for (final v in freshVectors) {
      if (!v.isAlive) {
        notifier.removeVector(v.id);
        _removeComponent(v.id);
      }
    }
  }

  static double _radiusFor(int tier) => _collisionRadius[tier] ?? 16.0;
}
