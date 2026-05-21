// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Event dispatched when a combat attack occurs.
class CombatAttackEvent {
  final int sourceVectorId;
  final int targetStarId;

  const CombatAttackEvent({required this.sourceVectorId, required this.targetStarId});
}
