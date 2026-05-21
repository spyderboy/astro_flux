// ignore_for_file: depend_on_referenced_packages
import 'package:flame/components.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/providers/combat_state_provider.dart';
import 'package:astro_flux/components/combat_score_component.dart';
import 'package:astro_flux/components/score_pop_component.dart';

/// A non-rendering component that observes the combat score provider
/// and updates the CombatScoreComponent.
class CombatStateObserverComponent extends Component {
  final Ref ref;
  final CombatScoreComponent scoreComponent;
  int _lastScore = 0;

  CombatStateObserverComponent({
    required this.ref,
    required this.scoreComponent,
  });

  @override
  void onMount() {
    super.onMount();
    ref.listen<int>(combatScoreProvider, (_, next) {
      scoreComponent.updateScore(next);
      if (next > _lastScore) {
        final delta = next - _lastScore;
        final pop = ScorePopComponent(
          position: scoreComponent.position.clone(),
          text: '+$delta',
        );
        scoreComponent.parent?.add(pop);
      }
      _lastScore = next;
    });
    ref.listen<BattleState>(battleStateProvider, (_, next) {
      scoreComponent.updateBattleState(next);
    });
  }
}
