import XCTest
@testable import Home

final class HomeInteractorImplementationTests: XCTestCase {
    private let weatherRepositoryStub = WeatherRepositoryStub()
    private let presenterSpy = HomePresenterSpy()
    
    private lazy var sut: HomeInteractorImplementation = {
        let dependencies = DependencyContainerStub()
        dependencies.weatherRepository = weatherRepositoryStub
        
        return .init(
            presenter: presenterSpy,
            dependencies: dependencies
        )
    }()
    
    // MARK: - Tests
    
    func testLoadWeather_WhenRepositoryReturnsSuccess_ShouldPresentWeather() {
        // Given
        let stubbedLocationWeather = LocationWeatherFixture(id: "some id")
        weatherRepositoryStub.getWeatherResult = .success(stubbedLocationWeather)
        
        // When
        sut.loadWeather()
        
        // Then
        XCTAssertEqual(presenterSpy.presentWeatherCounter, 1)
        XCTAssertEqual(presenterSpy.presentWeatherWeather.first?.id, "some id")
        XCTAssertEqual(presenterSpy.presentErrorCounter, 0)
    }
    
    func testLoadWeather_WhenRepositoryReturnsFailure_ShouldPresentError() {
        // Given
        weatherRepositoryStub.getWeatherResult = .failure(.invalidUrl)
        
        // When
        sut.loadWeather()
        
        // Then
        XCTAssertEqual(presenterSpy.presentWeatherCounter, 0)
        XCTAssertEqual(presenterSpy.presentErrorCounter, 1)
    }
    
    func testLoadWeatherIcon_WhenRepositoryReturnsSuccess_SholdPresentWeatherIcon() {
        // Given
        let weatherAbbreviation = "abbr"
        let stubbedImage = UIImage()
        weatherRepositoryStub.getWeatherIconResult = .success(stubbedImage)
        
        // When
        sut.loadWeatherIcon(from: weatherAbbreviation)
        
        // Then
        XCTAssertEqual(presenterSpy.presentWeatherIconCounter, 1)
        XCTAssertEqual(presenterSpy.presentWeatherIconWeatherIcon.first, stubbedImage)
    }
    
    func testLoadWeatherIcon_WhenRepositoryReturnsFailure_SholdNotPresentWeatherIcon() {
        // Given
        let weatherAbbreviation = "abbr"
        weatherRepositoryStub.getWeatherIconResult = .failure(.invalidUrl)
        
        // When
        sut.loadWeatherIcon(from: weatherAbbreviation)
        
        // Then
        XCTAssertEqual(presenterSpy.presentWeatherIconCounter, 0)
    }
}
