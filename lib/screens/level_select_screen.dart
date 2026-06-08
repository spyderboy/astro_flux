// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flame/components.dart' hide Vector;
import 'package:vector_math/vector_math.dart' as vm;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/game/level_config.dart';

final difficultyProvider = StateProvider<String>((ref) => 'Normal');

@immutable
class LevelCard extends StatelessWidget {
  final String title;
  final int starCount;
  final List<vm.Vector2> starPositions;
  final int playerHomeIndex;
  final int enemyHomeIndex;
  final bool isLocked;

  const LevelCard({
    required this.title,
    required this.starCount,
    required this.starPositions,
    required this.playerHomeIndex,
    required this.enemyHomeIndex,
    required this.isLocked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isLocked ? const Color(0xFF4A4A6E) : const Color(0xFF1A1A2E),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              if (isLocked)
                Icon(Icons.lock, color: Colors.red),
            ],
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
            ),
            itemCount: starPositions.length,
            itemBuilder: (context, index) {
              final position = starPositions[index];
              return Center(
                child: Container(
                  width: 20,
                  height: 20,
                  margin: EdgeInsets.all(index == playerHomeIndex || index == enemyHomeIndex ? 4.0 : 0.0),
                  decoration: BoxDecoration(
                    color: index == playerHomeIndex
                        ? const Color(0xFF00DDFF)
                        : index == enemyHomeIndex
                            ? const Color(0xFFFF3366)
                            : const Color(0xFFFFFFFF),
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

enum Difficulty { Easy, Normal, Hard }

extension on Difficulty {
  String get label => this.toString().split('.').last;
}

List<Difficulty> difficulties = [Difficulty.Easy, Difficulty.Normal, Difficulty.Hard];

final unlockedLevelsProvider = StateProvider<int>((ref) => 0);

class LevelSelectScreen extends ConsumerWidget {
  static final List<LevelConfig> kLevels = [
    LevelConfig.level1(),
    LevelConfig.level2(),
  ];

  const LevelSelectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unlockedLevels = ref.watch(unlockedLevelsProvider);
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A14),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
              ),
              itemCount: kLevels.length,
              itemBuilder: (context, index) {
                final level = kLevels[index];
                final isLocked = index > unlockedLevels;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LevelCard(
                    title: level.name,
                    starCount: level.starTiers.length,
                    starPositions: List.generate(level.starTiers.length, (i) => vm.Vector2(i * 30.0, 50.0)),
                    playerHomeIndex: 0,
                    enemyHomeIndex: level.starTiers.length - 1,
                    isLocked: isLocked,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
