// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/game_state_provider.dart';

const _neonCyan = Color(0xFF00DDFF);
const _textStyleNeonCyan = TextStyle(fontSize: 48, color: _neonCyan, fontWeight: FontWeight.bold);

class WelcomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameService = ref.watch(gameServiceProvider);
    bool isGameInProgress = gameService.vectors.isNotEmpty || gameService.motes.isNotEmpty || gameService.stars.any((star) => star.ownerId != '');

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ASTRO FLUX', style: _textStyleNeonCyan),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to main game screen
                Navigator.pushNamed(context, '/game');
              },
              child: Text('Start New Game', style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(primary: Colors.cyan),
            ),
            if (isGameInProgress)
              SizedBox(height: 20),
            if (isGameInProgress)
              ElevatedButton(
                onPressed: () {
                  // Navigate to continue game screen
                  Navigator.pushNamed(context, '/continue');
                },
                child: Text('Continue Game', style: TextStyle(color: Colors.black)),
                style: ElevatedButton.styleFrom(primary: Colors.green),
              ),
            SizedBox(height: 20),
            Consumer(
              builder: (context, ref, child) {
                final gameState = ref.watch(gameServiceProvider);
                return Text('Win streak: ${gameState.winStreak}', style: TextStyle(fontSize: 18, color: Colors.white));
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}