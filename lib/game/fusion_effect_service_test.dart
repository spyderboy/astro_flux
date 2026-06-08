// ignore_for_file: depend_on_referenced_packages
class MockRef implements Ref {
}

// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/test.dart';
import 'package:astro_flux/game/fusion_effect_service.dart';
import 'package:astro_flux/game/astro_game.dart';
import 'package:vector_math/vector_math.dart';

void main() {
  late FusionEffectService fusionEffectService;
  late AstroGame game;

  setUp(() {
    final container = ProviderContainer();
    game = AstroGame(MockRef());
    fusionEffectService = FusionEffectService(game);
  });

  test('triggers a fusion explosion at the given position', () {
    final position = Vector2(100, 200);
    fusionEffectService.triggerFusion(position);
    expect(game.children.whereType<FusionExplosionComponent>().length, equals(1));
  });
}
