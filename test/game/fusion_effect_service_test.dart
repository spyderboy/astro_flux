// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_primepod.dart';
import 'package:test/test.dart';
import 'package:astro_flux/game/fusion_effect_service.dart';
import 'game_events.dart';
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:astro_flux/game/audio_service.dart';

void main() {
  late FusionEffectService fusionEffectService;

  setUp(() {
    fusionEffectService = FusionEffectService(AstroGame());
  });

  test('triggers a fusion explosion at the given position', () {
    final position = Vector2(100, 200);
    fusionEffectService.triggerFusion(position);
    expect(find.byType(FusionExplosionComponent), findsOneWidget);
  });
}
