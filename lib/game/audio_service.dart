// ignore_for_file: depend_on_referenced_packages
import 'package:flame_audio/flame_audio.dart';

class AudioService {
  final double sfxVolume = 1.0;
  bool musicEnabled = true;

  void play(String filename) {
    FlameAudio.play(filename, volume: sfxVolume);
  }

  void bgmPlay(String filename, {double? volume}) {
    if (!musicEnabled) return;
    FlameAudio.bgm.play(filename, volume: (volume ?? 1.0) * sfxVolume);
  }

  void stopBgm() {
    FlameAudio.bgm.stop();
  }
}