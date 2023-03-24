import UIKit

protocol SummaryRoutingLogic: BaseRouter {
}

class SummaryRouter: SummaryRoutingLogic {
    internal let navigationController: UINavigationController!

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = makeSummaryViewController()
        navigationController.pushViewController(viewController,
                                                animated: true)
    }

}
// MARK: Private Methods
private extension SummaryRouter {
    func makeSummaryViewController() -> UIViewController {
        let presenter = SummaryPresenter()
        presenter.router = self
       return  buildSummaryViewController(with: presenter)
    }
}
