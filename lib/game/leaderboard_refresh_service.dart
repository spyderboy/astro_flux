// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Service to notify listeners when a leaderboard refresh is required,
/// typically after a successful GCP synchronization or reconnection.
class LeaderboardRefreshService {
  final _controller = StreamController<void>.broadcast();

  /// Stream of events indicating that the leaderboard should be refreshed.
  Stream<void> get refreshStream => _controller.stream;

  /// Signals that a refresh is needed.
  void notifyRefresh() {
    _controller.add(null);
  }

  /// Closes the controller.
  void dispose() {
    _controller.close();
  }
}

final leaderboardRefreshServiceProvider = Provider<LeaderboardRefreshService>((ref) {
  final service = LeaderboardRefreshService();
  ref.onDispose(() => service.dispose());
  return service;
});