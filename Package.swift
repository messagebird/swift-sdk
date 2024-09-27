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

            url: "https://github.com/messagebird/swift-sdk/releases/download/0.1.2/BirdKit.xcframework.zip",
            checksum: "9f9ab39d237f777dcd6b0c81f5a3f886923847eaf8123b67e05adf6d65bf61d8"
        )
    ]
)
