// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/test.dart';
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:astro_flux/providers/mote_count_provider.dart';
import 'package:astro_flux/services/star_level_service.dart';

void main() {
  test('10 motes input produces 1 vector output', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final gameStateNotifier = GameStateNotifier();
    container.read(gameServiceProvider.notifier).state = gameStateNotifier.state;

    for (int i = 0; i < 10; i++) {
      await gameStateNotifier.addMote(i);
    }

    expect(container.read(moteCountProvider), equals(0));
    expect(gameStateNotifier.vectors.length, equals(1));
  });

  test('concurrent mote additions do not result in race conditions', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final gameStateNotifier = GameStateNotifier();
    container.read(gameServiceProvider.notifier).state = gameStateNotifier.state;

    final List<Future<void>> futures = [];
    for (int i = 0; i < 100; i++) {
      futures.add(gameStateNotifier.addMote(i));
    }

    await Future.wait(futures);

    expect(container.read(moteCountProvider), equals(90));
    expect(gameStateNotifier.vectors.length, equals(9));
  });
}