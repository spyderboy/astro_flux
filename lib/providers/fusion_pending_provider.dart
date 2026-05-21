import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider that holds the IDs of Motes currently pending fusion.
final fusionPendingIdsProvider = StateProvider<List<int>>((ref) => []);

/// Service that handles incoming FCM messages to update fusion state.
class FusionNotificationService {
  final Ref _ref;

  FusionNotificationService(this._ref);

  /// Listens to an FCM message stream and updates `fusionPendingIdsProvider`.
  /// Expected message format: {'type': 'fusion_pending', 'moteIds': [1, 2, 3]}
  void listenToFCM(Stream<Map<String, dynamic>> fcmStream) {
    fcmStream.listen((message) {
      final type = message['type'] as String?;
      if (type == 'fusion_pending') {
        final List<dynamic> ids = message['moteIds'] ?? [];
        _ref.read(fusionPendingIdsProvider.notifier).state = 
            ids.map((id) => id as int).toList();
      }
    });
  }

  /// Clears any pending fusion IDs.
  void clearPending() {
    _ref.read(fusionPendingIdsProvider.notifier).state = [];
  }
}

final fusionNotificationServiceProvider = Provider<FusionNotificationService>((ref) {
  return FusionNotificationService(ref);
});