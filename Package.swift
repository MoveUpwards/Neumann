// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "Neumann",
    platforms: [
        .iOS(.v10),
    ],
    products: [
        .library(
            name: "Neumann",
            targets: ["Neumann"]
        ),
    ],
    dependencies: [ ],
    targets: [
        .target(
            name: "Neumann",
            dependencies: [],
            path: "Neumann/Sources"
        ),
    ]
)
