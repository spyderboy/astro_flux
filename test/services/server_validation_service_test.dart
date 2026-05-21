import 'package:astro_flux/models/mote.dart';
import 'package:astro_flux/services/server_validation_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ServerValidationService service;

  setUp(() {
    service = ServerValidationService();
  });

  group('ServerValidationService', () {
    group('validateFusion', () {
      test('returns true when there are 10 or more active motes', () async {
        final motes = List.generate(
          10,
          (i) => Mote(id: i).setActive(),
        );
        final result = await service.validateFusion(motes);
        expect(result, isTrue);
      });

      test('returns false when there are fewer than 10 active motes', () async {
        final motes = List.generate(
          9,
          (i) => Mote(id: i).setActive(),
        );
        final result = await service.validateFusion(motes);
        expect(result, isFalse);
      });

      test('returns false when motes are present but not active (e.g. fused)', () async {
        final motes = List.generate(
          15,
          (i) => Mote(id: i).setFused(),
        );
        final result = await service.validateFusion(motes);
        expect(result, isFalse);
      });
    });

    group('validateVectorCount', () {
      test('returns true when vector count is 50 or less', () async {
        final result = await service.validateVectorCount(50);
        expect(result, isTrue);
      });

      test('returns true when vector count is less than 50', () async {
        final result = await service.validateVectorCount(10);
        expect(result, isTrue);
      });

      test('returns false when vector count exceeds 50', () async {
        final result = await service.validateVectorCount(51);
        expect(result, isFalse);
      });
    });
  });
}