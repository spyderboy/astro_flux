// ignore_for_file: depend_on_referenced_packages
import 'dart:developer' as developer;

/// Project-wide logging utility for Astro Flux
/// Integrates with Flutter's developer logging system and GCP Cloud Functions stdout
class Logger {
  static const String _prefix = '[Astro Flux]';

  static void debug(String message, {Object? error, StackTrace? stackTrace}) {
    final fullMessage = '$_prefix [DEBUG] $message';
    print(fullMessage);
    developer.log(fullMessage, level: 900, error: error, stackTrace: stackTrace);
  }

  static void info(String message, {Object? error, StackTrace? stackTrace}) {
    final fullMessage = '$_prefix [INFO] $message';
    print(fullMessage);
    developer.log(fullMessage, level: 1000, error: error, stackTrace: stackTrace);
  }

  static void warning(String message, {Object? error, StackTrace? stackTrace}) {
    final fullMessage = '$_prefix [WARNING] $message';
    print(fullMessage);
    developer.log(fullMessage, level: 2000, error: error, stackTrace: stackTrace);
  }

  static void error(String message, {Object? error, StackTrace? stackTrace}) {
    final fullMessage = '$_prefix [ERROR] $message';
    print(fullMessage);
    developer.log(fullMessage, level: 3000, error: error, stackTrace: stackTrace);
  }
}