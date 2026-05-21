// game_core.dart — compatibility shim
// Do NOT instantiate GameCore directly. Use Flame's GameWidget instead:
//
//   import 'package:flame/game.dart';
//   import 'package:astro_flux/game/astro_game.dart';
//
//   GameWidget<AstroGame>(
//     game: AstroGame(),
//     overlayBuilderMap: {'gameOver': (ctx, game) => GameOverOverlay()},
//   )
//
export 'package:astro_flux/game/astro_game.dart';
