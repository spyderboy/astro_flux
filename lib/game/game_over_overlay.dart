// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'dart:ui' as ui;

class GameOverOverlay extends ConsumerWidget {
  const GameOverOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ 
            const Text(
              'GAME OVER',
              style: TextStyle(color: Color(0xFF00FFFF), fontSize: 52, fontWeight: FontWeight.bold, letterSpacing: 10),
            ),
            const SizedBox(height: 32),
            const Text(
              'You faced: Aggressor',
              style: TextStyle(color: Color(0xFF00FFFF), fontSize: 36, fontWeight: FontWeight.normal, letterSpacing: 4),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).popUntil(ModalRoute.withName('/welcome'));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF00FFFF)),
              ),
              child: const Text(
                'Main Menu',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
