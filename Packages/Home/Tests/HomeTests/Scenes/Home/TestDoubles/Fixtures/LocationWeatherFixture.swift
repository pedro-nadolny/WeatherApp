import Foundation
import WeatherServiceInterface

struct LocationWeatherFixture: LocationWeather, Equatable {
    let weathersFixture: [ConsolidatedWeatherFixture]
    var weathers: [ConsolidatedWeather] { weathersFixture }
    
    let cityName: String
    let id: String
    
    init(
        weathersFixture: [ConsolidatedWeatherFixture] = .init(),
        cityName: String = .init(),
        id: String = .init()
    ) {
        self.weathersFixture = weathersFixture
        self.cityName = cityName
        self.id = id
    }
}
