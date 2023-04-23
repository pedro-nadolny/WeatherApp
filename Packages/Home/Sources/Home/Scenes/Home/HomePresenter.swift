import UIKit
import WeatherServiceInterface

protocol HomePresenter {
    func presentError()
    func present(weather: LocationWeather)
    func present(weatherIcon: UIImage)
}

struct HomePresentationModel {
    let title: String
    let temperatureRange: String
    let currentTemperature: String
    let weatherDescription: String
    let weatherAbbreviation: String
}

final class HomePresenterImplementation: HomePresenter {
    weak var controller: HomeController?
    
    func presentError() {
        controller?.displayError(message: "Something went wrong :(\nTry again later.")
    }
    
    func present(weather: LocationWeather) {
        guard let consolidatedWeather = weather.weathers.first else {
            presentError()
            return
        }
        
        let minTemperature = format(temperature: consolidatedWeather.minTemperature)
        let maxTemperature = format(temperature: consolidatedWeather.maxTemperature)
        
        controller?.display(weather:
            .init(
                title: weather.cityName,
                temperatureRange: "L: \(minTemperature) H: \(maxTemperature)",
                currentTemperature: format(temperature: consolidatedWeather.currentTemperature),
                weatherDescription: consolidatedWeather.weatherStateName,
                weatherAbbreviation: consolidatedWeather.weatherStateAbbreviation
            )
        )
    }
    
    func present(weatherIcon: UIImage) {
        controller?.display(weatherImage: weatherIcon)
    }
}

private extension HomePresenterImplementation {
    func format(temperature: Double) -> String {
        .init(format: "%d°", Int(round(temperature)))
    }
}
