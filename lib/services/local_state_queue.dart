// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for the LocalStateQueue instance.
final localStateQueueProvider = Provider((ref) => LocalStateQueue());

/// A type definition for a syncable action's data.
typedef SyncActionData = Map<String, dynamic>;

/// A simple queue for managing deferred actions.
class LocalStateQueue {
  final void Function(String)? onChanged;
  final List<SyncActionData> _queue = [];
  final Map<String, Future<void> Function(SyncActionData)> _registry = {};
  bool _isProcessing = false;

  /// Creates a LocalStateQueue.
  LocalStateQueue({this.onChanged});

  /// Returns the number of items currently in the queue.
  int get queueLength => _queue.length;

  /// Registers an executor for a specific action type.
  void register(String type, Future<void> Function(SyncActionData) executor) {
    _registry[type] = executor;
  }

  /// Enqueues an action to be performed.
  void enqueue(SyncActionData action) {
    _queue.add(action);
    onChanged?.call(serialize());
  }

  /// Returns the JSON representation of the queue for serialization.
  String serialize() => jsonEncode(_queue);

  /// Restores the queue from a JSON string.
  void deserialize(String json) {
    final List<dynamic> decoded = jsonDecode(json);
    _queue.clear();
    for (final item in decoded) {
      _queue.add(Map<String, dynamic>.from(item as Map));
    }
    onChanged?.call(serialize());
  }

  /// Attempts to process all queued actions.
  Future<void> flush() async {
    if (_isProcessing || _queue.isEmpty) return;

    _isProcessing = true;
    try {
      while (_queue.isNotEmpty) {
        final actionData = _queue.first;
        final type = actionData['type'] as String;
        final executor = _registry[type];

        if (executor != null) {
          try {
            await executor(actionData);
            _queue.removeAt(0);
          } catch (_) {
            // If an action fails, stop processing.
            break;
          }
        } else {
          // If no executor found, remove to prevent infinite loop.
          _queue.removeAt(0);
        }
      }
    } finally {
      _isProcessing = false;
    }
  }
}