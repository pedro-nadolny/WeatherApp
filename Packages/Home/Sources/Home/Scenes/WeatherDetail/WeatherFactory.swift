import UIKit
import HomeInterface

final class WeatherDetailFactoryImplementation: WeatherDetailFactory {
    func makeWeatherDetail() -> UIViewController {
        WeatherDetailController(nibName: nil, bundle: nil)
    }
}
