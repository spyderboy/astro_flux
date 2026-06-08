// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/star.dart';
import '../models/vector.dart';
import '../providers/game_service_provider.dart';
import 'dart:async';
import 'package:flame/components.dart';

// Hide the import error for Vector by renaming it locally
import 'package:vector_math/vector_math.dart' hide Vector;

class MinimapHUDWidget extends StatefulWidget {
  @override
  _MinimapHUDWidgetState createState() => _MinimapHUDWidgetState();
}

class _MinimapHUDWidgetState extends State<MinimapHUDWidget> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 250), (timer) {
      setState(() {});
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final gameState = ref.watch(gameServiceProvider);
        final cameraBounds = ref.watch(cameraBoundsProvider);
        return Container(
          width: 80,
          height: 80,
          color: Colors.black,
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(8.0),
          child: CustomPaint(
            size: Size(64, 64),
            painter: MinimapPainter(stars: gameState.stars, vectors: gameState.vectors, cameraBounds: cameraBounds),
          ),
        );
      },
    );
  }
}

class MinimapPainter extends CustomPainter {
  final List<Star> stars;
  final List<Vector> vectors;
  final Rect cameraBounds;

  MinimapPainter({required this.stars, required this.vectors, required this.cameraBounds});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    for (final star in stars) {
      paint.color = _getStarColor(star);
      paint.style = PaintingStyle.fill;
      // Assuming position is a Vector2 within Star model
      canvas.drawCircle(
        Offset(size.width * (star.position.x / 100), size.height * (star.position.y / 100)),
        2.0,
        paint,
      );
    }

    for (final vector in vectors) {
      if (vector.owner == 'enemy') {
        final distanceToNearestPlayerStar = _calculateDistanceToNearestPlayerStar(vector, stars);
        if (distanceToNearestPlayerStar > 200.0) {
          continue;
        }
        paint.color = Colors.red; // Flash red border for enemy units within 80px of player home star
      } else {
        paint.color = _getVectorColor(vector);
      }
      paint.style = PaintingStyle.fill;
      // Assuming position is a Vector2 within Vector model
      canvas.drawCircle(
        Offset(size.width * (vector.position.x / 100), size.height * (vector.position.y / 100)),
        2.0,
        paint,
      );
    }
  }

  Color _getStarColor(Star star) {
    switch (star.ownerId) {
      case 'player':
        return Colors.cyan;
      case 'enemy':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Color _getVectorColor(Vector vector) {
    switch (vector.tier) {
      case 1:
        return Colors.cyan;
      case 2:
        return Colors.mint;
      case 3:
        return Colors.gold;
      default:
        return Colors.red;
    }
  }

  double _calculateDistanceToNearestPlayerStar(Vector vector, List<Star> stars) {
    double minDistance = double.infinity;
    for (final star in stars) {
      if (star.ownerId == 'player') {
        final distance = vector.position.distanceTo(star.position);
        if (distance < minDistance) {
          minDistance = distance;
        }
      }
    }
    return minDistance;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
