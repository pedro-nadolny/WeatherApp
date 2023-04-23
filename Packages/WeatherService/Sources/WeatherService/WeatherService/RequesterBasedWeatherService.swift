import UIKit
import WeatherServiceInterface

final class RequesterWeatherRepository: WeatherRepository {    
    private let requester: Requester
    
    init(requester: Requester = RequesterImplementation()) {
        self.requester = requester
    }
    
    func getWeather(completion: @escaping Completion<LocationWeather>) {
        requester.make(
            request: LocationWeatherRequest(locationId: "4418")
        ) { (result: Result<LocationWeatherDTO, RequesterError>) in
            completion(result.map { $0 as LocationWeather })
        }
    }
    
    func getWeatherIcon(_ weatherStateAbbreviation: String, completion: @escaping Completion<UIImage>) {
        requester.make(
            dataRequest: WeatherStateIconRequest(weatherStateAbbreviation: weatherStateAbbreviation)
        ) { (result: Result<Data, RequesterError>) in
            let result = result.flatMap { data in
                if let image = UIImage(data: data) {
                    return .success(image)
                } else {
                    return .failure(.decodeError)
                }
            }
            
            completion(result)
        }
    }
}
