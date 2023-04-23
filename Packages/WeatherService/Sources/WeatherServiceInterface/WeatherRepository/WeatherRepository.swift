import UIKit

public protocol WeatherRepository {
    func getWeather(completion: @escaping Completion<LocationWeather>)
    func getWeatherIcon(_ weatherStateAbbreviation: String, completion: @escaping Completion<UIImage>)
}
