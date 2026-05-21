// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:astro_flux/components/sparkle_renderer.dart';
import 'package:astro_flux/game/particle_system.dart';
import 'package:astro_flux/models/mote.dart';
import 'package:astro_flux/models/vector.dart';

void main() {
  test('SparkleRenderer spawns a sparkle particle', () async {
    final mockParticleSystem = MockParticleSystem();
    final mockParent = MockComponent();
    when(mockParent.findByName('particle_system')).thenReturn(mockParticleSystem);

    final sparkleRenderer = SparkleRenderer()
      ..parent = mockParent;

    sparkleRenderer.spawnSparkle(Offset.zero);

    expect(mockParticleSystem.spawnSpark, calledOnceWith(
      vm.Vector2(0.0, 0.0),
      color: NeonRendererConfig.attackLineColor,
      radius: 2.0,
    ));
  });
}

class MockParticleSystem extends Mock implements ParticleSystem {}

class MockComponent extends Mock implements flame.Component {
  @override
  Component? findByName(String name) {
    return null;
  }
}