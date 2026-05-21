// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/components/stars/star_capture_indicator.dart';

void main() {
  test('StarCaptureIndicator should start capture animation and fade out', () async {
    final indicator = StarCaptureIndicator(
      starId: 1,
      color: Colors.blue,
    );
    expect(indicator.children, isEmpty);

    // Start the capture animation
    indicator.startCapture();
    await Future.delayed(Duration(seconds: 2));

    // Check if the indicator has been removed from parent after fading out
    expect(indicator.parent, isNull);
  });
}