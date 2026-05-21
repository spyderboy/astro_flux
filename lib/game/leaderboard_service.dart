// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';

/// Leaderboard entry representing a player's score and rank
class LeaderboardEntry {
  final int id;
  final int score;
  final int rank;
  final DateTime timestamp;

  const LeaderboardEntry({
    required this.id,
    required this.score,
    required this.rank,
    required this.timestamp,
  });

  factory LeaderboardEntry.fromMap(Map<String, dynamic> map) {
    return LeaderboardEntry(
      id: map['id'] as int,
      score: map['score'] as int,
      rank: map['rank'] as int,
      timestamp: DateTime.parse(map['timestamp'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'score': score,
      'rank': rank,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

/// Result wrapper for leaderboard operations
enum LeaderboardResultStatus {
  success,
  loading,
  error,
}

/// Leaderboard result containing data and status
class LeaderboardResult {
  final LeaderboardResultStatus status;
  final List<LeaderboardEntry> entries;
  final String? errorMessage;

  const LeaderboardResult._({
    required this.status,
    required this.entries,
    this.errorMessage,
  });

  factory LeaderboardResult.loading() {
    return const LeaderboardResult._(
      status: LeaderboardResultStatus.loading,
      entries: [],
    );
  }

  factory LeaderboardResult.success(List<LeaderboardEntry> entries) {
    return LeaderboardResult._(
      status: LeaderboardResultStatus.success,
      entries: entries,
    );
  }

  factory LeaderboardResult.error(String message) {
    return LeaderboardResult._(
      status: LeaderboardResultStatus.error,
      entries: [],
      errorMessage: message,
    );
  }
}

const _leaderboardEndpoint =
    'https://your-cloud-function-url.appspot.com/leaderboard';
const _leaderboardSubmitEndpoint =
    'https://your-cloud-function-url.appspot.com/leaderboard/submit';

/// Async fetch wrapper for leaderboards from Cloud API.
/// Handles fetching player rankings and scores from the backend.
class LeaderboardService {
  final HttpClient _client;
  final Duration _timeout;

  LeaderboardService({HttpClient? client, Duration? timeout})
      : _client = client ?? HttpClient(),
        _timeout = timeout ?? const Duration(seconds: 10);

  /// Fetch leaderboard entries from the Cloud Function.
  /// Returns a [LeaderboardResult] with status, entries, and any error message.
  Future<LeaderboardResult> fetchLeaderboard({
    int limit = 100,
    String? playerFilter,
  }) async {
    try {
      final uri = Uri.parse(_leaderboardEndpoint).replace(
        queryParameters: {
          'limit': limit.toString(),
          if (playerFilter != null) 'filter': playerFilter,
        },
      );

      final request = await _client.getUrl(uri).timeout(_timeout);
      final response = await request.close().timeout(_timeout);

      if (response.statusCode != 200) {
        return LeaderboardResult.error(
          'Failed to fetch leaderboard: HTTP ${response.statusCode}',
        );
      }

      final body = await response.transform(utf8.decoder).join();
      final List<dynamic> data = jsonDecode(body);
      
      final entries = data
          .map((item) => LeaderboardEntry.fromMap(item as Map<String, dynamic>))
          .toList();

      return LeaderboardResult.success(entries);
    } catch (e) {
      return LeaderboardResult.error('Leaderboard fetch error: $e');
    }
  }

  /// Submit a new score to the leaderboard.
  /// Returns [LeaderboardResult.success] if the submission was successful.
  Future<LeaderboardResult> submitScore(int id, int score) async {
    try {
      final payload = jsonEncode({
        'id': id,
        'score': score,
      });

      final request = await _client.postUrl(Uri.parse(_leaderboardSubmitEndpoint));
      request.headers.contentType = ContentType.json;
      request.headers.contentLength = utf8.encode(payload).length;
      request.write(payload);

      final response = await request.close().timeout(_timeout);

      if (response.statusCode != 200) {
        return LeaderboardResult.error(
          'Failed to submit score: HTTP ${response.statusCode}',
        );
      }

      return LeaderboardResult.success([]);
    } catch (e) {
      return LeaderboardResult.error('Score submission error: $e');
    }
  }
}