import UIKit

protocol StatisticsCarouselRoutingLogic: BaseRouter {
}

class StatisticsCarouselRouter: StatisticsCarouselRoutingLogic {
    internal let navigationController: UINavigationController!

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = makeStatisticsCarouselViewController()
        navigationController.pushViewController(viewController,
                                                animated: true)
    }
}
// MARK: Private Methods
private extension StatisticsCarouselRouter {
    func makeStatisticsCarouselViewController() -> UIViewController {
        let presenter: StatisticsCarouselPresentationLogic = StatisticsCarouselPresenter()
        presenter.router = self
        return  buildStatisticsCarouselViewController(presenter)
    }
}
