/// Models package - Contains pure Dart data classes
///
/// Core entities:
/// - Mote: Basic unit produced by Stars
/// - Vector: Fused unit (10 Motes → 1 Vector)
/// - Star: Capture-able node that produces Motes
/// - GameState: Immutable game state container
///
/// All models have toMap() and fromMap() methods for serialization.