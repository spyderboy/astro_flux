// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';

class LevelConfig {
  final String name;
  final List<int> starTiers; // List of star tiers to generate in this level
  final int maxMotes; // Maximum motes that can be present at the start of the level

  LevelConfig({required this.name, required this.starTiers, required this.maxMotes});
}

List<LevelConfig> kLevels = [
  LevelConfig(name: 'Beginner', starTiers: [1], maxMotes: 20),
  LevelConfig(name: 'Intermediate', starTiers: [1, 2], maxMotes: 30),
  LevelConfig(name: 'Advanced', starTiers: [2, 3], maxMotes: 40),
  LevelConfig(name: 'Expert', starTiers: [3, 4], maxMotes: 50),
  LevelConfig(name: 'Master', starTiers: [1, 2, 3, 4], maxMotes: 60),
];