import WeatherServiceInterface

public enum WeatherService {
    public static let weatherRepository: WeatherRepository = RequesterWeatherRepository()
}
