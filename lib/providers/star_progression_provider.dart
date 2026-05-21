// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/star_production_rate.dart';

/// Tracks the production progress of stars towards their next tier.
///
/// Riverpod 3.x — Notifier<Map<int,int>> + NotifierProvider.
/// ⚠️  Timer cleanup uses ref.onDispose() inside build(), not dispose() override.
class StarProgressionNotifier extends Notifier<Map<int, int>> {
  Timer? _decayTimer;

  @override
  Map<int, int> build() {
    ref.onDispose(() => _decayTimer?.cancel());
    return {};
  }

  void addProgress(int starId, int amount) {
    state = {...state, starId: (state[starId] ?? 0) + amount};
  }

  void decayProgress(int starId, int amount) {
    final current = state[starId] ?? 0;
    final next = (current - amount).clamp(0, current);
    if (next == 0 && current != 0) {
      final s = Map<int, int>.from(state)..remove(starId);
      state = s;
    } else if (next != current) {
      state = {...state, starId: next};
    }
  }

  void startDecayTimer(Duration interval, int amountPerInterval) {
    _decayTimer?.cancel();
    _decayTimer = Timer.periodic(interval, (_) {
      if (state.isEmpty) return;
      final s = Map<int, int>.from(state);
      state.forEach((starId, progress) {
        final next = (progress - amountPerInterval).clamp(0, progress);
        if (next == 0) {
          s.remove(starId);
        } else {
          s[starId] = next;
        }
      });
      state = s;
    });
  }

  void stopDecayTimer() {
    _decayTimer?.cancel();
    _decayTimer = null;
  }

  void resetProgress(int starId) {
    state = Map<int, int>.from(state)..remove(starId);
  }
}

final starProgressionProvider = NotifierProvider<StarProgressionNotifier, Map<int, int>>(
  () => StarProgressionNotifier(),
);

/// Mote requirement for a star of [tier] to upgrade to the next tier.
final starUpgradeRequirementProvider = Provider.family<int, int>((ref, tier) {
  if (!StarProductionRate.isValidTier(tier) || tier >= StarProductionRate.maxTier) {
    return 0;
  }
  return StarProductionRate.getRate(tier) * 10;
});
