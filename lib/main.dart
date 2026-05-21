// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:astro_flux/game/astro_game.dart';
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:astro_flux/game_ui/hud.dart';
import 'package:astro_flux/game_ui/welcome_screen.dart';
import 'package:astro_flux/game/game_over_overlay.dart';
import 'firebase_options.dart';

/// Riverpod 3.x: WidgetRef and Ref are SEPARATE types — WidgetRef cannot be
/// passed where Ref is expected. To give AstroGame a proper provider Ref,
/// create it inside a Provider<AstroGame> where the callback arg IS a Ref.
final _astroGameProvider = Provider<AstroGame>((ref) => AstroGame(ref));

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: _GameApp()));
}

class _GameApp extends StatelessWidget {
  const _GameApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Astro Flux',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/game': (context) => const _GameScreen(),
      },
    );
  }
}

/// The game canvas screen. Seeded with initial state on first load.
class _GameScreen extends ConsumerStatefulWidget {
  const _GameScreen();

  @override
  ConsumerState<_GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<_GameScreen> {
  late final AstroGame _game;

  @override
  void initState() {
    super.initState();
    // Delay provider mutation until after the widget tree finishes building.
    // Riverpod 3.x throws if you modify a provider during initState/build.
    // Future.microtask runs before any Futures (including Flame's onLoad async body),
    // so stars are seeded before AstroGame.onLoad() reads them from Riverpod.
    Future.microtask(_seedInitialState);
    // Creating the game object is fine here — no provider state is mutated,
    // only a Ref reference is stored. onLoad() is async and runs later.
    _game = ref.read(_astroGameProvider);
  }

  void _seedInitialState() {
    final state = ref.read(gameServiceProvider);
    if (state.stars.isEmpty) {
      final notifier = ref.read(gameServiceProvider.notifier);
      notifier.addStar(1, 1); // tier-1 star
      notifier.addStar(2, 2); // tier-2 star
      notifier.addStar(3, 3); // tier-3 star
      // Seed initial motes so MoteProductionSystem has something to work with
      for (var i = 1; i <= 5; i++) {
        notifier.addMote(i);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GameWidget<AstroGame>(
      game: _game,
      overlayBuilderMap: {
        'hud': (context, game) => const HUD(),
        'gameOver': (context, game) => GameOverWidget(
              onRestart: () {
                _game.overlays.remove('gameOver');
                ref.read(gameServiceProvider.notifier).reset();
                _seedInitialState();
              },
            ),
      },
      initialActiveOverlays: const ['hud'],
    );
  }
}
