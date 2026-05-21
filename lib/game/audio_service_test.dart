// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:astro_flux/game/audio_service.dart';

void main() {
  group('AudioService', () {
    test('Play capture success audio', () async {
      await AudioService.playCaptureSuccessAudio();
      expect(FlameAudio.bgm.played, isTrue);
    });
  });
}