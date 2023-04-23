import Foundation

public protocol WeatherRepositoryProvider {
    var weatherRepository: WeatherRepository { get }
}
