// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/star_production_rate_provider.dart';


class MinimapHUD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final starProductionRates = ref.watch(starProductionRatesProvider);
        // Add your code to display the minimap HUD here
        return Container();
      },
    );
  }
}