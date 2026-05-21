import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/components/capture_result_label_component.dart';
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:astro_flux/game/capture_event_notifier.dart';

class AstroGame extends StatefulWidget {
  const AstroGame({Key? key}) : super(key: key);

  @override
  _AstroGameState createState() => _AstroGameState();
}

class _AstroGameState extends State<AstroGame> {
  late final GameStateNotifier _gameStateNotifier;

  @override
  void initState() {
    super.initState();
    _gameStateNotifier = ref.read(gameServiceProvider.notifier);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final captureMessage = ref.watch(captureMessageProvider);
        return Stack(
          children: [
            // Existing game UI components
            if (captureMessage.isNotEmpty)
              Positioned(
                bottom: 16,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    captureMessage,
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
