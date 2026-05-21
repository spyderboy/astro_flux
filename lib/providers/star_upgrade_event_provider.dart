// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart' show Color;
import 'package:flame/components.dart';

/// Represents an event triggered when a star is upgraded.
class StarUpgradeEvent {
  final Vector2 position;
  final int newTier;
  final Color color;

  const StarUpgradeEvent(this.position, this.newTier, this.color);
}

/// Provider that holds the last star upgrade event for visual effects.
final starUpgradeEventProvider = StateProvider<StarUpgradeEvent?>((ref) => null);