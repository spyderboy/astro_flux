// ignore_for_file: depend_on_referenced_packages
import 'package:flame_audio/flame_audio.dart';

/// Manages game audio: idle engine loop and one-shot sound effects.
/// Audio files live in assets/audio/ (declared in pubspec.yaml).
class AudioService {
  bool _engineRunning = false;

  /// Preload audio assets. Call once during game initialisation.
  Future<void> initialize() async {
    await FlameAudio.audioCache.load('idle_engine.mp3');
  }

  /// Start the looping idle engine ambient sound.
  void startIdleEngine() {
    if (_engineRunning) return;
    FlameAudio.bgm.play('idle_engine.mp3', volume: 0.3);
    _engineRunning = true;
  }

  /// Stop the idle engine sound.
  void stopIdleEngine() {
    if (!_engineRunning) return;
    FlameAudio.bgm.stop();
    _engineRunning = false;
  }

  /// Play a one-shot sound effect.
  Future<void> playEffect(String filename, {double volume = 1.0}) async {
    await FlameAudio.play(filename, volume: volume);
  }

  /// Release all audio resources.
  void dispose() {
    FlameAudio.bgm.stop();
    _engineRunning = false;
  }
}
