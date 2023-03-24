import UIKit

protocol PitchRoutingLogic: BaseRouter {
}

final class PitchRouter: PitchRoutingLogic {
    let navigationController: UINavigationController!

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = makePitchViewController()
        navigationController.pushViewController(viewController,
                                                animated: true)
    }

}
// MARK: Private Methods
private extension PitchRouter {
    func makePitchViewController() -> UIViewController {
       let presenter = PitchPresenter()
       presenter.router = self
       return  buildPitchViewController(with: presenter)
    }
}
