// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flame/components.dart' hide Vector;
import 'package:astro_flux/models/mote.dart';
import '../models/color_palette.dart';
import 'mote_component.dart';

void main() {
  group('MoteComponent', () {
    test('initialises with correct mote id', () {
      final component = MoteComponent(
        mote: const Mote(id: 1),
        glowRadius: 12.0,
        neonColor: ColorPalette.moteNeonColor,
      );
      expect(component.mote.id, equals(1));
    });

    test('has expected radius', () {
      final component = MoteComponent(
        mote: const Mote(id: 1),
        glowRadius: 12.0,
        neonColor: ColorPalette.moteNeonColor,
      );
      expect(component.radius, equals(8.0));
    });

    test('has expected glow radius', () {
      final component = MoteComponent(
        mote: const Mote(id: 1),
        glowRadius: 12.0,
        neonColor: ColorPalette.moteNeonColor,
      );
      expect(component.glowRadius, equals(12.0));
    });

    test('neon color matches default', () {
      final component = MoteComponent(
        mote: const Mote(id: 1),
        glowRadius: 12.0,
        neonColor: ColorPalette.moteNeonColor,
      );
      expect(component.neonColor.toARGB32(), equals(ColorPalette.moteNeonColor.value));
    });

    test('accepts position in constructor', () {
      final component = MoteComponent(
        mote: const Mote(id: 5),
        glowRadius: 12.0,
        neonColor: ColorPalette.moteNeonColor,
        position: Vector2(100.0, 100.0),
      );
      expect(component.mote.id, equals(5));
    });

    test('accepts state in constructor', () {
      final component = MoteComponent(
        mote: const Mote(id: 1),
        glowRadius: 12.0,
        neonColor: ColorPalette.moteNeonColor,
        state: ComponentState.active,
      );
      expect(component.state, equals(ComponentState.active));
    });
  });
}
