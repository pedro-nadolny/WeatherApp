import UIKit
import WeatherServiceInterface

final class WeatherRepositoryStub: WeatherRepository {
    var getWeatherResult: Result<LocationWeather, RequesterError> = .failure(.emptyData)
    func getWeather(completion: @escaping Completion<LocationWeather>) {
        completion(getWeatherResult)
    }
    
    var getWeatherIconResult: Result<UIImage, RequesterError> = .failure(.emptyData)
    func getWeatherIcon(_ weatherStateAbbreviation: String, completion: @escaping Completion<UIImage>) {
        completion(getWeatherIconResult)
    }
}
