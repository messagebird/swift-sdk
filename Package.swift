// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-sdk",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "BirdKit", targets: ["BirdKit"])
    ],
    targets: [
        .binaryTarget(
            name: "BirdKit",
            // This URL is only usable if the repo is public.
            // Until this repo goes public, you can use a local path instead.
            // Remove the `url` and `checksum` lines and uncomment the `path` line.
            // In XCode -> File -> Packages -> Update to Latest Package Versions
            // path: "../path/to/BirdKit.xcframework.zip"

            url: "https://github.com/messagebird/swift-sdk/releases/download/0.0.2-beta/BirdKit.xcframework.zip",
            checksum: "ec9e8246af91024b413d1943c7d36048303d09eaede0a5bc73211c250881fbc0"
        )
    ]
)
