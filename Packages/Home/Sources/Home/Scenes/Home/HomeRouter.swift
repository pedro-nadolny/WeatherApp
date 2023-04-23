import UIKit
import HomeInterface

protocol HomeRouter {
    func presentErrorAlert(
        title: String?,
        message: String?,
        retryCompletion: @escaping () -> Void
    )
    
    func presentWeatherDetail()
}

final class HomeRouterImplementation: HomeRouter {
    weak var controller: UIViewController?
    
    typealias Dependencies = WeatherDetailFactory
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func presentErrorAlert(
        title: String?,
        message: String?,
        retryCompletion: @escaping () -> Void
    ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(
            
            .init(title: "Retry", style: .default) { _ in
                alertController.dismiss(animated: true)
                retryCompletion()
            }
        )
        
        controller?.present(alertController, animated: true)
    }
    
    func presentWeatherDetail() {
        controller?.present(dependencies.makeWeatherDetail(), animated: true)
    }
}
