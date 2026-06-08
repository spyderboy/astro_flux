// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:astro_flux/models/vector.dart';

class UnitBalanceIndicatorWidget extends ConsumerWidget {
  const UnitBalanceIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameServiceProvider);
    final playerVectorsCount = gameState.vectors.where((v) => v.owner == 'player').length;
    final enemyVectorsCount = gameState.vectors.where((v) => v.owner != 'player').length;

    return Positioned(
      top: 16,
      right: 16,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: playerVectorsCount <= 5 ? Colors.red.withAlpha(150) : Colors.black.withAlpha(150),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.blue, width: 2),
        ),
        child: Text(
          'Player: $playerVectorsCount vs Enemy: $enemyVectorsCount',
          style: TextStyle(
            color: playerVectorsCount <= 5 ? Colors.red : Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
