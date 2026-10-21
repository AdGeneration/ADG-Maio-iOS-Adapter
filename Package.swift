// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ADG-Maio-iOS-Adapter",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "ADGMaioAdapter",
            type: .static,
            targets: ["ADGMaioAdapterTarget"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/AdGeneration/ADG-iOS-SDK.git",
            "2.43.0"..<"7.0.0"
        ),
        .package(
            url: "https://github.com/imobile/MaioSDK-v2-iOS",
            exact: "2.2.3"
        ),
    ],
    targets: [
        .target(
            name: "ADGMaioAdapterTarget",
            dependencies: [
                .target(name: "ADGMaioAdapter"),
                .product(name: "ADG", package: "ADG-iOS-SDK"),
                .product(name: "MaioSDK", package: "MaioSDK-v2-iOS"),
            ],
            path: "ADGMaioAdapterTarget"
        ),
        .binaryTarget(
            name: "ADGMaioAdapter",
            url: "https://github.com/AdGeneration/ADG-Maio-iOS-Adapter/releases/download/2.2.300/ADGMaio.xcframework.zip",
            checksum: "9919469a5e53117dd0f6e0f2eafa1ecf0048d92c2e11174b32a5b6fd1f253f5a"
        ),
    ]
)
