import UIKit
import WeatherServiceInterface
@testable import Home

final class HomePresenterSpy: HomePresenter {
    private(set) var presentErrorCounter = 0
    func presentError() {
        presentErrorCounter += 1
    }
    
    private(set) var presentWeatherCounter = 0
    private(set) var presentWeatherWeather: [LocationWeather] = []
    func present(weather: LocationWeather) {
        presentWeatherCounter += 1
        presentWeatherWeather.append(weather)
    }
    
    private(set) var presentWeatherIconCounter = 0
    private(set) var presentWeatherIconWeatherIcon: [UIImage] = []
    func present(weatherIcon: UIImage) {
        presentWeatherIconCounter += 1
        presentWeatherIconWeatherIcon.append(weatherIcon)
    }
}
