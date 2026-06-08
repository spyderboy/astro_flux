// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/mote.dart';
import 'package:astro_flux/models/star.dart';
import 'package:astro_flux/providers/game_state_provider.dart';
import 'capture_event_notifier.dart';

class MockAudioService {
  void play(String filename) {}
}

void main() {
  test('CaptureEventNotifier should notify capture success', () async {
    final container = ProviderContainer();
    final notifier = CaptureMessageNotifier(container);
    final provider = NotifierProvider<CaptureMessageNotifier, String>(
      () => notifier,
    );

    // Simulate a successful capture
    notifier.showCaptureSuccess('Success message');

    await expectLater(() => container.read(provider), completion('Success message'));
  });

  test('CaptureEventNotifier should play capture success audio', () async {
    final container = ProviderContainer();
    final notifier = CaptureMessageNotifier(container);
    final provider = NotifierProvider<CaptureMessageNotifier, String>(
      () => notifier,
    );

    // Mock AudioService.play to check if it's called
    final mockAudioService = MockAudioService();
    replace(AudioService, () => mockAudioService);

    notifier.showCaptureSuccess('Success message');

    verify(mockAudioService.play('capture_success.mp3')).called(1);
  });
}
