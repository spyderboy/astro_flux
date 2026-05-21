// ignore_for_file: depend_on_referenced_packages
// This file is a clean stub replacing a heavily hallucinated previous version.
// Fusion threshold logic lives in lib/game/fusion_rules.dart (FusionRules.fusionThreshold = 10).
// Auto-fusion is handled in AstroGame._checkAutoFusion() each update tick.
// Do NOT add StateNotifier, fusionReadyEventProvider, or _moteCount references here.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/game/fusion_rules.dart';

/// Convenience provider — returns the current fusion threshold (10).
/// Use FusionRules.fusionThreshold directly when possible.
final fusionThresholdValueProvider = Provider<int>((ref) => FusionRules.fusionThreshold);
