# Function Logic Rationale

## Scaling: Mote Production

The `MoteProductionSystem` utilizes an accumulation-based scaling approach for star-based mote production to ensure high precision and frame-rate independence.

- **Mechanism**: The system tracks `_starAccumulatedTime` for each star. In each `update` cycle, the delta time (`dt`) is added to this buffer. A `while` loop then checks if the accumulated time exceeds the required interval (`1.0 / ratePerSecond`).
- **Rationale**:
  - **Frame-Rate Independence**: If the frame rate drops (large `dt`), the `while` loop allows the system to trigger multiple production events in a single update, preventing "lost" production during lag.
  - **Precision**: This prevents the "drift" associated with simple periodic timers, ensuring that the total number of motes produced over a long duration is strictly governed by the defined production rates, regardless of the simulation's frequency.

## Timeout: Cooldown Management

The `CooldownTimer` handles time-based constraints for gameplay mechanics.

- **Mechanism**: The timer decrements `_remainingSeconds` by the `dt` provided during the `update` call.
- **Rationale**:
  - **Consistency**: By using `dt` instead of frame counts, cooldown durations remain consistent across different hardware, such as 60Hz or 120Hz displays.
  - **Smooth Interpolation**: Using a continuous time-based decrement allows for smooth, frame-accurate progress calculations (via the `progress` getter) for UI elements like cooldown overlays.