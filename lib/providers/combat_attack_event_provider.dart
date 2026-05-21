// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/combat_attack_event.dart';

/// Holds the most recent CombatAttackEvent dispatched by the gesture handler.
/// Listeners (e.g. CombatAttackHandler) watch this to trigger visual effects.
/// Reset to null after processing to avoid re-triggering on rebuild.
final combatAttackEventProvider = StateProvider<CombatAttackEvent?>((ref) => null);
