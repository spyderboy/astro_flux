#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "🚀 Starting Astro Flux release build..."

# 1. Run static analysis to ensure code quality
echo "🔍 Running flutter analyze..."
flutter analyze

# 2. Run tests to ensure no regressions
echo "🧪 Running flutter test..."
flutter test

# 3. Build the Android App Bundle for release
echo "📦 Building Android App Bundle (appbundle)..."
flutter build appbundle --release

echo "✅ Build completed successfully!"
echo "📍 Output: build/app/outputs/bundle/release/"
