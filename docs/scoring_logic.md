# Scoring Logic

This document outlines the scoring calculations implemented in the Riverpod providers, which are driven by the number of active `Vector` units in the `GameState`.

## Combat Score
Calculated via `combatScoreProvider`. It is a direct count of the number of active `Vector` units in the `GameState`.
- **Calculation**: `count(gameState.vectors)`

## Battle Intensity
Calculated via `battleIntensityProvider`. It represents a normalized value (0.0 to 1.0) of the combat pressure based on the combat score.
- **Formula**: `clamp(combatScore / 10, 0.0, 1.0)`

## Victory Condition
Monitored via `victoryReachedProvider`. The player achieves victory when the number of active `Vector` units reaches the required threshold.
- **Condition**: `vectors.length >= 5`

## Battle State
Derived from the combat score in `battleStateProvider` to determine the current engagement level:
- `BattleState.none`: Score is 0.
- `BattleState.active`: Score is between 1 and 2.
- `BattleState.intense`: Score is 3 or greater.