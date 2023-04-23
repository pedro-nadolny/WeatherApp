import Foundation
import WeatherServiceInterface

protocol HomeInteractor {
    func loadWeather()
    func loadWeatherIcon(from weatherAbbreviation: String)
}

final class HomeInteractorImplementation {
    typealias Dependencies = WeatherRepositoryProvider
    
    private let dependencies: Dependencies
    private let presenter: HomePresenter
    
    init(presenter: HomePresenter, dependencies: Dependencies) {
        self.presenter = presenter
        self.dependencies = dependencies
    }
}

extension HomeInteractorImplementation: HomeInteractor {
    func loadWeather() {
        dependencies.weatherRepository.getWeather { [presenter] result in
            switch result {
            case .success(let locationWeather):
                presenter.present(weather: locationWeather)
            case .failure(_):
                presenter.presentError()
            }
        }
    }
    
    func loadWeatherIcon(from weatherAbbreviation: String) {
        dependencies.weatherRepository.getWeatherIcon(weatherAbbreviation) { [presenter] result in
            switch result {
            case .success(let weatherIcon):
                presenter.present(weatherIcon: weatherIcon)
            case .failure(_):
                break
            }
        }
    }
}
