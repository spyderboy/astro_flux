import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/game_state.dart';
import '../providers/game_state_provider.dart';

class MinimapHUDWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final gameState = ref.watch(gameServiceProvider);
      // Add your code to display the star positions here
      return Container();
    });
  }
}
