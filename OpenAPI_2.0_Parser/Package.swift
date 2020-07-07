// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OpenAPI_2.0_Parser",
    products: [
        .library(
            name: "OpenAPI_2_0_Parser",
            targets: ["OpenAPI_2_0_Parser"]),
    ],
    dependencies: [
        .package(url: "https://github.com/jpsim/Yams.git", from: "3.0.1")
    ],
    targets: [
        .target(
            name: "OpenAPI_2_0_Parser",
            dependencies: ["Yams"]),
        .testTarget(
            name: "OpenAPI_2_0_ParserTests",
            dependencies: ["OpenAPI_2_0_Parser"]),
    ]
)
