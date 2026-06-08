// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'dart:math' as math;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:flame/components.dart';
// Add imports for Vector and Star models
import 'package:astro_flux/models/vector.dart';
import 'package:astro_flux/models/star.dart';
import 'package:flutter/material.dart'; // Added to import difficulty level
const double _easyMultiplier = 1.0;
const double _mediumMultiplier = 1.25;
const double _hardMultiplier = 1.5;
class EnemyAI {
  final Ref _ref;
  final Duration captureInterval;
  final Duration expanderInterval = const Duration(seconds: 30);
  final Duration idleTimeout = const Duration(seconds: 5);
  final math.Random _rng = math.Random();
  Timer? _timer;
  Timer? _expanderTimer;
  // Map to track last target time for each enemy unit
  final Map<int, DateTime> _lastTargetTime = {};
  double _tickMultiplier = 1.0; // Initialize with a default value
  AiStrategy _strategy;

  EnemyAI(this._ref, {this.captureInterval = const Duration(seconds: 30)})
      : _strategy = AiStrategy.values[_rng.nextInt(AiStrategy.values.length)] {
    startExpanderStrategy();
    _setTickMultiplier();
  }

  void _setTickMultiplier() {
    final difficulty = _ref.read(difficultyProvider);
    switch (difficulty) {
      case 'easy':
        _tickMultiplier = _easyMultiplier;
        break;
      case 'medium':
        _tickMultiplier = _mediumMultiplier;
        break;
      case 'hard':
        _tickMultiplier = _hardMultiplier;
        break;
    }
  }

  void start() {
    _timer?.cancel();
    _timer = Timer.periodic(captureInterval * _tickMultiplier, (_) => _captureRandomStar());
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
    _expanderTimer?.cancel();
    _expanderTimer = null;
  }

  void startExpanderStrategy() {
    _expanderTimer?.cancel();
    _expanderTimer = Timer.periodic(expanderInterval * _tickMultiplier, (_) => _expanderRouteEnemyUnits());
  }

  void tick(double dt) {
    _homeDefense();
    _idlePrevention();
  }

  void _captureRandomStar() {
    final notifier = _ref.read(gameServiceProvider.notifier);
    final unowned = notifier.stars.where((s) => s.ownerId.isEmpty).toList();
    if (unowned.isEmpty) return;
    final target = unowned[_rng.nextInt(unowned.length)];
    notifier.captureStar(target.id, 'enemy');
  }

  void _expanderRouteEnemyUnits() {
    final notifier = _ref.read(gameServiceProvider.notifier);
    final idleEnemies = notifier.vectors.where((v) => v.owner == 'enemy' && v.currentHealth > 0).toList();
    if (idleEnemies.isEmpty) return;

    // Find the player's lowest-HP star
    Star? targetStar;
    int minHealth = double.maxFinite.toInt();
    for (final star in notifier.stars) {
      if (star.ownerId == 'player') {
        final totalHealth = idleEnemies.where((v) => v.position.distanceTo(Vector2(star.id.toDouble(), 0)) < 10).fold(0, (sum, v) => sum + v.currentHealth);
        if (totalHealth < minHealth) {
          minHealth = totalHealth;

... [truncated at 3000 chars]
