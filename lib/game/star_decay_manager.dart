// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:astro_flux/models/star.dart';
import 'package:astro_flux/game/audio_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/systems/local_persistence_service.dart';

class StarDecayManager {
  Timer _timer;

  StarDecayManager() : _timer = Timer(Duration.zero, () {});

  void startDecayTimer(int decayInterval) {
    _timer.cancel();
    _timer = Timer(Duration(seconds: decayInterval), () {
      // Decay logic here
    });
  }
}