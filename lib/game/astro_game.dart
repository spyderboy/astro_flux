// ignore_for_file: depend_on_referenced_packages
import 'package:flame/game.dart' hide Vector;
import 'package:flame/components.dart' hide Vector;
import 'package:flame/events.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/mote.dart';
import 'package:astro_flux/models/vector.dart';
import 'package:astro_flux/models/star.dart';
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:astro_flux/components/star_component.dart';
import 'package:astro_flux/components/mote_component.dart';
import 'package:astro_flux/components/vector_component.dart';
import 'package:astro_flux/game/unit_combat_resolver.dart';
import 'package:astro_flux/game/fusion_rules.dart';
import 'package:astro_flux/game/gesture_handler.dart';
import 'package:astro_flux/game/ai/enemy_ai.dart';
import 'package:astro_flux/systems/mote_production_system.dart';
import 'package:astro_flux/game/ai/aggressive_ai.dart';
import 'package:flame/camera.dart';
import 'audio_service.dart';

const double _minZoom = 0.4;
const double _maxZoom = 2.0;

/// Top-level Flame game.
///
/// Architecture:
///   Riverpod (gameServiceProvider) — logical state: ownership, health, mote counts.
///   Flame components — visual/spatial state: world positions, movement, rendering.
///   _vectorComponents — bridge: maps Vector.id → live VectorComponent.
///
/// Gameplay loop:
///   1. Player taps a star → all player VectorComponents march toward it.
///   2. VectorComponent.update(dt) moves the unit each frame.
///   3. On arrival → captureStar() written to Riverpod.
///   4. UnitCombatResolver.tick() detects enemy↔player collisions, resolves damage.
///   5. Dead vectors removed from both Riverpod state and Flame world.
///   6. Auto-fusion: 10 active motes → new player VectorComponent spawned.
///
/// Gesture contract:
///   ScaleDetector → on AstroGame (FlameGame) for pinch-zoom + two-finger pan.
///   TapCallbacks  → on GestureHandler (PositionComponent) for single-finger taps.
///
/// ⚠️  ScaleDetector MUST be on FlameGame — never on a PositionComponent.
/// ⚠️  info.delta.global and info.scale.global are already Vector2 — no .toVector2().
/// ⚠️  GameCore does NOT exist — always use AstroGame directly.
class AstroGame extends FlameGame with ScaleDetector {
  final Ref _ref;
  final AudioService _audio = AudioService();
  double _startZoom = 1.0;

  // ── Gameplay systems (initialised in onLoad) ────────────────────────────────
  late final UnitCombatResolver _unitCombatResolver;

  // ── Star world-space positions, keyed by Star.id ───────────────────────────
  final Map<int, Vector2> _starPositions = {};

  // ── Live VectorComponents, keyed by Vector.id ──────────────────────────────
  final Map<int, VectorComponent> _vectorComponents = {};

  // The star that player vectors are currently marching toward (null = idle).
  int? _playerTargetStarId;

  // Auto-increment id for newly spawned vectors.
  int _nextVectorId = 100;

  AstroGame(this._ref);

  // Convenience accessors
  List<Mote> get motes   => _ref.read(gameServiceProvider).motes;
  List<Vector> get vectors => _ref.read(gameServiceProvider).vectors;
  List<Star> get stars   => _ref.read(gameServiceProvider).stars;

  @override
  Color backgroundColor() => const Color(0xFF050510);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await _audio.initialize();
    _audio.startIdleEngine();

    _unitCombatResolver = UnitCombatResolver(
      _ref,
      () => _vectorComponents,
      _removeVectorComponent,
    );

    _ref.read(enemyAIProvider).start();

    final w = size.x;
    final h = size.y;

    // ── Stars ──────────────────────────────────────────────────────────────────
    final starPosList = [
      Vector2(w * 0.5, h * 0.2),
      Vector2(w * 0.2, h * 0.7),
      Vector2(w * 0.8, h * 0.7),
    ];

    final starData = _ref.read(gameServiceProvider).stars;
    for (var i = 0; i < starData.length && i < starPosList.length; i++) {
      final pos = starPosList[i];
      _starPositions[starData[i].id] = pos;
      add(StarComponent(star: starData[i], position: pos));
    }

    // ── Initial motes (decorative, static positions) ───────────────────────────
    final moteData = _ref.read(gameServiceProvider).motes;
    final motePosList = [
      Vector2(w * 0.50, h * 0.45),
      Vector2(w * 0.38, h * 0.52),
      Vector2(w * 0.62, h * 0.52),
      Vector2(w * 0.42, h * 0.62),
      Vector2(w * 0.58, h * 0.62),
    ];
    for (var i = 0; i < moteData.length && i < motePosList.length; i++) {
      add(MoteComponent(mote: moteData[i], position: motePosList[i]));
    }

    // ── Seed 2 player VectorComponents near the top star ───────────────────────
    final homePos = starPosList.isNotEmpty
        ? starPosList[0]
        : Vector2(w * 0.5, h * 0.5);

    _spawnVectorComponent(id: 1, owner: 'player', tier: 1,
        spawnPos: homePos + Vector2(-24, 40));
    _spawnVectorComponent(id: 2, owner: 'player', tier: 1,
        spawnPos: homePos + Vector2(24, 40));
    _nextVectorId = 3;

