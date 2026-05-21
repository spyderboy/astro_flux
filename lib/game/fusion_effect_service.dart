// ignore_for_file: depend_on_referenced_packages
import 'package:flame/components.dart';
import 'package:astro_flux/game/astro_game.dart';
import 'fusion_explosion_component.dart';
import 'package:astro_flux/services/analytics_service.dart';

/// Service responsible for spawning fusion explosion effects and logging analytics.
class FusionEffectService {
  final AstroGame _game;

  FusionEffectService(this._game);

  /// Triggers a fusion explosion at the given [position] in the game world.
  void triggerFusion(Vector2 position) {
    final explosion = FusionExplosionComponent(position: position);
    _game.add(explosion);
    AnalyticsService.recordCustomKey('fusion_interaction', 'variant_1');
  }
}