// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/test.dart';
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:vector_math/vector_math.dart' as vm;

test('XP gain at level up boundary', () {
  final container = ProviderContainer();
  final gameStateProvider = gameServiceProvider.notifier.addStar(id: 1, tier: 3);

  // Add enough Motes to level up the Star
  for (int i = 0; i < 20; i++) {
    container.read(gameServiceProvider.notifier).addMote(i);
  }

  final state = container.read(gameServiceProvider);
  expect(state.stars[0].tier, 4); // Assuming level up increases tier by 1
});

test('XP gain capped at max level', () {
  final container = ProviderContainer();
  final gameStateProvider = gameServiceProvider.notifier.addStar(id: 1, tier: 3);

  // Add more Motes than needed to level up the Star but cap at max level
  for (int i = 0; i < 25; i++) {
    container.read(gameServiceProvider.notifier).addMote(i);
  }

  final state = container.read(gameServiceProvider);
  expect(state.stars[0].tier, 3); // Max level should not increase
});