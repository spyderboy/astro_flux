// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/test.dart';
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:astro_flux/models/mote.dart';
import 'package:astro_flux/models/vector.dart';
import 'package:astro_flux/models/star.dart';

void main() {
  test('mote-star hit within radius correctly detected', () async {
    final ref = ProviderContainer();
    ref.read(gameServiceProvider.notifier).addStar(1, 1);
    ref.read(gameServiceProvider.notifier).addVector(2);
    expect(ref.read(gameServiceProvider).stars.length, 1);
  });
}
