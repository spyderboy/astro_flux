// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/game_state.dart';
import 'package:astro_flux/models/mote.dart';
import 'package:astro_flux/providers/game_state_provider.dart';
import 'package:astro_flux/providers/mote_count_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('threshold detection at mote counts 9, 10, and 11', () async {
    final container = ProviderContainer(
      overrides: [
        gameStateProvider.overrideWith((ref) => GameState(
          motes: List.generate(9, (index) => Mote(id: index)),
        )),
      ],
    );

    final moteCountProvider = container.read(moteCountProvider);
    expect(moteCountProvider, equals(9));

    await Future.delayed(Duration.zero);

    expect(moteCountProvider, equals(10));

    await Future.delayed(Duration.zero);

    expect(moteCountProvider, equals(11));
  });
}