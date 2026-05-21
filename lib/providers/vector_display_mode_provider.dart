import 'package:flutter_riverpod/flutter_riverpod.dart';

enum VectorDisplayMode {
  normal,
  pulse,
}

final vectorDisplayModeProvider = StateProvider<VectorDisplayMode>((ref) {
  return VectorDisplayMode.normal;
});
