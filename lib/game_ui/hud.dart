// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/game_state_provider.dart';

/// Heads-up display rendered as a Flutter overlay on top of the Flame canvas.
///
/// Shows live mote count, vector count, and captured/total star tally.
/// Reads directly from [gameServiceProvider] so it updates reactively.
class HUD extends StatelessWidget {
  const HUD({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(gameServiceProvider);
        final moteCount = state.motes.length;
        final vectorCount = state.vectors.length;
        final capturedStars = state.stars.where((s) => s.ownerId == 'player').length;
        final enemyStars = state.stars.where((s) => s.ownerId == 'enemy').length;
        final totalStars = state.stars.length;

        return Positioned(
          top: 48,
          left: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.65),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color(0xFF00FFFF).withOpacity(0.45),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _statRow('⬡', 'Motes', '$moteCount', const Color(0xFF00FFFF)),
                const SizedBox(height: 4),
                _statRow('→', 'Vectors', '$vectorCount', const Color(0xFF00FF88)),
                const SizedBox(height: 4),
                _statRow('★', 'Stars', '$capturedStars / $totalStars', const Color(0xFFFFCC00)),
                if (enemyStars > 0) ...[
                  const SizedBox(height: 4),
                  _statRow('✕', 'Enemy', '$enemyStars', const Color(0xFFFF4444)),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _statRow(String icon, String label, String value, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(icon, style: TextStyle(color: color, fontSize: 13)),
        const SizedBox(width: 6),
        Text(
          '$label: ',
          style: const TextStyle(
            color: Color(0xAAFFFFFF),
            fontSize: 13,
            fontFamily: 'monospace',
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 13,
            fontWeight: FontWeight.bold,
            fontFamily: 'monospace',
          ),
        ),
      ],
    );
  }
}
