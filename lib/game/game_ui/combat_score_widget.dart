// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/providers/combat_state_provider.dart';

/// A widget that displays the combat score and intensity in the UI layer.
class CombatScoreWidget extends ConsumerWidget {
  const CombatScoreWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final score = ref.watch(combatScoreProvider);
    final intensity = ref.watch(battleIntensityProvider);

    return Positioned(
      top: 20,
      left: 20,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.cyan.withAlpha(180),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'SCORE: $score',
              style: const TextStyle(
                color: Colors.cyan,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: LinearProgressIndicator(
                value: intensity,
                minHeight: 4,
                backgroundColor: Colors.cyan.withAlpha(50),
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Colors.cyan,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
