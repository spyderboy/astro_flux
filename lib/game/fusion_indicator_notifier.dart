// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'fusion_indicator_state.dart';

class FusionIndicatorNotifier extends StateNotifier<FusionIndicatorState> {
  final MoteProvider moteProvider;

  FusionIndicatorNotifier(this.moteProvider) : super(FusionIndicatorState());

  void updateFusionInfo() {
    state = state.copyWith(
      pendingCount: (moteProvider.value.moteCount / 10).ceil(),
      isAnimating: moteProvider.value.moteCount > 0,
      progress: moteProvider.value.moteCount % 10 / 10.0,
    );
  }
}