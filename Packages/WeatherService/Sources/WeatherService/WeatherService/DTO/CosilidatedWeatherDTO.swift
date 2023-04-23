import Foundation
import WeatherServiceInterface

struct ConsolidatedWeatherDTO: Decodable {
    let id: Int
    let weatherStateName: String
    let weatherStateAbbr: String
    let windDirectionCompass: String
    let created: String
    let applicableDate: String
    let minTemp: Double
    let maxTemp: Double
    let theTemp: Double
    let windSpeed: Double
    let windDirection: Double
    let airPressure: Double
    let humidity: Int
    let visibility: Double
    let predictability: Int
}

extension ConsolidatedWeatherDTO: ConsolidatedWeather {
    var maxTemperature: Double { maxTemp }
    var minTemperature: Double { minTemp }
    var currentTemperature: Double { theTemp }
    var weatherStateAbbreviation: String { weatherStateAbbr }
}
