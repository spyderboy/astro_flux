// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/models/game_state_provider.dart';

void main() {
  late ProviderContainer container;
  late GameStateNotifier notifier;

  setUp(() {
    container = ProviderContainer();
    notifier = container.read(gameServiceProvider.notifier);
  });

  tearDown(() {
    container.dispose();
  });

  test('initial state is empty', () {
    final state = container.read(gameServiceProvider);
    expect(state.motes.isEmpty, true);
    expect(state.vectors.isEmpty, true);
    expect(state.stars.isEmpty, true);
  });

  test('addMote increases mote count', () {
    notifier.addMote(1);
    expect(container.read(gameServiceProvider).motes.length, 1);
  });

  test('addVector increases vector count', () {
    notifier.addVector(1);
    expect(container.read(gameServiceProvider).vectors.length, 1);
  });

  test('addStar increases star count', () {
    notifier.addStar(1, 1);
    expect(container.read(gameServiceProvider).stars.length, 1);
  });

  test('reset clears all collections', () {
    notifier.addMote(1);
    notifier.addVector(1);
    notifier.addStar(1, 1);
    notifier.reset();
    final state = container.read(gameServiceProvider);
    expect(state.motes.isEmpty, true);
    expect(state.vectors.isEmpty, true);
    expect(state.stars.isEmpty, true);
  });
}
