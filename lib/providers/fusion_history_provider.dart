import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FusionEvent {
  final int vectorId;
  final DateTime timestamp;
  const FusionEvent({required this.vectorId, required this.timestamp});
}

class FusionEventService {
  final List<FusionEvent> _history = [];
  final _controller = StreamController<List<FusionEvent>>.broadcast();

  Stream<List<FusionEvent>> get historyStream => _controller.stream;

  void recordFusion(int vectorId) {
    _history.add(FusionEvent(vectorId: vectorId, timestamp: DateTime.now()));
    if (_history.length > 20) {
      _history.removeAt(0);
    }
    _controller.add(List.unmodifiable(_history));
  }

  void dispose() => _controller.close();
}

final fusionEventServiceProvider = Provider<FusionEventService>((ref) {
  final service = FusionEventService();
  ref.onDispose(() => service.dispose());
  return service;
});

final fusionHistoryProvider = StreamProvider<List<FusionEvent>>((ref) {
  return ref.watch(fusionEventServiceProvider).historyStream;
});