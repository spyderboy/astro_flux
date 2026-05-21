// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';

/// Opening title screen displayed before the game starts.
///
/// Tap anywhere to navigate to the game canvas.
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulseCtrl;
  late final Animation<double> _pulseAnim;

  @override
  void initState() {
    super.initState();
    _pulseCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);
    _pulseAnim = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(parent: _pulseCtrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushReplacementNamed('/game'),
      child: Scaffold(
        backgroundColor: const Color(0xFF050510),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              const Text(
                'ASTRO FLUX',
                style: TextStyle(
                  color: Color(0xFF00FFFF),
                  fontSize: 52,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 10,
                  shadows: [
                    Shadow(color: Color(0xFF00FFFF), blurRadius: 28),
                    Shadow(color: Color(0xFF0088FF), blurRadius: 60),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Subtitle
              const Text(
                'CAPTURE · FUSE · CONQUER',
                style: TextStyle(
                  color: Color(0x99FFFFFF),
                  fontSize: 13,
                  letterSpacing: 5,
                ),
              ),
              const SizedBox(height: 80),
              // Pulsing tap prompt
              AnimatedBuilder(
                animation: _pulseAnim,
                builder: (context, child) => Opacity(
                  opacity: _pulseAnim.value,
                  child: child,
                ),
                child: const Text(
                  'TAP TO START',
                  style: TextStyle(
                    color: Color(0xFF00FF88),
                    fontSize: 16,
                    letterSpacing: 6,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
