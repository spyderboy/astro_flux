# State Management Architecture

Astro Flux uses **Riverpod** for reactive state management, ensuring a unidirectional data/action flow and a single source of truth.

## Core Components

### 1. Immutable State (`lib/models/game_state.dart`)
The `GameState` class is an immutable data structure that holds the entire playable state:
- `motes`: `List<Mote>`
- `vectors`: `List<Vector>`
- `stars`: `List<Star>`

### 2. State Container (`lib/models/game_state_provider.dart`)
The `GameStateNotifier` manages the `GameState`. It is responsible for applying mutations by emitting new instances of `GameState`.

**Key Mutation Methods:**
- `addMote(int id)` / `removeMote(int id)`
- `addVector(int id)` / `removeVector(int id)`
- `addStar(int id, int tier)` / `removeStar(int id)`
- `updateStar(int id, int tier)`
- `captureStar(int id, String ownerId)`
- `clearMotes()`, `clearVectors()`, `clearStars()`
- `saveGame()`, `loadGame()`, `reset()`

### 3. Global Provider (`gameServiceProvider`)
All access to the game state should go through the `gameServiceProvider`. This provider exposes the `GameStateNotifier` and the current `GameState`.

### 4. Derived State (Selectors)
Riverpod allows for efficient computation of derived state using other providers. These providers watch `gameServiceProvider` and only re-emit when the specific slice of state they depend on changes.
*Example:* `fusionThresholdReachedProvider` watches `motes` to determine if a `Vector` can be formed.

## Data Flow

1. **Event/Action**: A game event occurs (e.g., a Star produces a Mote) or a user interaction happens.
2. **Mutation**: An action is called on the `GameStateNotifier` (e.g., `ref.read(gameServiceProvider.notifier).addMote(id)`).
3. **State Update**: The `GameStateNotifier` calculates the new `GameState` and updates its state.
4. **Reactivity**: Any provider or widget watching the state via `ref.watch(gameServiceProvider)` is notified.
5. **Rendering**: The Flame engine (components) and Flutter UI (widgets) react to the new state to update the visual representation.

## Principles

- **Unidirectional Data Flow**: State flows down, actions flow up.
- **Immutability**: The `GameState` is never modified in place; a new instance is always created.
- **No Direct Reads**: UI components must use providers to access state; they should not attempt to maintain their own copies of the game state.