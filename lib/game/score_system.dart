// ignore_for_file: depend_on_referenced_packages
import 'dart:async';

class ScoreSystem {
  int _score = 0;
  int _combo = 0;
  double _comboResetTimer = 5.0; // Set combo reset timer to 5 seconds

  int _totalGamesPlayed = 0;
  int _totalWins = 0;
  int _longestWinStreak = 0;

  int get score => _score;
  int get combo => _combo;
  int get totalGamesPlayed => _totalGamesPlayed;
  int get totalWins => _totalWins;
  int get longestWinStreak => _longestWinStreak;

  void addPoints(int points) {
    _score += points;
  }

  void addKill(int tier) {
    _score += tier * 10;
    incrementCombo();
  }

  void incrementCombo() {
    _combo++;
  }

  void resetCombo() {
    _combo = 0;
    _comboResetTimer = 5.0; // Reset timer after combo reset
  }

  void addUpgrade() {
    _score += 50;
  }

  void tick(double dt) {
    _comboResetTimer -= dt;
    if (_comboResetTimer <= 0) {
      resetCombo();
    }
  }

  void recordGame(bool isWin) {
    _totalGamesPlayed++;
    if (isWin) {
      _totalWins++;
      if (_totalWins > _longestWinStreak) {
        _longestWinStreak = _totalWins;
      }
    } else {
      _totalWins = 0;
    }
  }
}