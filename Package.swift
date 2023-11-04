// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ViewState",
    platforms: [
        .iOS(.v14),
        .macOS(.v13),
        .macCatalyst(.v13)
    ],
    products: [
        .library(
            name: "ViewState",
            targets: ["ViewState"]),
    ],
    dependencies: [
        .package(url: "https://github.com/nalexn/ViewInspector.git", from: "0.9.0")
    ],
    targets: [
        .target(
            name: "ViewState"),
        .testTarget(
            name: "ViewStateTests",
            dependencies: ["ViewState", "ViewInspector"]),
    ]
)