    // ── Gesture handler (full-screen, single-finger taps) ──────────────────────
    add(GestureHandler(
      ref: _ref,
      starPositions: _starPositions,
      onStarTapped: _onStarTapped,
      size: size,
    ));

    // ── Mote production system ─────────────────────────────────────────────────
    add(MoteProductionSystem(_ref));
  }

  // ── Game loop ───────────────────────────────────────────────────────────────

  @override
  void update(double dt) {
    super.update(dt);
    _unitCombatResolver.tick(dt);
    _checkAutoFusion();
  }

  // ── Vector lifecycle helpers ────────────────────────────────────────────────

  /// Register a vector in Riverpod and add its Flame component to the world.
  VectorComponent _spawnVectorComponent({
    required int id,
    required String owner,
    required int tier,
    required Vector2 spawnPos,
    Vector2? target,
  }) {
    _ref.read(gameServiceProvider.notifier).addVector(id, owner: owner, tier: tier);

    final comp = VectorComponent(
      vector: Vector(id: id, owner: owner, tier: tier),
      position: spawnPos.clone(),
      target: target,
      onArrived: _onVectorArrived,
    );
    _vectorComponents[id] = comp;
    add(comp);
    return comp;
  }

  /// Remove a VectorComponent from Flame world and the bridge map.
  void _removeVectorComponent(int id) {
    _vectorComponents[id]?.removeFromParent();
    _vectorComponents.remove(id);
  }

  // ── Gesture callbacks ───────────────────────────────────────────────────────

  /// Player tapped a star: send all player VectorComponents toward it.
  void _onStarTapped(int starId) {
    final target = _starPositions[starId];
    if (target == null) return;

    // Skip if player already owns this star
    final star = _ref.read(gameServiceProvider).stars
        .where((s) => s.id == starId)
        .firstOrNull;
    if (star?.ownerId == 'player') return;

    _playerTargetStarId = starId;

    for (final vc in _vectorComponents.values) {
      if (vc.vector.owner == 'player') {
        vc.setTarget(target.clone());
      }
    }
  }

  /// A player VectorComponent arrived at its target star — capture it.
  void _onVectorArrived(VectorComponent vc) {
    if (vc.vector.owner != 'player') return;
    final starId = _playerTargetStarId;
    if (starId == null) return;

    _ref.read(gameServiceProvider.notifier).captureStar(starId, 'player');
    _playerTargetStarId = null;
  }

  // ── Auto-fusion ─────────────────────────────────────────────────────────────

  /// 10 active motes → fuse into a new player VectorComponent.
  void _checkAutoFusion() {
    final state = _ref.read(gameServiceProvider);
    if (!FusionRules.canFuse(state)) return;

    final activeMotes = state.motes
        .where((m) => m.isActive)
        .take(FusionRules.fusionThreshold)
        .toList();

    final notifier = _ref.read(gameServiceProvider.notifier);
    for (final mote in activeMotes) {
      notifier.removeMote(mote.id);
    }

    // Spawn near centroid of existing player vectors, or near first star
    Vector2 spawnPos;
    final playerComps = _vectorComponents.values
        .where((c) => c.vector.owner == 'player')
        .toList();
    if (playerComps.isNotEmpty) {
      final sum = playerComps.fold(
        Vector2.zero(),
        (acc, c) => acc + c.position,
      );
      spawnPos = sum / playerComps.length.toDouble();
    } else if (_starPositions.isNotEmpty) {
      spawnPos = _starPositions.values.first.clone();
    } else {
      spawnPos = Vector2(size.x * 0.5, size.y * 0.5);
    }

    final newId = _nextVectorId++;
    _ref.read(gameServiceProvider.notifier).addVector(newId, owner: 'player', tier: 1);

    final comp = VectorComponent(
      vector: Vector(id: newId, owner: 'player', tier: 1),
      position: spawnPos + Vector2(0, 30),
      onArrived: _onVectorArrived,
    );
    _vectorComponents[newId] = comp;
    add(comp);

    // If there's an active march target, send the new unit there too
    final targetStarId = _playerTargetStarId;
    if (targetStarId != null) {
      final target = _starPositions[targetStarId];
      if (target != null) comp.setTarget(target.clone());
    }
  }

  // ── Pinch-to-zoom + two-finger pan ─────────────────────────────────────────
  // ScaleDetector MUST be on FlameGame — never on a PositionComponent.

  @override
  void onScaleStart(ScaleStartInfo info) {
    _startZoom = camera.viewfinder.zoom;
  }

  @override
  void onScaleUpdate(ScaleUpdateInfo info) {
    if (info.pointerCount >= 2) {
      final newZoom = (_startZoom * info.scale.global.x).clamp(_minZoom, _maxZoom);
      camera.viewfinder.zoom = newZoom;
      camera.viewfinder.position -= info.delta.global / camera.viewfinder.zoom;
    }
  }

  @override
  void onRemove() {
    _ref.read(enemyAIProvider).stop();
    _audio.dispose();
    super.onRemove();
  }
}
