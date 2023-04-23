// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Home",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "Home",
            targets: ["Home"]),
        .library(
            name: "HomeInterface",
            targets: ["HomeInterface"]),
    ],
    dependencies: [
        .package(path: "../WeatherService")
    ],
    targets: [

        .target(
            name: "Home",
            dependencies: [
                "HomeInterface",
                .product(name: "WeatherServiceInterface", package: "WeatherService")
            ]),
        .target(
            name: "HomeInterface",
            dependencies: []),
        .testTarget(
            name: "HomeTests",
            dependencies: ["Home"]),
    ]
)
