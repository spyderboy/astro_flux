// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:vector_math/vector_math_64.dart' as vm;
import 'package:astro_flux/components/particle_system.dart';

void main() {
  group('ParticleManager', () {
    test('spawn respects 200-particle cap and returns false when full', () {
      final manager = ParticleManager(maxParticles: 200);
      final pos = vm.Vector2(10, 10);

      // Fill to capacity
      for (int i = 0; i < 200; i++) {
        final success = manager.spawn('spark', pos);
        expect(success, isTrue);
      }

      expect(manager.activeParticles.length, 200);

      // Attempt to overflow
      final overflowSuccess = manager.spawn('spark', pos);
      expect(overflowSuccess, isFalse);
      expect(manager.activeParticles.length, 200);
    });
  });
}