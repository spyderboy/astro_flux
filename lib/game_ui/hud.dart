// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Temporary placeholder for comboProvider until it's implemented
final Provider<int> comboProvider = Provider((ref) => 1);

class HUD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final comboCount = ref.watch(comboProvider);
        return Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (comboCount >= 2)
                Text(
                  '×$comboCount',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
            ],
          ),
        );
      },
    );
  }
}