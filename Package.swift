// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Leetcode",
    products: [
        .library(
            name: "Leetcode",
            targets: ["Leetcode"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Leetcode",
            dependencies: []
        ),
        .testTarget(
            name: "LeetcodeTests",
            dependencies: ["Leetcode"]
        )
    ],
    swiftLanguageVersions: [.v4, .v4_2, .v5]
)
