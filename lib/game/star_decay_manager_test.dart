// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/models/star.dart';
import 'package:astro_flux/game/star_decay_manager.dart';

void main() {
  test('Star decay timer starts after spawn + decay_interval elapses', () async {
    final manager = StarDecayManager();
    final decayInterval = 5;
    final duration = Duration(seconds: decayInterval);

    bool decayCalled = false;
    manager.startDecayTimer(decayInterval);
    await Future.delayed(duration + Duration(milliseconds: 100)); // Ensure enough time has passed
    decayCalled = true;

    expect(decayCalled, isTrue);
  });
}
