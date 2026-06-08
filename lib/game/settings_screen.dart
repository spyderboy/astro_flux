// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibration/vibration.dart'; // Add haptic feedback package
import 'package:astro_flux/game/audio_service.dart';
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:package_info_plus/package_info_plus.dart';

bool _reducedMotionEnabled = false;
bool _musicEnabled = true; // New variable for music toggle state
bool _largerTapTargetsEnabled = false;
double _tapTargetRadiusMultiplier = 1.0; // Default multiplier
bool _colorblindModeEnabled = false; // New variable for colorblind mode toggle state
bool _largeFontSizeEnabled = false; // New variable for large font size toggle state
double _fontSizeMultiplier = 1.0; // Default multiplier for font size
bool _autoDefendEnabled = false; // New variable for auto-defend toggle state

const defaultTextSize = 20.0;

defaultHudFontSize() {
  return _largeFontSizeEnabled ? defaultTextSize * _fontSizeMultiplier : defaultTextSize;
}

Color getPlayerColor(bool isEnemy, bool colorblind) {
  if (colorblind) {
    return isEnemy ? Colors.orange : Colors.blue;
  } else {
    return isEnemy ? Colors.red : Colors.cyan;
  }
}

void setColorblindMode(bool enabled) {
  _colorblindModeEnabled = enabled;
}

bool isColorblindModeEnabled() {
  return _colorblindModeEnabled;
}

void setReducedMotion(bool enabled) {
  _reducedMotionEnabled = enabled;
}

bool isReducedMotionEnabled() {
  return _reducedMotionEnabled;
}

void setMusicEnabled(bool enabled, WidgetRef ref) {
  _musicEnabled = enabled;
  // Update the music state in AudioService
  ref.read(audioServiceProvider.notifier).setMusicEnabled(enabled);
}

bool isMusicEnabled() {
  return _musicEnabled;
}

void toggleLargerTapTargets(WidgetRef ref) {
  _largerTapTargetsEnabled = !_largerTapTargetsEnabled;
  _tapTargetRadiusMultiplier = _largerTapTargetsEnabled ? 1.5 : 1.0;
  // Update the tap target size in GestureHandler
  ref.read(gameServiceProvider.notifier).setTapTargetSize(_tapTargetRadiusMultiplier);
}

bool isLargerTapTargetsEnabled() {
  return _largerTapTargetsEnabled;
}

void toggleLargeFontSize(bool enabled) {
  _largeFontSizeEnabled = enabled;
  _fontSizeMultiplier = _largeFontSizeEnabled ? 1.5 : 1.0;
}

bool isLargeFontSizeEnabled() {
  return _largeFontSizeEnabled;
}

void setAutoDefend(bool enabled, WidgetRef ref) {
  _autoDefendEnabled = enabled;
  // Update the auto-defend state in AstroGame
  ref.read(gameServiceProvider.notifier).setAutoDefend(enabled);
}

bool isAutoDefendEnabled() {
  return _autoDefendEnabled;
}

class SettingsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) async {
    final audioService = ref.watch(audioServiceProvider);
    final hapticEnabled = await Vibration.hasVibrator(); // Check if device supports vibration
    bool largerTapTargets = isLargerTapTargetsEnabled();
    bool colorblindMode = isColorblindModeEnabled();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[ 
          ListTile(
            title: Text('Version'),
            subtitle: Text('${packageInfo.version} (${packageInfo.buildNumber})'),
          ),
          // ... other settings list tiles
        ],
      ),
    );
  }
}