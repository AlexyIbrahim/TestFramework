// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "KindlyFramework",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "KindlyFramework",
            targets: ["KindlyFramework", "KindlySDK"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/daltoniam/Starscream.git",
            exact: "4.0.6"
        ),
        .package(
            url: "https://github.com/kirualex/SwiftyGif.git",
            exact: "5.4.3"
        ),
        .package(
            url: "https://github.com/SnapKit/SnapKit.git",
            exact: "5.6.0"
        ),
        .package(
            url: "https://github.com/SwiftyJSON/SwiftyJSON.git",
            exact: "5.0.1"
        ),
    ],
    targets: [
        .target(
            name: "KindlyFramework",
            dependencies: [
                .product(
                    name: "Starscream",
                    package: "Starscream",
                    condition: .when(platforms: [.iOS])
                ),
                .product(
                    name: "SwiftyGif",
                    package: "SwiftyGif",
                    condition: .when(platforms: [.iOS])
                ),
                .product(
                    name: "SnapKit",
                    package: "SnapKit",
                    condition: .when(platforms: [.iOS])
                ),
                .product(
                    name: "SwiftyJSON",
                    package: "SwiftyJSON",
                    condition: .when(platforms: [.iOS])
                ),
            ],
            resources: [.process("Resources")]
        ),
        .binaryTarget(
            name: "KindlySDK",
            path: "./Sources/KindlySDK.xcframework"
        ),
    ]
)
