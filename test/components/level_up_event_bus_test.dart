// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/game/game_events.dart';

test('LevelUpEventBus emits event on fire', () async {
  final streamController = StreamController<LevelUpEvent>.broadcast();
  LevelUpEventBus._controller = streamController;

  expectLater(LevelUpEventBus.stream, emits(LevelUpEvent()));
  LevelUpEventBus.fire(LevelUpEvent());
});

void main() {
  group('LevelUpEventBus', () {
    test('emits event on fire', () async {
      final streamController = StreamController<LevelUpEvent>.broadcast();
      LevelUpEventBus._controller = streamController;

      expectLater(LevelUpEventBus.stream, emits(LevelUpEvent()));
      LevelUpEventBus.fire(LevelUpEvent());
    });
  });
}