// ignore_for_file: depend_on_referenced_packages

/// Configuration constants for the offline-first synchronization mechanism.
///
/// This file defines the parameters used by the synchronization services
/// to manage data consistency between local storage and the GCP backend.
class SyncConfig {
  /// Maximum number of retry attempts for a failed synchronization operation.
  static const int maxRetries = 3;

  /// The initial delay duration before the first retry attempt during exponential backoff.
  static const Duration initialDelay = Duration(seconds: 2);

  /// The maximum duration allowed for a single synchronization attempt before timing out.
  static const Duration syncTimeout = Duration(seconds: 60);

  /// Simulated network latency in milliseconds, used for testing and development.
  static const int simulatedLatencyMs = 800;

  /// The multiplier used for exponential backoff calculation.
  static const double backoffMultiplier = 2.0;
}