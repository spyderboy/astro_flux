// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'fusion_rules.dart';

void main() {
  group('FusionRules Test', () {
    test('fusionThreshold should be equal to 10', () {
      expect(FusionRules.fusionThreshold, equals(10));
    });
  });
}