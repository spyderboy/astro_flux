// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/test.dart';
import 'package:flame/game.dart' hide Vector;
import 'package:vector_math/vector_math.dart' as vm;
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:astro_flux/systems/persistence_service.dart';
import 'package:astro_flux/components/combat_attack_handler.dart';

void main() {
  test('mote-star hit within radius correctly detected', () async {
    final ref = ProviderContainer();
    final gameStateProvider = NotifierProvider<GameStateNotifier, GameState>(() => GameStateNotifier(PersistenceService()));
    ref.read(gameServiceProvider.notifier).addMote(1);
    ref.read(gameServiceProvider.notifier).addStar(1, 1);

    final combatAttackHandler = CombatAttackHandler(ref);

    // Trigger combat visuals for the mote-star pair
    combatAttackHandler.handleEvent(CombatAttackEvent(sourceVectorId: 1, targetStarId: 1));

    // Verify that combat visuals were dispatched
    final gameState = ref.read(gameServiceProvider);
    expect(gameState.motes.length, 0); // Mote should be consumed
    expect(gameState.vectors.length, 1); // Vector should be created
  });
}
