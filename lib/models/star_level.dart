import 'package:flutter_riverpod/flutter_riverpod.dart';

class StarLevel {
  final int level;
  final int xp;
  final int xpToNextLevel;

  const StarLevel({
    required this.level,
    required this.xp,
    required this.xpToNextLevel,
  });

  Map<String, dynamic> toMap() {
    return {
      'level': level,
      'xp': xp,
      'xpToNextLevel': xpToNextLevel,
    };
  }

  factory StarLevel.fromMap(Map<String, dynamic> map) {
    return StarLevel(
      level: map['level'] as int? ?? 1,
      xp: map['xp'] as int? ?? 0,
      xpToNextLevel: map['xpToNextLevel'] as int? ?? 100,
    );
  }

  StarLevel copyWith({
    int? level,
    int? xp,
    int? xpToNextLevel,
  }) {
    return StarLevel(
      level: level ?? this.level,
      xp: xp ?? this.xp,
      xpToNextLevel: xpToNextLevel ?? this.xpToNextLevel,
    );
  }
}

class StarLevelNotifier extends Notifier<StarLevel> {
  @override
  StarLevel build() {
    return const StarLevel(level: 1, xp: 0, xpToNextLevel: 100);
  }

  void gainXp(int amount) {
    final current = state;
    int newXp = current.xp + amount;
    int newLevel = current.level;
    int newXpToNextLevel = current.xpToNextLevel;

    while (newXp >= newXpToNextLevel && newXpToNextLevel > 0) {
      newXp -= newXpToNextLevel;
      newLevel++;
    }

    state = current.copyWith(
      level: newLevel,
      xp: newXp,
      xpToNextLevel: newXpToNextLevel,
    );
  }
}