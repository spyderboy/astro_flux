// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_driver/flutter_driver.dart';
import 'package:astro_flux/game/astro_game.dart';

void main() async {
  FlutterDriver driver;
  try {
    driver = await FlutterDriver.connect();
    await driver.waitFor(find.text('Loading...'), timeout: Duration(seconds: 30));
    List<double> frameTimes = [];
    for (int i = 0; i < 60; i++) {
      final start = DateTime.now().millisecondsSinceEpoch;
      await Future.delayed(Duration(seconds: 1));
      final end = DateTime.now().millisecondsSinceEpoch;
      frameTimes.add(end - start);
    }
    print('Frame times: $frameTimes');
    double p50 = calculatePercentile(frameTimes, 0.50);
    double p90 = calculatePercentile(frameTimes, 0.90);
    double p99 = calculatePercentile(frameTimes, 0.99);
    print('p50: $p50, p90: $p90, p99: $p99');
  } finally {
    if (driver != null) {
      await driver.close();
    }
  }
}

double calculatePercentile(List<double> data, double percentile) {
  data.sort((a, b) => a.compareTo(b));
  int index = ((data.length - 1) * percentile).round();
  return data[index];
}