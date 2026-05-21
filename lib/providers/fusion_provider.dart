// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:astro_flux/game/fusion_rules.dart';

/// Event dispatched when the active mote count crosses the fusion threshold.
class FusionReadyEvent {}

/// Tracks the previous active-mote count so we can detect the crossing edge.
///
/// Riverpod 3.x — Notifier<int?> + NotifierProvider.
class _MoteCountNotifier extends Notifier<int?> {
  @override
  int? build() {
    ref.listen(gameServiceProvider, (previous, next) {
      state = next.motes.where((m) => m.isActive).length;
    });
    return null;
  }
}

final _moteCountProvider = NotifierProvider<_MoteCountNotifier, int?>(
  () => _MoteCountNotifier(),
);

/// Emits a [FusionReadyEvent] once each time the active mote count
/// crosses [FusionRules.fusionThreshold] from below.
///
/// StreamProvider is unchanged in Riverpod 3.x.
final fusionProvider = StreamProvider<FusionReadyEvent>((ref) async* {
  final previousMoteCount = ref.watch(_moteCountProvider);
  final currentState = ref.read(gameServiceProvider);
  final currentMoteCount = currentState.motes.where((m) => m.isActive).length;

  if (previousMoteCount != null &&
      previousMoteCount < FusionRules.fusionThreshold &&
      currentMoteCount >= FusionRules.fusionThreshold) {
    yield FusionReadyEvent();
  }
  await Future.delayed(Duration.zero);
});
