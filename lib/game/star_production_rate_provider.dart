import 'package:flutter/material.dart';
import 'package:astro_flux/models/star.dart';
import 'package:astro_flux/game/audio_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final starProductionRatesProvider = StreamProvider<Map<int, int>>((ref) {
  return Stream.fromIterable([1, 2, 3]).map((tier) => {
    1: 1,
    2: 3,
    3: 9
  }).asBroadcastStream();
});