// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/models/game_state_provider.dart';

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({super.key});

  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> with WidgetsBindingObserver {
  bool _paused = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive || state == AppLifecycleState.paused) {
      setState(() {
        _paused = true;
        game.pauseEngine();
      });
    } else {
      setState(() {
        _paused = false;
        game.resumeEngine();
      });
    }
  }

  Future<bool> _onWillPop() async {
    if (_paused) return false;
    setState(() {
      _paused = true;
    });
    // Show pause dialog; returns false to prevent automatic pop
    final shouldExit = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A2E),
        title: const Text(
          'Game Paused',
          style: TextStyle(color: Color(0xFF00DDFF)),
        ),
        content: const Text(
          'Do you want to exit the game?',
          style: TextStyle(color: Color(0xFFCCCCCC)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text(
              'Resume',
              style: TextStyle(color: Color(0xFF00FFAA)),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text(
              'Exit',
              style: TextStyle(color: Color(0xFFFF3366)),
            ),
          ),
        ],
      ),
    );

    final exit = shouldExit ?? false;
    if (!exit) {
      setState(() {
        _paused = false;
      });
    } else {
      ref.read(gameServiceProvider.notifier).reset();
    }
    return exit;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: const Color(0xFF0A0A14),
        body: Stack(
          children: [
            // Game canvas is mounted by main.dart via GameWidget;
            // GameScreen provides the back-button interception layer.
            if (_paused)
              const Center(
                child: Text(
                  'PAUSED',
                  style: TextStyle(
                    color: Color(0xFF00DDFF),
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 8,
                  ),
... [truncated at 3000 chars]