import 'dart:ui';
import 'package:flame/components.dart';

/// Manager for visual feedback when a star is captured.
/// Currently a minimal implementation that stores a reference to a
/// particle system used for the capture effect.
class StarCaptureFeedbackManager extends Component {
  final Object particleSystem;

  StarCaptureFeedbackManager({required this.particleSystem});
}
