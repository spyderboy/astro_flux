// ignore_for_file: depend_on_referenced_packages
import 'dart:developer';
import 'dart:ui';
import 'package:flame/components.dart';

/// A component that monitors and logs performance metrics to the console.
/// It tracks FPS and the time spent in the component's render loop.
/// 
/// To use: add this component to your FlameGame to begin monitoring.
class PerformanceBenchmarkComponent extends PositionComponent {
  final int reportInterval;

  double _fps = 0;
  double _renderTimeAccumulator = 0;
  int _frameCount = 0;

  PerformanceBenchmarkComponent({
    this.reportInterval = 60,
    super.position = Vector2.zero(),
  });

  @override
  void update(double dt) {
    if (dt > 0) {
      _fps = 1.0 / dt;
    }
    _frameCount++;

    if (_frameCount >= reportInterval) {
      final avgRenderTime = _renderTimeAccumulator / reportInterval;
      log('--- Performance Report ---');
      log('FPS: ${_fps.toStringAsFixed(1)}');
      log('Avg Render Time (Component/Children): ${avgRenderTime.toStringAsFixed(3)}ms');
      log('--------------------------');

      _renderTimeAccumulator = 0;
      _frameCount = 0;
    }
  }

  @override
  void render(Canvas canvas) {
    final stopwatch = Stopwatch()..start();
    super.render(canvas);
    stopwatch.stop();
    if (stopwatch.elapsedMicroseconds / 1000.0 > 16.7) {
      log('Warning: Frame time exceeded 16.7ms');
    }
    _renderTimeAccumulator += stopwatch.elapsedMicroseconds / 1000.0;
  }
}
