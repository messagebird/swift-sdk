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

            url: "https://github.com/messagebird/swift-sdk/releases/download/0.1.0/BirdKit.xcframework.zip",
            checksum: "b4544f202a7e8fe1d27274fe3a800ccbc0494db8f623601770f61a89a4f7da71"
        )
    ]
)
