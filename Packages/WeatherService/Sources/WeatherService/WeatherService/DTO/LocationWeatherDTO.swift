import Foundation
import WeatherServiceInterface

struct LocationWeatherDTO: Decodable {
    let consolidatedWeather: [ConsolidatedWeatherDTO]
    let title: String
    let woeid: Int
    let lattLong: String
    let timezone: String
}

extension LocationWeatherDTO: LocationWeather {
    var weathers: [ConsolidatedWeather] { consolidatedWeather }
    var cityName: String { title }
    var id: String { .init(woeid) }
}
