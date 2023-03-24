import UIKit

protocol StatsRoutingLogic: BaseRouter {
}

class StatsRouter: StatsRoutingLogic {
    internal let navigationController: UINavigationController!

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = makeStatsViewController()
        navigationController.pushViewController(viewController,
                                                animated: true)
    }

}
// MARK: Private Methods
private extension StatsRouter {
    func makeStatsViewController() -> UIViewController {
        let presenter = StatsPresenter()
        presenter.router = self
       return  buildStatsViewController(with: presenter)
    }
}
