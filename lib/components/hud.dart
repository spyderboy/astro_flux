// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flame/components.dart';
import 'package:astro_flux/models/game_state_provider.dart';

/// A component that renders a territory bar at the bottom of the screen.
/// The bar is split into cyan and red showing relative star ownership percent.
class TerritoryBar extends PositionComponent {
  final GameStateNotifier gameState;

  TerritoryBar(this.gameState) : super(
    size: Vector2(300.0, 20.0),
    anchor: Anchor.bottomCenter,
    position: Vector2.zero(),
  );

  @override
  void update(double dt) {
    // This component does not need to update.
  }

  @override
  void render(Canvas canvas) {
    final Paint paint = Paint()
      ..style = PaintingStyle.fill;

    int cyanStars = gameState.stars.where((star) => star.ownerId == 'player').length;
    int redStars = gameState.stars.where((star) => star.ownerId == 'enemy').length;
    double totalStars = cyanStars + redStars;

    if (totalStars > 0) {
      double cyanPercent = cyanStars / totalStars;
      double redPercent = redStars / totalStars;

      // Cyan bar
      paint.color = Color(0xFF00DDFF);
      canvas.drawRect(Rect.fromLTWH(0, 0, size.x * cyanPercent, size.y), paint);

      // Red bar
      paint.color = Color(0xFFFF3366);
      canvas.drawRect(Rect.fromLTWH(size.x * cyanPercent, 0, size.x * redPercent, size.y), paint);
    }
  }
}