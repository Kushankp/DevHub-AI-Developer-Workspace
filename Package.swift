// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "DevHubCore",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "DevHubCore",
            targets: ["DevHubCore"]
        )
    ],
    targets: [
        .target(
            name: "DevHubCore",
            path: "DevHubCore/Sources",
            swiftSettings: [
                .enableUpcomingFeature("ExistentialAny")
            ]
        ),
        .testTarget(
            name: "DevHubCoreTests",
            dependencies: ["DevHubCore"],
            path: "DevHubCore/Tests"
        )
    ]
)
