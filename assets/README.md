# Rendering Pipeline

Astro Flux uses a multi-pass-like approach within the Flame `render` loop to achieve a high-saturation neon aesthetic.

## 1. Background
The canvas is cleared to a dark, non-white color.

## 2. Glow Pass (Additive)
To create the neon glow, a layer is drawn using:
- **Blurring**: `MaskFilter.makeBlur(BlurStyle.normal, radius)` to soften the edges.
- **Additive Blending**: `Paint.blendMode = BlendMode.plus`. This ensures that overlapping glows increase the brightness of the pixels.
- **Low Opacity**: Uses `withAlpha(int)` (e.g., 120-150) to prevent the screen from washing out to white.

## 3. Core Pass (Sharp)
A sharp, high-visibility layer is drawn on top of the glow:
- **Stroke/Fill**: A thinner line or smaller circle.
- **Higher Opacity**: Often fully opaque or much higher alpha than the glow layer.
- **No Blur**: Uses a sharp edge to define the "hot" center of the neon element.

## 4. Particle/Transient Effects
Temporary effects like `StarCaptureIndicator` follow the same logic, animating the scale and alpha of the glow and core layers over their lifetime.