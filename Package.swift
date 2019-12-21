// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Leetcode",
    products: [
        .library(name: "Leetcode", targets: ["Leetcode"]),
        .library(name: "LeetcodeUI", targets: ["LeetcodeUI"])
    ],
    dependencies: [],
    targets: [
        .target(name: "Leetcode", dependencies: []),
        .target(name: "LeetcodeUI", dependencies: ["Leetcode"]),
        .testTarget(name: "LeetcodeTests", dependencies: ["Leetcode"]),
        .testTarget(name: "LeetcodeUITests", dependencies: ["LeetcodeUI"])
    ],
    swiftLanguageVersions: [.v4]
)
