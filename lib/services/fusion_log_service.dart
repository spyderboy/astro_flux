// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'package:astro_flux/models/fusion_log_entry.dart';

abstract class FusionLogService {
  Stream<FusionLogEntry> streamEntries();
  Future<void> saveEntry(FusionLogEntry entry);
  Future<List<FusionLogEntry>> getEntries();
}

class FirestoreFusionLogService implements FusionLogService {
  final _controller = StreamController<FusionLogEntry>.broadcast();
  final List<FusionLogEntry> _entries = [];

  @override
  Stream<FusionLogEntry> streamEntries() => _controller.stream;

  @override
  Future<void> saveEntry(FusionLogEntry entry) async {
    // Simulate the latency of a Firestore document write and trigger propagation
    await Future.delayed(const Duration(milliseconds: 50));
    _entries.add(entry);
    _controller.add(entry);
  }

  @override
  Future<List<FusionLogEntry>> getEntries() async {
    return List.unmodifiable(_entries);
  }
}
