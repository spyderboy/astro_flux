# Apple Store Release Certification Requirements

This document outlines the technical and compliance requirements for certifying "Astro Flux" for release on the Apple App Store.

## 1. App Store Review Guidelines Compliance

### Content & Safety
- **User Generated Content (UGC):** As the current version is single-player, no UGC filtering is required. If multiplayer/chat is added, robust reporting/blocking/filtering must be implemented.
- **Inappropriate Content:** Ensure neon aesthetics and combat effects do not violate guidelines regarding extreme violence or gore (the current additive blending approach is safe).
- **Intellectual Property:** Ensure all audio assets, fonts, and textures are properly licensed.

### Performance & Stability
- **Crash-Free Sessions:** The app must demonstrate high stability. No frequent crashes or hangs during the game loop.
- **Performance:** Frame rates must remain consistent on target iOS devices (avoiding thermal throttling and excessive battery drain).
- **Resource Usage:** The app must not use excessive background data or drain battery without clear purpose.

### User Interface & UX
- **Human Interface Guidelines (HIG):** While the game uses a custom Flame canvas, any standard Flutter overlays (HUD, menus) must follow Apple's navigation and interaction patterns.
- **No Broken Links:** All links in the app description and metadata must be functional.

## 2. Privacy & Data Security

### App Tracking Transparency (ATT)
- If the app uses any identifier for advertising or tracking, the `AppTrackingTransparency` prompt must be implemented.
- **Privacy Policy:** A valid, accessible URL to the project's privacy policy must be provided in App Store Connect.

### Data Collection
- **Data Minimization:** Only collect data strictly necessary for gameplay (e.g., progress persistence).
- **Privacy Nutrition Label:** All data types collected (even if just device identifiers) must be declared in the App Store Connect privacy section.

## 3. Monetization & In-App Purchases (IAP)

- **IAP System:** Any digital goods (e.g., premium Mote packs, Star boosts) MUST use Apple's In-App Purchase system. No external payment gateways (e.g., Stripe, PayPal) for digital content.
- **Currency/Goods:** All virtual currencies or items must be clearly described in the app's metadata.

## 4. Metadata & Store Presence

- **Screenshots:** High-resolution screenshots for all required iPhone/iPad screen sizes. Screenshots must showcase actual gameplay.
- **App Icon:** Must follow Apple's icon specifications (no transparency, specific corner radius).
- **App Description:** Clear, accurate description of gameplay mechanics (Motes, Vectors, Stars) and features.
- **Keywords:** Optimized for discovery (e.g., "RTS", "Idle", "Neon", "Strategy").

## 5. Pre-Submission Checklist

- [ ] **Static Analysis:** `flutter analyze` returns zero issues.
- [ ] **Crash Testing:** Tested on physical iOS devices (not just simulator).
- [ ] **Network Integrity:** Verified behavior when connection is lost or interrupted.
- [ ] **Audio Check:** `flame_audio` behaves correctly (no silent/broken assets).
- [ ] **App Store Connect Metadata:** All descriptions, screenshots, and privacy labels are filled.
- [ ] **Provisioning Profiles:** Xcode build configuration is set for App Store distribution.