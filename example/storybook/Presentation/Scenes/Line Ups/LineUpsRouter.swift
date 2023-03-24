import UIKit

protocol LineUpsRoutingLogic: BaseRouter {
}

class LineUpsRouter: LineUpsRoutingLogic {
    internal let navigationController: UINavigationController!

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = makeLineUpsViewController()
        navigationController.pushViewController(viewController,
                                                animated: true)
    }
}
// MARK: Private Methods
private extension LineUpsRouter {
    func makeLineUpsViewController() -> UIViewController {
        let presenter: LineUpsPresentationLogic = LineUpsPresenter()
        presenter.router = self
        return  buildLineUpsViewController(with: presenter)
    }
}
