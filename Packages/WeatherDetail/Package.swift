// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "WeatherDetail",
    products: [
        .library(
            name: "WeatherDetail",
            targets: ["WeatherDetail"]),
        .library(
            name: "WeatherDetailInterface",
            targets: ["WeatherDetailInterface"]),
    ],
    dependencies: [

    ],
    targets: [
        .target(
            name: "WeatherDetail",
            dependencies: [
                "WeatherDetailInterface"
            ]),
        .target(
            name: "WeatherDetailInterface",
            dependencies: []),
        .testTarget(
            name: "WeatherDetailTests",
            dependencies: ["WeatherDetail"]),
    ]
)
