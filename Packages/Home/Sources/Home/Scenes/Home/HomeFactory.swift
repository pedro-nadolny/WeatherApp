import Foundation
import HomeInterface
import UIKit

enum HomeFactory {
    typealias Dependencies = HomeInteractorImplementation.Dependencies &
        HomeRouterImplementation.Dependencies
    
    static func make(dependencies: Dependencies) -> UIViewController {
        let router = HomeRouterImplementation(dependencies: dependencies)
        let view = HomeViewImplementation()
        let presenter = HomePresenterImplementation()
        
        let interactor = HomeInteractorImplementation(
            presenter: presenter,
            dependencies: dependencies
        )
        
        let controller = HomeControllerImplementation(
            interactor: interactor,
            router: router,
            homeView: view
        )
        
        presenter.controller = controller
        router.controller = controller
        
        return controller
    }
}
