// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/foundation.dart';

class FusionLogEntry {
  final DateTime timestamp;
  final List<int> moteIds;
  final int resultVectorId;

  const FusionLogEntry({
    required this.timestamp,
    required this.moteIds,
    required this.resultVectorId,
  });
}