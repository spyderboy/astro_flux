// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/models/mote.dart';
import 'package:astro_flux/models/star.dart';
import 'package:astro_flux/game/astro_game_state_provider.dart';
import 'capture_event_notifier.dart';

void main() {
  test('CaptureEventNotifier should notify capture success', () async {
    final ref = ProviderContainer();
    final gameStateProvider = AstroGameStateProvider(ref);
    final notifier = CaptureEventNotifier(gameStateProvider.state);

    // Simulate a successful capture
    gameStateProvider.notifyCapture(1, 2);

    await expectLater(() => notifier.notifyCaptureSuccess(1, 2), returnsNormally);
  });

  test('CaptureEventNotifier should play capture success audio', () async {
    final ref = ProviderContainer();
    final gameStateProvider = AstroGameStateProvider(ref);
    final notifier = CaptureEventNotifier(gameStateProvider.state);

    // Mock AudioService.play to check if it's called
    final mockAudioService = MockAudioService();
    replace(AudioService, () => mockAudioService);

    await expectLater(() => notifier.notifyCaptureSuccess(1, 2), returnsNormally);

    verify(mockAudioService.play('capture_success.mp3')).called(1);
  });
}
class MockAudioService {
  void play(String filename) {}
}