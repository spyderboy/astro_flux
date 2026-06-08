import 'dart:ui';
// ignore_for_file: depend_on_referenced_packages
class GestureHandler extends PositionComponent {
  Vector2 _startPos = Vector2.zero();
  Vector2 _currentPos = Vector2.zero();

  @override
  void onDragStart(DragStartInfo info) {
    super.onDragStart(info);
    _startPos = info.globalPosition;
  }

  @override
  void onDragUpdate(DragUpdateInfo info) {
    super.onDragUpdate(info);
    _currentPos = info.globalPosition;
  }

  @override
  void onDragEnd(DragEndInfo info) {
    super.onDragEnd(info);
    final Rect boundingBox = Rect.fromPoints(_startPos, _currentPos);

    // Collect ids of selected components
    final Set<int> selectedIds = <int>{};

    // Add MoteComponent and VectorComponent ids inside the bounding box
    children.whereType<MoteComponent>().forEach((mote) {
      if (boundingBox.contains(mote.position)) {
        selectedIds.add(mote.id);
      }
    });

    children.whereType<VectorComponent>().forEach((vector) {
      if (boundingBox.contains(vector.position)) {
        selectedIds.add(vector.id);
      }
    });

    // Write the selected ids into SelectionNotifier
    ref.read(selectionProvider.notifier).state = selectedIds;
  }

  @override
  void onTapDown(TapDownInfo info) {
    super.onTapDown(info);
    final Vector2 tapPosition = info.globalPosition;

    // Clear selection if no star or unit is tapped
    bool hitStarOrUnit = false;

    children.whereType<StarComponent>().forEach((star) {
      if (Vector2.distance(star.position, tapPosition) < 36.0) { // Adjust radius as needed
        hitStarOrUnit = true;
      }
    });

    children.whereType<VectorComponent>().forEach((vector) {
      if (Vector2.distance(vector.position, tapPosition) < 36.0) { // Adjust radius as needed
        hitStarOrUnit = true;
      }
    });

    if (!hitStarOrUnit) {
      ref.read(selectionProvider.notifier).clearSelection();
    }
  }
}
