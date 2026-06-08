// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PauseOverlay extends ConsumerWidget {
  const PauseOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              // Add logic to resume the game when 'Resume' is pressed
              print('Resume button pressed');
            },
            child: const Text('Resume'),
          ),
          ElevatedButton(
            onPressed: () {
              // Add logic to go back to main menu when 'Main Menu' is pressed
              print('Main Menu button pressed');
            },
            child: const Text('Main Menu'),
          ),
          ElevatedButton(
            onPressed: () {
              // Add logic to quit the game when 'Quit' is pressed
              print('Quit button pressed');
            },
            child: const Text('Quit'),
          ),
        ],
      ),
    );
  }
}