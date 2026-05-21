// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';

/// Game-over overlay displayed via GameWidget.overlayBuilderMap.
///
/// ⚠️  This must be a Flutter Widget, NOT a Flame Component.
///     GameWidget overlays are Flutter widgets rendered on top of the canvas.
///     Register in GameWidget: overlayBuilderMap: {'gameOver': (ctx, game) => const GameOverWidget()}
///
/// To show: game.overlays.add('gameOver');
/// To hide: game.overlays.remove('gameOver');
class GameOverWidget extends StatelessWidget {
  final VoidCallback? onRestart;

  const GameOverWidget({super.key, this.onRestart});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.75),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'GAME OVER',
              style: TextStyle(
                color: Color(0xFFFF4444),
                fontSize: 48,
                fontWeight: FontWeight.bold,
                letterSpacing: 6,
                shadows: [Shadow(color: Color(0xFFFF0000), blurRadius: 20)],
              ),
            ),
            const SizedBox(height: 32),
            GestureDetector(
              onTap: onRestart ?? () => Navigator.of(context).pushReplacementNamed('/game'),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF00FFFF), width: 1.5),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'PLAY AGAIN',
                  style: TextStyle(
                    color: Color(0xFF00FFFF),
                    fontSize: 18,
                    letterSpacing: 3,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
