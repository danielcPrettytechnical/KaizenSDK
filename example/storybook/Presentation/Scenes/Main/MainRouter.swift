import UIKit
import KaizenSDK
var storybookMatchId = "Th3-C00l-M4tch"
protocol MainRoutingLogic: BaseRouter {
    func navigateToPitchComponent()
    func navigateToStatsComponent()
    func navigateToSummaryComponent()
    func navigateToLineUpComponent()
    func navigateToStandingsComponent()
    func navigateToMatchIncidentsComponent()
    func navigateToMatchDetailViewTabs()
    func navigateToMomentumComponent()
    func navigateToChangeMatch()
    func navigateToStatisticsCarouselComponent()
}

final class MainRouter: MainRoutingLogic, KZStateComponentDelegate {
    let navigationController: UINavigationController! = UINavigationController()
    private let window: UIWindow
    private weak var matchDetail: MatchDetailRoutingLogic? {
        let matchDetailModel = KZStyleMatchDetailModel(identifier: storybookMatchId,
                                                       height: UIScreen.main.bounds.height * 0.8,
                                                       delegate: self)
        return MatchDetailViewBuilder.inject(with: navigationController,
                                             matchDetailStyle:
                                                matchDetailModel)
    }

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let viewController = makeMainViewController()
        window.rootViewController = navigationController
        window.backgroundColor = .white
        window.makeKeyAndVisible()
        navigationController.pushViewController(viewController,
                                                animated: true)
    }

    func navigateToPitchComponent() {
        let pitchRouter =
            PitchRouter(navigationController: navigationController)
        pitchRouter.start()
    }

    func navigateToStatsComponent() {
        let statsRouter =
            StatsRouter(navigationController: navigationController)
        statsRouter.start()
    }

    func navigateToSummaryComponent() {
        let summaryRouter =
            SummaryRouter(navigationController: navigationController)
        summaryRouter.start()
    }

    func navigateToLineUpComponent() {
        let lineUpRouter = LineUpsRouter(navigationController: navigationController)
        lineUpRouter.start()
    }

    func navigateToStandingsComponent() {
        let standingsRouter = StandingsRouter(navigationController: navigationController)
        standingsRouter.start()
    }

    func navigateToMatchIncidentsComponent() {
        let matchIncidentRouter = MatchIncidentsRouter(navigationController: navigationController)
        matchIncidentRouter.start()
    }

    func navigateToMomentumComponent() {
        let momentumRouter = MomentumRouter(navigationController: navigationController)
        momentumRouter.start()
    }

    func navigateToMatchDetailViewTabs() {
        matchDetail?.start()
    }

    func navigateToChangeMatch() {
        let alert = UIAlertController(title: "Change Match ID",
                                      message: "Please type your match id",
                                      preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = storybookMatchId
        }
        alert.addAction(UIAlertAction(title: "Change",
                                      style: .default) { [weak alert] _ in
            guard let textField = alert?.textFields?[0],
                  let userText = textField.text else {
                return
            }
            storybookMatchId = userText
            self.navigationController.popViewController(animated: true)
        })
        alert.addAction(UIAlertAction(title: "Reset",
                                      style: .default) { _ in
            storybookMatchId = "Th3-C00l-M4tch"
            self.navigationController.popViewController(animated: true)
        })
        alert.addAction(UIAlertAction(title: "Close",
                                      style: .default) { _ in
            self.navigationController.popViewController(animated: true)
        })
        navigationController.present(alert, animated: true,
                                     completion: nil)
    }

    func navigateToStatisticsCarouselComponent() {
        let router = StatisticsCarouselRouter(navigationController: navigationController)
        router.start()
    }

    func changeViewState(_ state: KaizenSDK.KZStateComponentViewState, component: String) {
        debugPrint("\(state)  \(component)")
    }
}
// MARK: Private Methods
private extension MainRouter {
    func makeMainViewController() -> UIViewController {
        let presenter: MainPresentationLogic = MainPresenter()
        return  buildMainViewController(with: presenter, router: self)
    }
}
