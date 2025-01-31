// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "redis",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "Redis", targets: ["Redis"])
    ],
    dependencies: [
        .package(url: "https://gitlab.com/swift-server-community/RediStack", from: "1.1.0"),
        .package(url: "https://github.com/vapor/vapor.git", from: "4.50.0"),
    ],
    targets: [
        .target(
            name: "Redis",
            dependencies: [
                .product(name: "RediStack", package: "RediStack"),
                .product(name: "Vapor", package: "vapor"),
            ]
        ),
        .testTarget(name: "RedisTests", dependencies: [
            .target(name: "Redis"),
            .product(name: "XCTVapor", package: "vapor"),
        ])
    ]
)
