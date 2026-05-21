// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:astro_flux/services/local_state_queue_service.dart';
import 'package:astro_flux/services/connectivity_service.dart';

void main() {
  late StreamController<List<ConnectivityResult>> connectivityController;
  late ProviderContainer container;

  setUp(() {
    connectivityController = StreamController<List<ConnectivityResult>>.broadcast();

    container = ProviderContainer(
      overrides: [
        // Override the connectivity status provider to control the stream in tests
        connectivityStatusProvider.overrideWith((ref) {
          return connectivityController.stream;
        }),
      ],
    );
  });

  tearDown(() {
    connectivityController.close();
    container.dispose();
  });

  test('LocalStateQueueService: enqueued actions are flushed when connectivity is restored',
      () async {
    // Access the service within the container
    final queueService = container.read(localStateQueueServiceProvider);
    bool actionExecuted = false;

    // 1. Simulate being offline
    connectivityController.add([ConnectivityResult.none]);
    // Allow the listener in LocalStateQueueService to react to the stream change
    await Future.microtask(() {});

    // 2. Enqueue an action while offline
    queueService.enqueue(() async {
      actionExecuted = true;
    });

    // Verify action is in queue and not executed yet
    expect(queueService.queueLength, 1);
    expect(actionExecuted, isFalse);

    // 3. Simulate connection restoration (e.g., switching to WiFi)
    connectivityController.add([ConnectivityResult.wifi]);

    // 4. Wait for the listener to trigger _processQueue and the action to complete.
    // We use a small delay to allow the async queue processing loop to run.
    await Future.delayed(const Duration(milliseconds: 100));

    // Verify action was flushed and executed
    expect(queueService.queueLength, 0);
    expect(actionExecuted, isTrue);
  });

  test('LocalStateQueueService: does not flush if connectivity remains none',
      () async {
    final queueService = container.read(localStateQueueServiceProvider);
    bool actionExecuted = false;

    // 1. Start with none
    connectivityController.add([ConnectivityResult.none]);
    await Future.microtask(() {});

    // 2. Enqueue an action
    queueService.enqueue(() async {
      actionExecuted = true;
    });

    // 3. Add another 'none' event (no change in connectivity status)
    connectivityController.add([ConnectivityResult.none]);
    await Future.delayed(const Duration(milliseconds: 50));

    // Verify action remains in queue and is not executed
    expect(queueService.queueLength, 1);
    expect(actionExecuted, isFalse);
  });
}
