// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KeyChainJB",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "KeyChainJB",
            targets: ["KeyChainJB"]),
    ],
    dependencies: [
        .package(url: "https://github.com/evgenyneu/keychain-swift.git", .upToNextMajor(from: "20.0.0"))
    
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "KeyChainJB",
            dependencies: [
                .product(name: "KeychainSwift", package: "keychain-swift")
            ]
        ),
        .testTarget(
            name: "KeyChainJBTests",
            dependencies: ["KeyChainJB"]),
    ]
)
