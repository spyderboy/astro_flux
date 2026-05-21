// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Riverpod 3.x — Notifier<Set<int>> + NotifierProvider.
/// ⚠️  StateNotifier is REMOVED in Riverpod 3.x — use Notifier<T> instead.
class SelectionNotifier extends Notifier<Set<int>> {
  @override
  Set<int> build() => {};

  void select(int unitId) {
    state = {unitId};
  }

  void clearSelection() {
    state = {};
  }
}

final selectionProvider = NotifierProvider<SelectionNotifier, Set<int>>(
  () => SelectionNotifier(),
);
