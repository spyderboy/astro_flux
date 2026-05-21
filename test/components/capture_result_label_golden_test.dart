// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flame/game.dart' hide Vector;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/components/capture_result_label_component.dart';
import 'package:astro_flux/models/game_state_provider.dart';

void main() {
  testWidgets('CaptureResultLabelComponent displays capture success', (WidgetTester tester) async {
    final container = ProviderContainer();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [gameServiceProvider.overrideWithValue(GameStateNotifier())],
        child: GameWidget(game: AstroGame()),
      ),
    );

    // Simulate a capture success
    container.read(gameServiceProvider).updateGameState((state) => state.copyWith(lastCaptureSuccess: true));
    await tester.pump();

    final textFinder = find.text('Capture Success!');
    expect(textFinder, findsOneWidget);
  });
}
