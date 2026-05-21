// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'dart:convert';
dart:io';
dart:math';
../models/star_level.dart';

class StarLevelService {
  final String baseUrl;
  final Map<int, ({StarLevel level, DateTime timestamp})> _cache = {};
  static const Duration _ttl = Duration(seconds: 60);

  StarLevelService({this.baseUrl = 'https://api.astroflux.game'});

  /// Fetches the tier of a star from a server endpoint.
  /// If the network request fails, it falls/back to a deterministic mock logic
  /// to ensure the game remains playable during development.
  Future<int> fetchStarTier(int starId) async {
    try {
      final client = HttpClient();
      final url = Uri.parse('$baseUrl/stars/$starId/tier');
      final request = await client.getUrl(url);
      final response = await request.close();

      if (response.statusCode == 200) {
        final body = await response.transform(utf8.decoder).join();
        final data = jsonDecode(body);
        return data['tier'] as int;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      // Fallback to mock logic to ensure game remains playable without a live API.
      // Simulate network latency.
      await Future.delayed(const Duration(milliseconds: 300));

      // Mock logic: return a tier between 1 and 3 based on starId
      final random = Random(starId);
      return random.nextInt(3) + 1; // Returns 1, 2, or 3
    }
  }

  /// Fetches the StarLevel data (level and xp) from a server endpoint.
  Future<StarLevel> fetchStarLevel(int starId) async {
    final now = DateTime.now();
    if (_cache.containsKey(starId)) {
      final entry = _cache[starId]!;
      if (now.difference(entry.timestamp) < _ttl) {
        return entry.level;
      }
    }

    try {
      final client = HttpClient();
      final url = Uri.parse('$baseUrl/stars/$starId/level');
      final request = await client.getUrl(url);
      final response = await request.close();

      if (response.statusCode == 200) {
        final body = await response.transform(utf8.decoder).join();
        final data = jsonDecode(body);
        final level = StarLevel.fromMap(data);
        _cache[starId] = (level: level, timestamp: now);
        return level;
      } else {
        throw Exception('StarLevel fetch error: ${response.statusCode}');
      }
    } catch (e) {
      // Fallback to mock logic
      await Future.delayed(const Duration(milliseconds: 300));
      return const StarLevel(level: 1, xp: 0, xpToNextLevel: 100);
    }
  }
}
