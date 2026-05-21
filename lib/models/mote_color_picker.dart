// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';

class MoteColorPicker {
  static const List<Color> _neonCyanBlueSpectrum = [
    Color(0xFF00FFFF),
    Color(0xFF00DDFF),
    Color(0xFF00BBFF),
    Color(0xFF0099FF),
    Color(0xFF0077FF),
    Color(0xFF0055FF),
  ];

  static Color pickColor(int id) {
    final index = id % _neonCyanBlueSpectrum.length;
    return _neonCyanBlueSpectrum[index];
  }

  static Color get primary => _neonCyanBlueSpectrum[0];
  static Color get secondary => _neonCyanBlueSpectrum[3];
  static Color get accent => _neonCyanBlueSpectrum[5];
}