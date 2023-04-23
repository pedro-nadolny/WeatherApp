import Foundation

public protocol ConsolidatedWeather {
    var maxTemperature: Double { get }
    var minTemperature: Double { get }
    var currentTemperature: Double { get }
    var weatherStateName: String { get }
    var weatherStateAbbreviation: String { get }
}
