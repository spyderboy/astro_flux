// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/test.dart';
import 'package:astro_flux/models/mote.dart';
import 'package:astro_flux/services/server_validation_service.dart';

void main() {
  group('ServerValidationService', () {
    test('validateFusion rejects fusion with fewer than 10 active motes', () async {
      final service = ServerValidationService();
      final motes = List.generate(9, (_) => Mote(id: _, lifecycleState: MoteLifecycle.active));
      expect(await service.validateFusion(motes), isFalse);
    });

    test('validateFusion accepts fusion with exactly 10 active motes', () async {
      final service = ServerValidationService();
      final motes = List.generate(10, (_) => Mote(id: _, lifecycleState: MoteLifecycle.active));
      expect(await service.validateFusion(motes), isTrue);
    });

    test('validateFusion accepts fusion with more than 10 active motes', () async {
      final service = ServerValidationService();
      final motes = List.generate(15, (_) => Mote(id: _, lifecycleState: MoteLifecycle.active));
      expect(await service.validateFusion(motes), isTrue);
    });

    test('validateVectorCount rejects if vector count exceeds limit', () async {
      final service = ServerValidationService();
      expect(await service.validateVectorCount(51), isFalse);
    });

    test('validateVectorCount accepts if vector count does not exceed limit', () async {
      final service = ServerValidationService();
      expect(await service.validateVectorCount(50), isTrue);
    });

    test('validateCapture returns true with non-empty ownerId', () async {
      final service = ServerValidationService();
      expect(await service.validateCapture(1, 'player123'), isTrue);
    });

    test('validateCapture returns false with empty ownerId', () async {
      final service = ServerValidationService();
      expect(await service.validateCapture(1, ''), isFalse);
    };
  });
}