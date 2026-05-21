// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
//
// Generated file. Do not edit.
//

import PackageDescription

let package = Package(
    name: "FlutterGeneratedPluginSwiftPackage",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(name: "FlutterGeneratedPluginSwiftPackage", type: .static, targets: ["FlutterGeneratedPluginSwiftPackage"])
    ],
    dependencies: [
        .package(name: "audioplayers_darwin", path: "../.packages/audioplayers_darwin-6.4.0"),
        .package(name: "firebase_core", path: "../.packages/firebase_core-3.15.2"),
        .package(name: "connectivity_plus", path: "../.packages/connectivity_plus-6.1.5"),
        .package(name: "cloud_functions", path: "../.packages/cloud_functions-5.6.2"),
        .package(name: "cloud_firestore", path: "../.packages/cloud_firestore-5.6.12"),
        .package(name: "FlutterFramework", path: "../.packages/FlutterFramework")
    ],
    targets: [
        .target(
            name: "FlutterGeneratedPluginSwiftPackage",
            dependencies: [
                .product(name: "audioplayers-darwin", package: "audioplayers_darwin"),
                .product(name: "firebase-core", package: "firebase_core"),
                .product(name: "connectivity-plus", package: "connectivity_plus"),
                .product(name: "cloud-functions", package: "cloud_functions"),
                .product(name: "cloud-firestore", package: "cloud_firestore"),
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ]
        )
    ]
)
