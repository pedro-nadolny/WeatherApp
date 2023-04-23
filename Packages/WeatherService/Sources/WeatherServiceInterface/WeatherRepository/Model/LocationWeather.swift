import Foundation

public protocol LocationWeather {
    var weathers: [ConsolidatedWeather] { get }
    var cityName: String { get }
    var id: String { get }
}
