// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

/// Service for handling crash reporting and analytics via Firebase Crashlytics.
class AnalyticsService {
  /// Initializes the error handling for Flutter and Platform Dispatcher.
  /// Should be called as early as possible in the app lifecycle.
  /// Note: Firebase must be initialized via Firebase.initializeApp(options: ...) 
  /// before this service can report errors.
  static void setupErrorHandling() {
    if (kDebugMode) {
      debugPrint('AnalyticsService: Error handling setup skipped in debug mode.');
      return;
    }

    // Catch Flutter framework errors
    FlutterError.onError = (FlutterErrorDetails errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };

    // Catch errors from the platform side (e.g., asynchronous errors)
    PlatformDispatcher.instance.onMissingErrorHandler.handleError((error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    });

    debugPrint('AnalyticsService: Error handling setup completed.');
  }

  /// Manually record an error to Crashlytics.
  static Future<void> recordError(
    Object error,
    StackTrace stack,
    {bool fatal = false,
  }) async {
    if (kDebugMode) {
      debugPrint('AnalyticsService: Recording error: $error
$stack');
      return;
    }
    await FirebaseCrashlytics.instance.recordError(error, stack, fatal: fatal);
  }

  /// Set the user ID for Crashlytics.
  static Future<void> setUserId(String? userId) async {
    if (kDebugMode) return;
    await FirebaseCrashlytics.instance.setUserId(userId);
  }

  /// Set a custom key for Crashlytics.
  static Future<void> setCustomKey(String key, String value) async {
    if (kDebugMode) return;
    await FirebaseCrashlytics.instance.setCustomKey(key, value);
  }
}