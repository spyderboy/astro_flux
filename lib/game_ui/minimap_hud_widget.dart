// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/game_state.dart';
import '../services/audio_service.dart';

class MinimapHUDWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final gameState = ref.watch(gameStateProvider);
        // Add your code to display the star positions here
        return Container();
      },
    );
  }
}
