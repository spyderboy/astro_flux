// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Represents a visual event triggered during combat.
class CombatEvent {
  final Offset position;
  final double intensity; // 0.0 to 1.0
  final Color color;

  const CombatEvent({
    required this.position,
    required this.intensity,
    required this.color,
  });
}

final _eventController = StreamController<CombatEvent>.broadcast();

/// Stream provider that allows components to listen for combat visual effects.
final combatEventProvider = StreamProvider<CombatEvent?>((ref) {
  return _eventController.stream;
});

/// Provider that provides a trigger function to dispatch combat events.
final combatEventTriggerProvider = Provider<void Function(Offset, double, Color)>((ref) {
  return (Offset position, double intensity, Color color) {
    _eventController.add(CombatEvent(
      position: position,
      intensity: intensity,
      color: color,
    ));
  };
});