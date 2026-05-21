// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/game_state_provider.dart';
import 'package:astro_flux/firebase_options.dart';

/// The strategy used for user identity verification.
enum AuthStrategy {
  mock,
  firebase,
}

class AuthMiddleware {
  final Ref _ref;
  final AuthStrategy _strategy;

  AuthMiddleware(this._ref, {required AuthStrategy strategy}) 
    : _strategy = strategy;

  /// Verifies the user's identity, typically by checking a Firebase Auth token.
  Future<bool> verifyIdentity() async {
    bool success = false;

    try {
      if (_strategy == AuthStrategy.firebase) {
        // In a real scenario, this would involve checking the Firebase Auth token
        // using the project config from firebaseOptions and potentially calling 
        // a Cloud Function to validate it.
        success = await _verifyFirebaseToken();
      } else {
        // Simulation for local development/mocking.
        success = await _verifyMockToken();
      }
    } catch (e) {
      // If an error occurs during verification (e.g., network error), 
      // we treat it as an authentication failure.
      success = false;
    }

    if (!success) {
      _ref.read(gameServiceProvider.notifier).reset();
    }

    return success;
  }

  Future<bool> _verifyFirebaseToken() async {
    // Simulate network delay for Firebase Auth/Cloud Function check.
    await Future.delayed(const Duration(milliseconds: 800));
    return true;
  }

  Future<bool> _verifyMockToken() async {
    // Faster simulation for development.
    await Future.delayed(const Duration(milliseconds: 300));
    return true;
  }
}

final authMiddlewareProvider = Provider<AuthMiddleware>((ref) {
  const env = String.fromEnvironment('APP_ENV');
  
  // Use firebase strategy for production and preview, mock for everything else.
  final strategy = (env == 'production' || env == 'preview') 
      ? AuthStrategy.firebase 
      : AuthStrategy.mock;

  return AuthMiddleware(ref, strategy: strategy);
});