// ignore_for_file: depend_on_referenced_packages
import 'dart:convert' show json;

void writeBenchmarkResults(Map<String, dynamic> results) {
  final jsonString = jsonEncode(results);
  final file = File('benchmark_results.json');
  await file.writeAsString(jsonString);
}
