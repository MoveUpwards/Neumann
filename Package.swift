// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Neumann",
    platforms: [
        .iOS(.v10),
        .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "Neumann",
            targets: ["Neumann"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Neumann",
            dependencies: [],
            path: "Neumann/Sources"),
        .testTarget(
            name: "NeumannTests",
            dependencies: ["Neumann"],
            path: "NeumannTests"),
    ]
)
