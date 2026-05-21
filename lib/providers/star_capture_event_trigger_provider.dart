// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Represents a visual event triggered when a star is captured.
class StarCaptureEvent {
  final Offset position;
  final Color color;
  const StarCaptureEvent({required this.position, required this.color});
}

final _eventController = StreamController<StarCaptureEvent>.broadcast();

/// Stream provider that allows components to listen for star capture visual effects.
final starCaptureEventProvider = StreamProvider<StarCaptureEvent>((ref) {
  return _eventController.stream;
});

/// Provider that provides a trigger function to dispatch star capture events.
final starCaptureEventTriggerProvider = Provider<void Function(Offset, Color)>((ref) {
  return (Offset position, Color color) {
    _eventTokens.add(StarCaptureEvent(position: position, color: color));
  };
});

// Internal helper to avoid direct controller exposure.
final _eventTokens = _eventController;
