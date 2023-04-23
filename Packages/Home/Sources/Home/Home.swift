import UIKit
import HomeInterface
import WeatherServiceInterface

public enum Home {
    public typealias Dependencies = WeatherRepositoryProvider &
        WeatherDetailFactory
    public static func make(dependencies: Dependencies) -> UIViewController {
        HomeFactory.make(dependencies: dependencies)
    }
    
    public typealias WeatherDetailDependencies = WeatherRepositoryProvider
    public static func makeWeatherDetail(dependencies: WeatherDetailDependencies) -> UIViewController {
        WeatherDetailFactoryImplementation().makeWeatherDetail()
    }
}
