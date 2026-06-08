// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/star.dart';
import '../providers/game_service_provider.dart';
import '../components/camera_viewport_painter.dart';
import 'dart:async';
import 'package:flame/components.dart';


class MinimapHUDWidget extends StatefulWidget {
  final Function(Vector2) onMinimapTap;

  const MinimapHUDWidget({Key? key, required this.onMinimapTap}) : super(key: key);

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
        return GestureDetector(
          onTapUp: (TapUpDetails details) {
            final tapPosition = details.localPosition;
            final worldPosition = Vector2(
              cameraBounds.left + tapPosition.dx * 1.5,
              cameraBounds.top + tapPosition.dy * 1.5,
            );
            widget.onMinimapTap(worldPosition);
          },
          child: Container(
            width: 80,
            height: 80,
            color: Colors.black,
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.all(8.0),
            child: Stack(
              children: [
                CustomPaint(
                  size: Size(64, 64),
                  painter: MinimapPainter(stars: gameState.stars, cameraBounds: cameraBounds),
                ),
                Positioned.fill(
                  child: CustomPaint(
                    size: Size.infinite,
                    painter: CameraViewportPainter(cameraBounds: cameraBounds, size: Size(64, 64)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


class MinimapPainter extends CustomPainter {
  final List<Star> stars;
  final Rect cameraBounds;

  MinimapPainter({required this.stars, required this.cameraBounds});

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

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
