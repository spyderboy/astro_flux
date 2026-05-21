// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:flame/components.dart' hide Vector;
import 'package:astro_flux/models/mote.dart';
import 'mote_component.dart';

void main() {
  group('MoteComponent', () {
    test('initialises with correct mote id', () {
      final component = MoteComponent(mote: const Mote(id: 1));
      expect(component.mote.id, equals(1));
    });

    test('has expected radius', () {
      final component = MoteComponent(mote: const Mote(id: 1));
      expect(component.radius, equals(8.0));
    });

    test('has expected glow radius', () {
      final component = MoteComponent(mote: const Mote(id: 1));
      expect(component.glowRadius, equals(12.0));
    });

    test('neon color matches default', () {
      final component = MoteComponent(mote: const Mote(id: 1));
      expect(component.neonColor.toARGB32(), equals(0xFF00FFFF));
    });

    test('accepts position in constructor', () {
      final component = MoteComponent(
        mote: const Mote(id: 5),
        position: Vector2(100.0, 100.0),
      );
      expect(component.mote.id, equals(5));
    });
  });
}
