// ignore_for_file: depend_on_referenced_packages

class CombatAttackEvent {
  final int sourceVectorId;
  final int targetStarId;

  const CombatAttackEvent({
    required this.sourceVectorId,
    required this.targetStarId,
  });
}