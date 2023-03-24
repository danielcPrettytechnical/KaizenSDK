import UIKit

protocol StandingsRoutingLogic: BaseRouter {
}

class StandingsRouter: StandingsRoutingLogic {
    internal let navigationController: UINavigationController!

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = makeStandingsViewController()
        navigationController.pushViewController(viewController,
                                                animated: true)
    }

}
// MARK: Private Methods
private extension StandingsRouter {
    func makeStandingsViewController() -> UIViewController {
       let presenter = StandingsPresenter()
       presenter.router = self
       return  buildStandingsViewController(with: presenter)
    }
}
