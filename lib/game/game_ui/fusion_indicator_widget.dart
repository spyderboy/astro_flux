// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/providers/fusion_indicator_provider.dart';

class FusionIndicatorWidget extends ConsumerWidget {
  const FusionIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(fusionIndicatorProvider);

    return Center(
      child: Container(
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFF00FFFF).withAlpha(150),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00FFFF).withAlpha(100),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                value: state.progress,
                strokeWidth: 3,
                valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF00FFFF)),
              ),
            ),
            Text(
              '${state.pendingCount}',
              style: const TextStyle(
                color: Color(0xFF00FFFF),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}