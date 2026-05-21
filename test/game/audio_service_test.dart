// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/game/audio_service.dart';

void main() {
  group('AudioService', () {
    test('plays background music without errors', () async {
      try {
        await FlameAudio.bgm.play('bgm.mp3');
        expect(FlameAudio.bgm.isPlaying, isTrue);
      } catch (e) {
        fail('Failed to play background music: $e');
      }
    });

    test('stops background music without errors', () async {
      try {
        await FlameAudio.bgm.play('bgm.mp3');
        await Future.delayed(Duration(seconds: 1));
        await FlameAudio.bgm.stop();
        expect(FlameAudio.bgm.isPlaying, isFalse);
      } catch (e) {
        fail('Failed to stop background music: $e');
      }
    });

    test('pauses and resumes background music without errors', () async {
      try {
        await FlameAudio.bgm.play('bgm.mp3');
        await Future.delayed(Duration(seconds: 1));
        await FlameAudio.bgm.pause();
        expect(FlameAudio.bgm.isPlaying, isFalse);

        await Future.delayed(Duration(seconds: 1));
        await FlameAudio.bgm.resume();
        expect(FlameAudio.bgm.isPlaying, isTrue);
      } catch (e) {
        fail('Failed to pause and resume background music: $e');
      }
    });
  });
}