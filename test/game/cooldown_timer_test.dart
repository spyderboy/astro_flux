// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/test.dart';
import 'package:astro_flux/utils/cooldown_timer.dart';

void main() {
  group('CooldownTimer', () {
    test('starts with zero remaining time', () {
      final timer = CooldownTimer();
      expect(timer.remainingDuration, Duration.zero);
    });

    test('sets the correct total and remaining time when started', () {
      final duration = Duration(seconds: 5);
      final timer = CooldownTimer()..start(duration);
      expect(timer.totalSeconds, duration.inSeconds.toDouble());
      expect(timer.remainingSeconds, duration.inSeconds.toDouble());
    });

    test('decreases remaining time by dt', () {
      final duration = Duration(seconds: 5);
      final timer = CooldownTimer()..start(duration);
      timer.update(1.0);
      expect(timer.remainingDuration, Duration(seconds: 4));
    });

    test('cannot go below zero remaining time', () {
      final duration = Duration(seconds: 5);
      final timer = CooldownTimer()..start(duration);
      timer.update(6.0);
      expect(timer.remainingDuration, Duration.zero);
    });

    test('resets to zero when reset is called', () {
      final duration = Duration(seconds: 5);
      final timer = CooldownTimer();
      timer.start(duration);
      timer.reset();
      expect(timer.remainingDuration, Duration.zero);
    });
  });
}