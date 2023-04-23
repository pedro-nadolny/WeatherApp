import UIKit

public enum WeatherDetail {
    public static func makeWeatherDetail() -> UIViewController {
        return WeatherDetailController(nibName: nil, bundle: nil)
    }
}
