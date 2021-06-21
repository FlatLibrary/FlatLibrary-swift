// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FlatLibClient",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "FlatLibClient",
            targets: ["FlatLibClient"]),
    ],
    dependencies: [
        .package(url: "https://github.com/grpc/grpc-swift.git", from: "1.1.0")
    ],
    targets: [
        .target(
            name: "FlatLibClient",
            dependencies: [.product(name: "GRPC", package: "grpc-swift")],
            path: "Sources/"
        )
    ]
)
