# Combat Rules

## Combat Entities

### Vectors
- The primary combat and expansion unit.
- Created via the fusion of 10 Motes.
- Used to capture Stars.

### Stars
- Stationary nodes that can be captured.
- Act as the primary objective for Vectors.
- Produce Motes based on their tier.

## Combat Mechanics

### Star Capture
- **Requirement**: At least one `Vector` must be available in the game state.
- **Process**: A `Vector` is assigned to a target `Star`.
- **Consequence**:
    - The `Star`'s owner is updated to the capturing entity.
    - The `Vector` used for the capture is consumed (removed from the game).

### Unit Fusion
- **Requirement**: 10 active `Mote`s.
- **Process**: 10 `Mote`s are transformed into a single `Vector`.
- **Consequence**:
    - The `Mote`s transition to the `fused` state.
    - A new `Vector` is added to the player's forces.

## Targeting Logic
Currently, all `Vector` units are capable of targeting any `Star` node. There is no differentiation between attack types or specialized targeting behaviors implemented in the current engine.