// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:astro_flux/providers/wind_direction_provider.dart';
import 'package:flame/components.dart';

class WindPathDeflector extends Component {
  @override
  void update(double dt) {
    final windDirection = ref.watch(windDirectionProvider);
    for (var child in children) {
      if (child is PositionComponent) {
        child.velocity.add((windDirection * 0.3 * dt).toVector2());
      }
    }
  }
}