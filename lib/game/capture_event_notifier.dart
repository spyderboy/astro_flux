// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Riverpod 3.x — Notifier<String> + NotifierProvider.
///
/// ⚠️  StateNotifier is REMOVED in Riverpod 3.x — use Notifier<T> instead.
class CaptureMessageNotifier extends Notifier<String> {
  @override
  String build() => '';

  void showCaptureSuccess(String message) {
    state = message;
    Future.delayed(const Duration(seconds: 3)).then((_) => state = '');
  }

  void showCaptureFailure(String message) {
    state = message;
    Future.delayed(const Duration(seconds: 3)).then((_) => state = '');
  }
}

final captureMessageProvider = NotifierProvider<CaptureMessageNotifier, String>(
  () => CaptureMessageNotifier(),
);
