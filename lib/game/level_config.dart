// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vm;

class LevelConfig {
  final int starCount;
  final List<vm.Vector2> starPositions;
  final int playerHomeIndex;
  final int enemyHomeIndex;

  LevelConfig({
    required this.starCount,
    required this.starPositions,
    required this.playerHomeIndex,
    required this.enemyHomeIndex,
  });

  factory LevelConfig.level2() {
    return LevelConfig(
      starCount: 9,
      starPositions: [
        vm.Vector2(100, 100),
        vm.Vector2(300, 100),
        vm.Vector2(500, 100),
        vm.Vector2(700, 100),
        vm.Vector2(900, 100),
        vm.Vector2(100, 500),
        vm.Vector2(300, 500),
        vm.Vector2(500, 500),
        vm.Vector2(700, 500),
      ],
      playerHomeIndex: 0,
      enemyHomeIndex: 8,
    );
  }

  factory LevelConfig.level1() {
    return LevelConfig(
      starCount: 7,
      starPositions: [
        vm.Vector2(100, 100), // Player bottom-left
        vm.Vector2(300, 100),
        vm.Vector2(500, 100),
        vm.Vector2(700, 100),
        vm.Vector2(900, 100), // Enemy top-right
        vm.Vector2(300, 500),
        vm.Vector2(700, 500), // Neutral stars
      ],
      playerHomeIndex: 0,
      enemyHomeIndex: 4,
    );
  }
}