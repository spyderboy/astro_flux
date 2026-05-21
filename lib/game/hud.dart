import 'package:flutter/material.dart';

class CombatScoreWidget extends StatelessWidget {
  final int score;

  CombatScoreWidget({required this.score});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 10,
      child: Text(
        'SCORE: $score',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}