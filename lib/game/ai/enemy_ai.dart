// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'dart:math' as math;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/game_state_provider.dart';

/// Passive enemy AI: every [captureInterval] seconds it picks one random
/// unowned star and marks it as enemy-owned (ownerId = 'enemy').
class EnemyAI {
  final Ref _ref;
  final Duration captureInterval;
  final math.Random _rng = math.Random();

  Timer? _timer;

  EnemyAI(this._ref, {this.captureInterval = const Duration(seconds: 30)});

  void start() {
    _timer?.cancel();
    _timer = Timer.periodic(captureInterval, (_) => _captureRandomStar());
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  void _captureRandomStar() {
    final notifier = _ref.read(gameServiceProvider.notifier);
    final unowned = notifier.stars.where((s) => s.ownerId.isEmpty).toList();
    if (unowned.isEmpty) return;
    final target = unowned[_rng.nextInt(unowned.length)];
    notifier.captureStar(target.id, 'enemy');
  }
}

/// Riverpod provider so AstroGame can watch / start / stop enemy AI.
final enemyAIProvider = Provider<EnemyAI>((ref) => EnemyAI(ref));
