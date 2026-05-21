// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/mote.dart';
import 'package:astro_flux/models/vector.dart';
import 'package:astro_flux/models/star.dart';
import 'game_state_provider.dart';

class CombineOrderHandler {
  void handleCombineSuccess(int vectorId, int moteCount) {
    if (moteCount >= FusionRules.fusionThreshold) {
      // Implement fusion logic here
      ref.read(gameServiceProvider.notifier).spawnSurge(vectorId);
      for (int i = 0; i < moteCount; i++) {
        ref.read(gameServiceProvider.notifier).removeMote(vectorId * 10 + i);
      }
    } else if (moteCount >= FusionRules.fusionThreshold / 5) {
      // Implement Vector fusion logic here
      ref.read(gameServiceProvider.notifier).addVector(vectorId, tier: 2);
      for (int i = 0; i < moteCount; i++) {
        ref.read(gameServiceProvider.notifier).removeMote(vectorId * 10 + i);
      }
    } else {
      // Handle fusion failure or insufficient motes
    }
  }
}