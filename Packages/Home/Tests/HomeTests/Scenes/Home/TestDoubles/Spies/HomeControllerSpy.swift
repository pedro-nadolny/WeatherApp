import UIKit
@testable import Home

final class HomeControllerSpy: HomeController {
    private(set) var displayErrorCalled = false
    private(set) var displayErrorMessage: String?
    func displayError(message: String) {
        displayErrorCalled = true
        displayErrorMessage = message
    }
    
    private(set) var displayWeatherCalled = false
    private(set) var displayWeatherModel: HomePresentationModel?
    func display(weather: HomePresentationModel) {
        displayWeatherCalled = true
        displayWeatherModel = weather
    }
    
    private(set) var displayWeatherImageCalled = false
    private(set) var displayWeatherImage: UIImage?
    func display(weatherImage: UIImage) {
        displayWeatherImageCalled = true
        displayWeatherImage = weatherImage
    }
}
