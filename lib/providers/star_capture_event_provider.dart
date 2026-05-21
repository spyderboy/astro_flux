import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:ui';
import 'package:flame/components.dart';

class StarCaptureEvent {
  final Vector2 position;
  final Color color;
  StarCaptureEvent({required this.position, required this.color});
}

final starCaptureEventProvider = StateProvider<StarCaptureEvent?>((ref) => null);