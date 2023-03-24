import UIKit

protocol MatchIncidentsRoutingLogic: BaseRouter {
}

class MatchIncidentsRouter: MatchIncidentsRoutingLogic {
    internal let navigationController: UINavigationController!

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = makeMatchIncidentsViewController()
        navigationController.pushViewController(viewController,
                                                animated: true)
    }

}
// MARK: Private Methods
private extension MatchIncidentsRouter {
    func makeMatchIncidentsViewController() -> UIViewController {
        let presenter = MatchIncidentsPresenter()
        presenter.router = self
        return  buildMatchIncidentsViewController(with: presenter)
    }
}
