import 'dart:ui';

void drawNeonMoteOutline(Canvas canvas, Offset center, double radius) {
  Paint paint = Paint()
      ..color = Color.fromARGB(255, 255, 0, 0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

  canvas.drawCircle(center, radius, paint);
}
