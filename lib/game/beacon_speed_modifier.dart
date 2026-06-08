// ignore_for_file: depend_on_referenced_packages
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flame/components.dart';
import 'package:astro_flux/models/vector.dart';
import 'package:astro_flux/game/audio_service.dart';
import 'package:astro_flux/models/game_state_provider.dart';

const double beaconRange = 100.0;

class BeaconSpeedModifier {
  final Vector2 _beaconPosition;

  BeaconSpeedModifier(this._beaconPosition);

  void tick(double dt, List<Vector> vectors) {
    for (var vector in vectors) {
      if (_isWithinRange(vector.position)) {
        vector.speedMultiplier = 1.3;
      } else {
        vector.speedMultiplier = 1.0;
      }
    }
  }

  bool _isWithinRange(Vector2 position) {
    return (position - _beaconPosition).length <= beaconRange;
  }
}