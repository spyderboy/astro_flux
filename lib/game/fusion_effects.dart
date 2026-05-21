// ignore_for_file: depend_on_referenced_packages
import 'package:flame/components.dart' hide Vector;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/star_capture_event_provider.dart';
import '../game/particle_system.dart';

/// Listens for star capture events and spawns a burst effect at the capture site.
/// StarCaptureIndicator (visual ring) is added by a later component once it exists.
class StarCaptureEffectManager extends Component {
  final ParticleSystem particleSystem;
  final Ref ref;

  StarCaptureEffectManager({
    required this.particleSystem,
    required this.ref,
  });

  @override
  void onMount() {
    super.onMount();
    ref.listen<StarCaptureEvent?>(starCaptureEventProvider, (previous, next) {
      if (next == null) return;
      particleSystem.spawnBurst(next.position, next.color, count: 12);
    });
  }
}