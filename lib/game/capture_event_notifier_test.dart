// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/game/audio_service.dart';
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:astro_flux/systems/local_persistence_service.dart';
import 'package:astro_flux/game/capture_event_notifier.dart';

void main() {
  ProviderContainer container;
  CaptureEventNotifier notifier;

  setUp(() {
    container = ProviderContainer();
    addTearDown(container.dispose);
    final gameStateProvider = GameStateNotifier(LocalPersistenceService())
      ..addStar(1, 2)
      ..addMote(10); // Adding enough motes to fuse into a vector
    notifier = CaptureEventNotifier(gameStateProvider);
  });

  test('notifies capture success', () {
    final playAudioSpy = () async {};
    AudioService.play = playAudioSpy;

    notifier.notifyCaptureSuccess(1, 1);

    expect(playAudioSpy, calledOnce);
  });
}
