// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:astro_flux/models/mote.dart';

class FusionRules {
  static const int motesPerVector = 10;
}

/// A lightweight mock of a server-side validation service.
/// It simulates a remote call that verifies whether a fusion request
/// should be accepted. The only rule enforced is that there must be at
/// least [FusionRules.motesPerVector] active motes.
class ServerValidationService {
  /// Simulate a network round-trip.
  Future<bool> validateFusion(List<Mote> motes) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final active = motes.where((m) => m.lifecycleState == MoteLifecycle.active).length;
    return active >= FusionRules.motesPerVector;
  }

  /// Simulate a network round-trip for vector count validation.
  /// It ensures the player does not exceed the maximum allowed vectors.
  Future<bool> validateVectorCount(int vectorCount) async {
    await Future.delayed(const Duration(milliseconds: 200));
    // For the purpose of this mock, we assume a maximum limit of 50 vectors.
    return vectorCount <= 50;
  }

  /// Simulate a network round-trip for star capture validation.
  /// It ensures the capture is authorized by verifying the ownerId.
  Future<bool> validateCapture(int starId, String ownerId) async {
    await Future.delayed(const Duration(milliseconds: 200));
    // In a real scenario, this would involve verifying a Firebase Auth token
    // against the backend to ensure the player is authorized to capture the star.
    return ownerId.isNotEmpty;
  }
}

final serverValidationServiceProvider = Provider<ServerValidationService>((ref) {
  return ServerValidationService();
});