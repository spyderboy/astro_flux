import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/lib/components/combat_result_label_component.dart';

testWidgets('CombatResultLabel displays message', (WidgetTester tester) async {
  const message = 'Capture successful!';
  await tester.pumpWidget(MaterialApp(
    home: Scaffold(
      body: CombatResultLabel(message: message),
    ),
  ));

  final textFinder = find.text(message);
  expect(textFinder, findsOneWidget);
});