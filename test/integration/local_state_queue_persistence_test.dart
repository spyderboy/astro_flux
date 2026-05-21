// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/services/local_state_queue.dart';

void main() {
  group('LocalStateQueue Persistence Integration Test', () {
    late LocalStateQueue queue;

    setUp(() {
      queue = LocalStateQueue();
    });

    test('should perform full round-trip: enqueue -> serialize -> deserialize -> flush', () async {
      // 1. Setup initial state: Enqueue an action
      final actionData = {'type': 'sync_event', 'payload': 'mission_start', 'id': 42};
      queue.enqueue(actionData);
      expect(queue.queueLength, 1);

      // 2. Simulate persistence (serialization to string)
      final serializedQueue = queue.serialize();

      // 3. Simulate app restart (new instance, deserialized from string)
      final restoredQueue = LocalStateQueue();
      restoredQueue.deserialize(serializedQueue);
      expect(restoredQueue.queueLength, 1);

      // 4. Register the executor on the new instance
      bool executorWasCalled = false;
      int capturedId = 0;

      restoredQueue.register('sync_event', (data) async {
        executorWasCalled = true;
        capturedId = data['id'] as int;
        return Future.value();
      });

      // 5. Perform the flush
      await restoredQueue.flush();

      // 6. Verify the results
      expect(executorWasCalled, isTrue);
      expect(capturedId, 42);
      expect(restoredQueue.queueLength, 0);
    });

    test('should maintain queue integrity for multiple items during round-trip', () async {
      queue.enqueue({'type': 'item', 'id': 1});
      queue.enqueue({'type': 'item', 'id': 2});
      queue.enqueue({'type': 'item', 'id': 3});

      final serialized = queue.serialize();
      final restored = LocalStateQueue();
      restored.deserialize(serialized);

      expect(restored.queueLength, 3);

      int processedCount = 0;
      restored.register('item', (_) async {
        processedCount++;
        return Future.value();
      });

      await restored.flush();
      expect(processedCount, 3);
      expect(restored.queueLength, 0);
    });

    test('should stop processing and preserve failed items in queue on executor error', () async {
      queue.enqueue({'type': 'fail', 'id': 1});
      queue.enqueue({'type': 'success', 'id': 2});

      queue.register('fail', (_) async {
        throw Exception('Network error');
      });
      queue.register('success', (_) async {
        return Future.value();
      });

      // Start flushing. The 'fail' item will cause an exception and break the loop.
      await queue.flush();

      // The failed item should still be at the head of the queue
      expect(queue.queueLength, 1);

      // Now register a working executor for the 'fail' type and try again
      queue.register('fail', (_) async {
        return Future.value();
      });

      await queue.flush();
      expect(queue.queueLength, 0);
    });

    test('should remove items from queue if no executor is registered', () async {
      queue.enqueue({'type': 'unknown_type', 'id': 99});
      expect(queue.queueLength, 1);

      // Flush without registering 'unknown_type'
      await queue.flush();

      expect(queue.queueLength, 0);
    });
  });
}
