// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SWPMExample",
    platforms: [.iOS(.v8)],
    products: [
        .executable(name: "SWPMExample", targets: ["SWPMExample"])
    ],
    dependencies: [
        .package(path: "../../")
    ],
    targets: [
        .target(name: "SWPMExample",  dependencies: ["Leetcode"])
    ],
    swiftLanguageVersions: [.v4]
)
