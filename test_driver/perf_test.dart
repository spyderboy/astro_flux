// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/test.dart';

void main() async {
  await loadApp();
  await testPerf('Game loop performance', () async {
    final startTime = DateTime.now().millisecondsSinceEpoch;
    for (int i = 0; i < 60 * 1000; i++) {
      await Future.delayed(Duration(milliseconds: 1));
    }
    final endTime = DateTime.now().millisecondsSinceEpoch;
    final duration = endTime - startTime;
    expect(duration, isInclusiveRange(59000, 61000));
  });
}

Future<void> loadApp() async {
  runApp(MaterialApp(home: Scaffold(body: Container())));
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}
