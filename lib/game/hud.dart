// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/vector.dart';
import '../models/star.dart';
import '../providers/game_service_provider.dart';
import 'package:vector_math/vector_math.dart' hide Vector;

// Hide the import error for Vector by renaming it locally

class ThreatMeterWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameServiceProvider);
    double threatLevel = calculateThreatLevel(gameState.vectors, gameState.stars);

    return Container(
      width: 200,
      height: 30,
      alignment: Alignment.center,
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.red, width: 2),
        gradient: LinearGradient(
          colors: [Colors.red, Colors.orange],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [(threatLevel / 100).clamp(0.0, 1.0), (threatLevel / 100).clamp(0.0, 1.0)],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Threat Level: ',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '${threatLevel.toInt()}%',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  double calculateThreatLevel(List<Vector> vectors, List<Star> stars) {
    if (vectors.isEmpty || stars.isEmpty) return 0.0;

    double totalThreat = 0.0;
    for (final vector in vectors) {
      if (vector.owner == 'enemy') {
        double proximityFactor = 1.0;
        for (final star in stars.where((star) => star.ownerId == 'player')) {
          Vector2 distance = vector.position - star.position;
          double distanceToStar = distance.length;
          if (distanceToStar < 500.0) { // Consider threat within a 500 pixel radius
            proximityFactor += 1 / distanceToStar;
          }
        }
        totalThreat += vector.power * proximityFactor;
      }
    }

    double maxThreat = vectors
        .where((vector) => vector.owner == 'enemy')
        .map((vector) => vector.power)
        .reduce((max, power) => max + power);

    return (totalThreat / maxThreat * 100).clamp(0.0, 100.0);
  }
}
