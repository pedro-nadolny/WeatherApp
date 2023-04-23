import Foundation
import XCTest
@testable import Home

final class HomePresenterImplementationTests: XCTestCase {
    private let controller = HomeControllerSpy()
    private lazy var sut: HomePresenterImplementation = {
        let sut = HomePresenterImplementation()
        sut.controller = controller
        return sut
    }()
    
    func testPresentWeather_WhenCalledWithEmptyConsolidatedWeather_ShouldDisplayError() {
        // Given
        let weather = LocationWeatherFixture(weathersFixture: [])
        
        // When
        sut.present(weather: weather)
        
        // Then
        XCTAssertTrue(controller.displayErrorCalled)
        XCTAssertFalse(controller.displayWeatherCalled)
    }
    
    func testPresentWeather_WhenCalledWithConsolidatedWeather_ShouldDisplayFirstConsolidatedWeather() {
        // Given
        let firstConsolidatedWeather = ConsolidatedWeatherFixture(
            maxTemperature: 12.0,
            minTemperature: 23.0,
            currentTemperature: 34.5,
            weatherStateName: "Light Rain",
            weatherStateAbbreviation: "lr"
        )
        
        let weather = LocationWeatherFixture(weathersFixture: [
            firstConsolidatedWeather,
            ConsolidatedWeatherFixture(),
            ConsolidatedWeatherFixture()
        ], cityName: "Toronto")
        
        // When
        sut.present(weather: weather)
        
        // Then
        XCTAssertTrue(controller.displayWeatherCalled)
        XCTAssertEqual(controller.displayWeatherModel?.title, "Toronto")
        XCTAssertEqual(controller.displayWeatherModel?.weatherAbbreviation, "lr")
        XCTAssertEqual(controller.displayWeatherModel?.weatherDescription, "Light Rain")
        XCTAssertEqual(controller.displayWeatherModel?.currentTemperature, "35°")
        XCTAssertEqual(controller.displayWeatherModel?.temperatureRange, "L: 23° H: 12°")
    }
    
    func testPresentError() {
        // When
        sut.presentError()
        
        // Then
        XCTAssertTrue(controller.displayErrorCalled)
        XCTAssertEqual(controller.displayErrorMessage, "Something went wrong :(\nTry again later.")
    }
    
    func testPresentWeatherIcon() {
        // Given
        let image = UIImage()
        
        // When
        sut.present(weatherIcon: image)
        
        // Then
        XCTAssertTrue(controller.displayWeatherImageCalled)
        XCTAssertTrue(controller.displayWeatherImage === image)
    }
}
