// ignore_for_file: file_names
import 'dart:ui';

Future<void> generateGlowTexture({required String imagePath, required int glowRadius}) async {
  final image = await decodeImageFromList(await rootBundle.load(imagePath));
  final width = image.width;
  final height = image.height;
  final canvas = Canvas(PictureRecorder());

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      final color = image.getPixel(x, y);
      if (color != 0) {
        for (int dy = -glowRadius; dy <= glowRadius; dy++) {
          for (int dx = -glowRadius; dx <= glowRadius; dx++) {
            final nx = x + dx;
            final ny = y + dy;
            if (nx >= 0 && nx < width && ny >= 0 && ny < height) {
              final nColor = image.getPixel(nx, ny);
              final a = color >> 24 & 0xFF;
              final r = color >> 16 & 0xFF;
              final g = color >> 8 & 0xFF;
              final b = color & 0xFF;
              final na = nColor >> 24 & 0xFF;
              final nr = nColor >> 16 & 0xFF;
              final ng = nColor >> 8 & 0xFF;
              final nb = nColor & 0xFF;

              final newR = (r * a + nr * na) ~/ (a + na);
              final newG = (g * a + ng * na) ~/ (a + na);
              final newB = (b * a + nb * na) ~/ (a + na);
              final newA = a + na;

              image.setPixel(nx, ny, (newA << 24) | (newR << 16) | (newG << 8) | newB);
            }
          }
        }
      }
    }
  }

  final picture = canvas.endRecording();
  final recorder = ImageRecorder();
  await recorder.addPicture(Rect.fromLTWH(0, 0, width.toDouble(), height.toDouble()), picture);
  final glowImage = await recorder.toImage(width, height);

  final byteData = await imageToByteData(glowImage, format: ImageByteFormat.png)!;
  await precacheImage(MemoryImage(byteData.buffer.asUint8List()), context);
}