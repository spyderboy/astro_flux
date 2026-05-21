import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final gcpSyncServiceProvider = Provider((ref) => GcpSyncService());

class GcpSyncService {
  final FirebaseFunctions _functions = FirebaseFunctions.instance;

  /// Fetches the tier/level of a specific star from the backend.
  Future<int> getStarLevel(int starId) async {
    try {
      final result = await _functions.httpsCallable('getStar
starLevel').call(<String, dynamic>{
        'starId': starId,
      });
      return result.data['level'] as int;
    } catch (e) {
      rethrow;
    }
  }
}