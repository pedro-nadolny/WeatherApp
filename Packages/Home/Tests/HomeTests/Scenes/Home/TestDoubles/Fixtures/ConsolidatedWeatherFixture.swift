import Foundation
import WeatherServiceInterface

struct ConsolidatedWeatherFixture: ConsolidatedWeather, Equatable {
    let maxTemperature: Double
    let minTemperature: Double
    let currentTemperature: Double
    let weatherStateName: String
    let weatherStateAbbreviation: String
    
    init(
        maxTemperature: Double = .init(),
        minTemperature: Double = .init(),
        currentTemperature: Double = .init(),
        weatherStateName: String = .init(),
        weatherStateAbbreviation: String = .init()
    ) {
        self.maxTemperature = maxTemperature
        self.minTemperature = minTemperature
        self.currentTemperature = currentTemperature
        self.weatherStateName = weatherStateName
        self.weatherStateAbbreviation = weatherStateAbbreviation
    }
}
