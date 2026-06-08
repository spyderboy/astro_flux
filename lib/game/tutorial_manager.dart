// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_riverpod/flutter_riverpod.dart';

class TutorialManager {
  int _tutorialStep = 0;

  int get tutorialStep => _tutorialStep;

  bool get isComplete => _tutorialStep >= 4;

  void advanceTutorialStep() {
    if (_tutorialStep < 5) {
      _tutorialStep++;
    }
  }

  void onEvent(TutorialEvent e) {
    switch (e) {
      case TutorialEvent.tutorialStep1Completed:
        if (_tutorialStep == 0) advanceTutorialStep();
        break;
      case TutorialEvent.tutorialStep2Completed:
        if (_tutorialStep == 1) advanceTutorialStep();
        break;
      case TutorialEvent.tutorialStep3Completed:
        if (_tutorialStep == 2) advanceTutorialStep();
        break;
      case TutorialEvent.tutorialStep4Completed:
        if (_tutorialStep == 3) advanceTutorialStep();
        break;
      case TutorialEvent.tutorialStep5Completed:
        if (_tutorialStep == 4) advanceTutorialStep();
        break;
    }
  }
}

final tutorialManagerProvider = Provider<TutorialManager>((ref) {
  return TutorialManager();
});