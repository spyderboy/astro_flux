// ignore_for_file: depend_on_referenced_packages
import 'package:flame/components.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:astro_flux/models/star.dart';
import 'package:astro_flux/models/mote.dart';
import 'package:astro_flux/providers/star_production_rate_provider.dart';

class MoteProductionSystem extends Component {
  final Ref ref;

  MoteProductionSystem(this.ref);

  final Map<int, double> _starAccumulatedTime = {};

  @override
  void update(double dt) {
    final gameState = ref.read(gameServiceProvider);
    final rates = ref.read(starProductionRatesProvider).value ?? {};

    for (final star in gameState.stars) {
      final ratePerSecond = rates[star.tier] ?? 0;
      if (ratePerSecond <= 0) continue;

      final interval = 1.0 / ratePerSecond;
      _starAccumulatedTime[star.id] = (_starAccumulatedTime[star.id] ?? 0.0) + dt;

      while (_starAccumulatedTime[star.id]! >= interval) {
        _starAccumulatedTime[star.id] = _starAccumulatedTime[star.id]! - interval;

        // Emit the production tick event
        ref.read(starProductionTickControllerProvider).add(StarProductionTick(star.id));

        final currentMaxId = gameState.motes.fold<int>(0, (max, m) => m.id > max ? m.id : max);
        final nextId = currentMaxId + 1;

        ref.read(gameServiceProvider.notifier).addMote(nextId);
      }
    }
  }
}
