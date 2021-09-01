// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FirebaseSampleProjectUI",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "FirebaseSampleProjectUI",
            targets: ["FirebaseSampleProjectUI"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "FirebaseSampleProjectUI",
            dependencies: []),
        .testTarget(
            name: "FirebaseSampleProjectUITests",
            dependencies: ["FirebaseSampleProjectUI"]),
    ]
)
