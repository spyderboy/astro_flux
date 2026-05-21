// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'leaderboard_refresh_service.dart';
import 'leaderboard_service.dart';

/// Service that listens for leaderboard refresh signals and triggers a reload.
class LeaderboardNotificationService {
  final Ref _ref;

  LeaderboardNotificationService(this._ref) {
    _init();
  }

  /// Initializes the listener for the refresh stream.
  void _init() {
    _ref.read(leaderboardRefreshServiceProvider).refreshStream.listen((_) {
      _handleRefresh();
    });
  }

  /// Performs the actual leaderboard fetch operation.
  Future<void> _handleRefresh() async {
    try {
      // Use the provider for the service to ensure proper dependency injection.
      final service = _ref.read(leaderboardServiceProvider);
      await service.fetchLeaderboard();
    } catch (e) {
      // Errors are swallowed here as this is a background sync task.
    }
  }
}

/// Provider for the [LeaderboardNotificationService].
final leaderboardNotificationServiceProvider = Provider<LeaderboardNotificationService>((ref) {
  return LeaderboardNotificationService(ref);
});

/// Provider for the [LeaderboardService].
final leaderboardServiceProvider = Provider<LeaderboardService>((ref) {
  return LeaderboardService();
});