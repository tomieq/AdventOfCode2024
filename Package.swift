// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdventOfCode2024",
    targets: [
        .executableTarget(
            name: "AdventOfCode",
            dependencies: [],
            path: "Sources"),
        .testTarget(
            name: "AdventOfCodeTests",
            dependencies: ["AdventOfCode"],
            path: "Tests"),
    ]
)
