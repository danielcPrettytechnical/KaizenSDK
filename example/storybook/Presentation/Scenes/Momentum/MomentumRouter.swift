import UIKit

protocol MomentumRoutingLogic: BaseRouter {
}

class MomentumRouter: MomentumRoutingLogic {
    internal let navigationController: UINavigationController!

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = makeMomentumViewController()
        navigationController.pushViewController(viewController,
                                                animated: true)
    }
}
// MARK: Private Methods
private extension MomentumRouter {
    func makeMomentumViewController() -> UIViewController {
        let presenter: MomentumPresentationLogic = MomentumPresenter()
        presenter.router = self
        return  buildMomentumViewController(with: presenter)
    }
}
