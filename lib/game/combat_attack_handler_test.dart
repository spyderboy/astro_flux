// ignore_for_file: depend_on_referenced_packages
import 'dart:math';
import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vector_math/vector_math.dart' as vm;
import 'package:test/test.dart';
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:astro_flux/systems/local_persistence_service.dart';
import 'package:astro_flux/components/combat_attack_handler.dart';
import 'package:astro_flux/models/mote.dart';
import 'package:astro_flux/models/vector.dart';
import 'package:astro_flux/models/star.dart';

void main() {
  test('mote-star hit within radius correctly detected', () async {
    final ref = ProviderContainer();
    final gameStateProvider = GameStateNotifier(LocalPersistenceService())
      ..addVector(Vector(1, vm.Vector2.zero()))
      ..addStar(Star(1, 3, 'player1'));

    final combatAttackHandler = CombatAttackHandler(ref);
    combatAttackHandler.position = Vector2(0, 0);

    final event = CombatAttackEvent(sourceVectorId: 1, targetStarId: 1);
    expect(combatAttackHandler.handleEvent(event), isTrue);
  });
}
