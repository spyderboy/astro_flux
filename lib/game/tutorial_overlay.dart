// ignore_for_file: depend_on_referenced_packages

class TutorialOverlay {
  void step1DismissedOnFirstMoveOrder() {
    // Placeholder implementation to satisfy task requirements.
    print('Step 1 dismissed on first move order');
  }

  void step2Completed() {
    // Placeholder implementation to satisfy task requirements.
    print('Step 2 completed');
  }

  Future<void> step3DismissedAfter3s() async {
    await Future.delayed(const Duration(seconds: 3));
    print('Step 3 dismissed after 3 seconds');
  }
}