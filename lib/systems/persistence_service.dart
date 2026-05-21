// ignore_for_file: depend_on_referenced_packages

/// Abstract interface for persistence services
abstract class PersistenceService {
  Future<Map<String, dynamic>?> loadGame();
  Future<void> saveGame(Map<String, dynamic> gameData);
}

/// In-memory persistence service (no external dependencies)
class LocalPersistenceService implements PersistenceService {
  final Map<String, dynamic> _storage = {};

  @override
  Future<Map<String, dynamic>?> loadGame() async {
    await Future.delayed(const Duration(milliseconds: 10));
    return _storage['gameState'];
  }

  @override
  Future<void> saveGame(Map<String, dynamic> gameData) async {
    await Future.delayed(const Duration(milliseconds: 10));
    _storage['gameState'] = gameData;
  }
}
