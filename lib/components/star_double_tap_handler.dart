// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import 'package:flame/flame_audio.dart';
import '../models/game_state_provider.dart';
import '../game/audio_service.dart';
import '../components/mote_component.dart';

/// A component that handles double-tap events to absorb nearby player motes into a star.
class StarDoubleTapHandler extends Component with DoubleTapCallbacks {
  final List<Star> stars;
  final List<MoteComponent> moteComponents;
  final ParticleSystem particleSystem;
  final AudioService audioService;

  static const double _tapRadius = 100.0;
  static const double _moteCaptureDistance = 80.0;

  StarDoubleTapHandler({
    required this.stars,
    required this.moteComponents,
    required this.particleSystem,
    required this.audioService,
  });

  @override
  void onDoubleTapUp(TapUpInfo info) {
    final tapPosition = info.eventPosition.canvas;
    final nearestStar = stars.firstWhereOrNull((star) {
      return (Vector2(star.id.toDouble(), star.id.toDouble()) - tapPosition).length <= _tapRadius;
    });

    if (nearestStar != null && nearestStar.ownerId == 'player') {
      audioService.play('mote_capture');
      for (final moteComponent in moteComponents) {
        if (moteComponent.owner == 'player' &&
            (moteComponent.position - tapPosition).length <= _moteCaptureDistance) {
          ref.read(gameServiceProvider.notifier).removeMote(moteComponent.id);
          moteComponent.removeFromParent();
          nearestStar.accumulatedPower++;
        }
      }
    }
  }
}