import UIKit
import HomeInterface
import Home
import WeatherService
import WeatherServiceInterface

typealias Dependencies = HomeFactory
    & WeatherDetailFactory
    & WeatherRepositoryProvider

final class DependencyContainer: Dependencies {
    static let shared = DependencyContainer()
    private init() {}
    
    let weatherRepository: WeatherRepository = WeatherService.weatherRepository
    
    func makeHomeController() -> UIViewController {
        Home.make(dependencies: self)
    }

    func makeWeatherDetail() -> UIViewController {
        return Home.makeWeatherDetail(dependencies: self)
    }
}
