// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "WeatherService",
    products: [
        .library(
            name: "WeatherService",
            targets: ["WeatherService"]),
        .library(
            name: "WeatherServiceInterface",
            targets: ["WeatherServiceInterface"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "WeatherService",
            dependencies: ["WeatherServiceInterface"]),
        .target(
            name: "WeatherServiceInterface",
            dependencies: []),
        .testTarget(
            name: "WeatherServiceTests",
            dependencies: ["WeatherService"]),
    ]
)
