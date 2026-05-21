// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/models/game_state.dart';
import 'package:astro_flux/providers/game_state_provider.dart';
import 'package:astro_flux/providers/mote_count_provider.dart';

void main() {
  test('Mote count provider returns correct mote count', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    // Arrange
    final gameStateProvider = GameStateNotifier([
      Mote(id: 1),
      Mote(id: 2),
      Mote(id: 3),
      Mote(id: 4),
      Mote(id: 5),
      Mote(id: 6),
      Mote(id: 7),
      Mote(id: 8),
      Mote(id: 9),
    ]);

    container.read(gameStateProvider.notifier).state = gameStateProvider.state;

    // Act
    final moteCount = container.read(moteCountProvider);

    // Assert
    expect(moteCount, equals(10));
  });
}
