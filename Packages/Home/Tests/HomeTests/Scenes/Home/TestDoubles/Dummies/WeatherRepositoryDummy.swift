import UIKit
import WeatherServiceInterface

final class WeatherRepositoryDummy: WeatherRepository {
    func getWeather(completion: @escaping Completion<LocationWeather>) {}
    func getWeatherIcon(_ weatherStateAbbreviation: String, completion: @escaping Completion<UIImage>) {}
}
