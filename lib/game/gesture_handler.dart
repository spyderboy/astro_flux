// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class GestureHandler {
  final Ref ref;
  Vector2? _tapPosition;
  int _lastTapTime = 0;
  void Function(int starId)? onDoubleTapStar;

  Vector2? _dragStart; // Added field for drag start position

  GestureHandler(this.ref);

  void onTapDown(TapDownEvent event) async {
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    if (_tapPosition != null && (currentTime - _lastTapTime) < 300) {
      // Double tap detected
      print('Double tap detected at position: ${event.localPosition}');
      if (onDoubleTapStar != null) {
        // Handle double tap logic here
        onDoubleTapStar!(/* Implement logic to find star ID at this position */);
      }
      return;
    }

    _tapPosition = Vector2(event.localPosition.dx, event.localPosition.dy);
    _lastTapTime = currentTime;
  }
}