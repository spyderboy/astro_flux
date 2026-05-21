// ignore_for_file: depend_on_referenced_packages
import 'package:flame_audio/flame_audio.dart';

/// Manages game audio: idle engine loop and one-shot sound effects.
/// Canonical import: package:astro_flux/services/audio_service.dart
class AudioService {
  bool _engineRunning = false;

  Future<void> initialize() async {
    await FlameAudio.audioCache.load('idle_engine.mp3');
  }

  void startIdleEngine() {
    if (_engineRunning) return;
    FlameAudio.bgm.play('idle_engine.mp3', volume: 0.3);
    _engineRunning = true;
  }

  void stopIdleEngine() {
    if (!_engineRunning) return;
    FlameAudio.bgm.stop();
    _engineRunning = false;
  }

  Future<void> playEffect(String filename, {double volume = 1.0}) async {
    await FlameAudio.play(filename, volume: volume);
  }

  void dispose() {
    FlameAudio.bgm.stop();
    _engineRunning = false;
  }
}
