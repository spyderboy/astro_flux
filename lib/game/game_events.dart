// ignore_for_file: depend_on_referenced_packages
import 'dart:async';

class LevelUpEvent {}

class FusionReadyEvent {}

/// Event bus to decouple event dispatching from component-side rendering.
class LevelUpEventBus {
  static final StreamController<LevelUpEvent> _controller = StreamController<LevelUpEvent>.broadcast();

  /// The stream of level up events.
  static Stream<LevelUpEvent> get stream => _controller.stream;

  /// Dispatches a new [event] to all listeners.
  static void fire(LevelUpEvent event) => _controller.add(event);
}

/// Event bus for fusion-related events
class FusionEventBus {
  static final StreamController<FusionReadyEvent> _controller = StreamController<FusionReadyEvent>.broadcast();

  /// The stream of fusion ready events.
  static Stream<FusionReadyEvent> get stream => _controller.stream;

  /// Dispatches a new [event] to all listeners.
  static void fire(FusionReadyEvent event) => _controller.add(event);
}

/// Retry behavior:
/// - Event dispatching operations (e.g., `fire`) are typically idempotent because multiple dispatches of the same event have no additional effect.
/// - Idempotency guarantees: Dispatching an event multiple times will not cause duplicate effects or state changes.
///
/// Retry behavior:
/// - Events can be retried if they fail during dispatch, but this depends on how the retry mechanism is implemented around the event dispatch calls.