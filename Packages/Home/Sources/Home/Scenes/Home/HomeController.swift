import UIKit

protocol HomeController: AnyObject {
    func display(weather: HomePresentationModel)
    func display(weatherImage: UIImage)
    func displayError(message: String)
    func displayWeatherDetail()
}

final class HomeControllerImplementation: UIViewController {
    private let interactor: HomeInteractor
    private let router: HomeRouter
    private let homeView: HomeView
    
    init(
        interactor: HomeInteractor,
        router: HomeRouter,
        homeView: HomeView
    ) {
        self.interactor = interactor
        self.router = router
        self.homeView = homeView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.rightBarButtonItem = .init(
            title: "Forecast",
            style: .done,
            target: self,
            action: #selector(displayWeatherDetail)
        )
        
        interactor.loadWeather()
        displayWeatherDetail()
        
    }
}

extension HomeControllerImplementation: HomeController {
    func display(weather: HomePresentationModel) {
        interactor.loadWeatherIcon(from: weather.weatherAbbreviation)
        
        DispatchQueue.main.async {
            self.title = weather.title
            self.homeView.show(weather: weather)
        }
    }
    
    func display(weatherImage: UIImage) {
        DispatchQueue.main.async {
            self.homeView.show(weatherIcon: weatherImage)
        }
    }
    
    func displayError(message: String) {
        DispatchQueue.main.async {
            self.router.presentErrorAlert(
                title: nil,
                message: message,
                retryCompletion: self.interactor.loadWeather
            )
        }
    }
    
    @objc
    func displayWeatherDetail() {
        router.presentWeatherDetail()
    }
}
