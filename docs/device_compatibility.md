# Device Compatibility Matrix

## Overview
This document outlines the supported platforms and hardware specifications for Astro Flux, ensuring a consistent performance experience across different devices. The game relies heavily on additive blending and particle systems, which are GPU-dependent.

## Supported Platforms

| Platform | Minimum OS | Rendering Backend | Target Profile |
| :--- | :--- | :--- | :--- |
| **Android** | API 21 (Lollipop) | Skia / Vulkan | Mobile / Tablet |
| **iOS** | iOS 13.0+ | Metal | iPhone / iPad |
| **Web** | Modern Browsers | CanvasKit / WebGL | Desktop / Mobile Web |

## Performance Tiers

The game's particle systems and additive blending effects scale based on device capability. Heavy combat involving multiple Vectors and Star captures will trigger dynamic particle throttling on lower-tier devices.

### Tier 1: High Performance (Flagship Devices)
- **Android:** Snapdragon 8 Gen 1+, MediaTek Dimente 8000+
- **iOS:** A13 Bionic or newer
- **Characteristics:** High particle count, maximum glow intensity, stable 60 FPS even during heavy combat.

### Tier 2: Medium Performance (Mid-range Devices)
- **Android:** Snapdragon 7xx series, Helio G90+
- **iOS:** A11 Bionic (iPhone 8/X)
- **Characteristics:** Reduced particle lifespan, slightly lower particle density, stable 60 FPS.

### Tier 3: Low Performance (Entry-level / Legacy)
- **Android:** Snapdragon 4xx series, older Helio chips
- **iOS:** A10 Fusion (iPhone 7)
- **Characteristics:** Minimum particle counts, reduced glow radius, target 30 FPS during intense combat.

## Hardware Requirements & Constraints

- **GPU:** Must support OpenGL ES 3.0+ or Metal. Additive blending (`BlendMode.plus`) is computationally intensive on older GPUs due to pixel fill-rate demands.
- **Memory:** Minimum 2GB RAM recommended to prevent OS-level background process termination during high-density scenes.
- **Network:** Stable internet connection required for star synchronization and persistence.

## Rendering Considerations

- **Additive Blending:** High-saturation neon effects use `BlendMode.plus`. On low-end hardware, the engine dynamically throttles the number of concurrent active particles to maintain frame stability.
- **Resolution:** The game uses a resolution-independent coordinate system, but high-DPI (Retina/QuadHD) screens will significantly increase pixel fill-rate demand during combat effects.