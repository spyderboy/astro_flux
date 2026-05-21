// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/utils/cooldown_timer.dart';
import 'package:fake_async/fake_async.dart';

void main() {
  group('CooldownTimer', () {
    late CooldownTimer timer;

    setUp(() {
      timer = CooldownTimer();
    });

    test('initial state is inactive', () {
      expect(timer.isActive(), isFalse);
      expect(timer.progress, 0.0);
      expect(timer.remainingDuration, Duration.zero);
    });

    test('starts timer correctly', () {
      const duration = Duration(seconds: 5);
      timer.start(duration);

      expect(timer.isActive(), isTrue);
      expect(timer.progress, 1.0);
      expect(timer.remainingDuration, duration);
    });

    test('updates correctly over time using simulated clock', () {
      fakeAsync((async) {
        const duration = Duration(seconds: 10);
        timer.start(duration);

        // Simulate 5 seconds passing via manual update
        timer.update(5.0);
        expect(timer.progress, 0.5);
        expect(timer.remainingDuration, const Duration(seconds: 5));
        expect(timer.isActive(), isTrue);

        // Simulate another 5 seconds passing
        timer.update(5.0);
        expect(timer.progress, 0.0);
        expect(timer.remainingDuration, Duration.zero);
        expect(timer.isActive(), isFalse);

        // Simulate overflow
        timer.update(2.0);
        expect(timer.progress, 0.0);
        expect(timer.isActive(), isFalse);

        async.flushMicrotasks();
      });
    });

    test('reset stops the timer', () {
      timer.start(const Duration(seconds: 10));
      expect(timer.isActive(), isTrue);

      timer.reset();
      expect(timer.isActive(), isFalse);
      expect(timer.progress, 0.0);
      expect(timer.remainingDuration, Duration.zero);
    });
  });
}
