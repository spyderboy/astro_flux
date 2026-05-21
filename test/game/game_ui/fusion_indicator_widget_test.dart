import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/game/game_ui/fusion_indicator_widget.dart';
import 'package:astro_flux/models/fusion_indicator_state.dart';
import 'package:astro_flux/providers/fusion_indicator_provider.dart';

void main() {
  group('FusionIndicatorWidget', () {
    testWidgets('displays correct pending count at 0, 5, and 10', (WidgetTester tester) async {
      final testCases = [
        const FusionIndicatorState(pendingCount: 0, progress: 0.0),
        const FusionIndicatorState(pendingCount: 5, progress: 0.5),
        const FusionIndicatorState(pendingCount: 10, progress: 1.0),
      ];

      for (final state in testCases) {
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              fusionIndicatorProvider.overrideWith((ref) => state),
            ],
            child: const MaterialApp(
              home: Scaffold(
                body: FusionIndicatorWidget(),
              ),
            ),
          ),
        );

        // Verify the text count is correct
        expect(find.text('${state.pendingCount}'), findsOneWidget);
        
        // Verify the progress indicator exists
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      }
    });
  });
}