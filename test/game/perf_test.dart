// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() async {
  final driver = await FlutterDriver.connect();

  try {
    await driver.waitFor(find.text('Game Title')); // Replace with actual game title or text
    for (int i = 0; i < 6000; i++) { // Run game loop for 60 seconds (1000ms each)
      await Future.delayed(Duration(milliseconds: 1000));
    }
  } finally {
    await driver.close();
  }
}