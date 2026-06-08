// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/foundation.dart';

enum MoteLifecycle { created, active, fused }

class Mote {
  final int id;
  MoteLifecycle _lifecycleState;

  Mote({required this.id}) : _lifecycleState = MoteLifecycle.active;

  void setCreated() => _lifecycleState = MoteLifecycle.created;
  void setActive() => _lifecycleState = MoteLifecycle.active;
  void setFused() => _lifecycleState = MoteLifecycle.fused;

  bool get isCreated => _lifecycleState == MoteLifecycle.created;
  bool get isActive => _lifecycleState == MoteLifecycle.active;
  bool get isFused => _lifecycleState == MoteLifecycle.fused;
}
