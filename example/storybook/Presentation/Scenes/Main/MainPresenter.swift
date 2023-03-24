enum MainPresenterViewState {
    case show([MainComponentsValue])
}
protocol MainPresentationLogic: AnyObject {
    var viewController: MainDisplayLogic? { get set }
    var router: MainRoutingLogic? { get set }
    func viewDidLoad()
    func sectionSelected(with value: MainComponentsValue)
    func didTapChangeMatch()
}

class MainPresenter: MainPresentationLogic {
    weak var viewController: MainDisplayLogic?
    weak var router: MainRoutingLogic?

    func viewDidLoad() {
        let items: [MainComponentsValue] = MainComponentsValue.allCases
        viewController?.changeViewState(.show(items))
    }

    func sectionSelected(with value: MainComponentsValue) {
        switch value {
        case .pitchComponent:
            router?.navigateToPitchComponent()
        case .statsComponent:
            router?.navigateToStatsComponent()
        case .summaryComponent:
            router?.navigateToSummaryComponent()
        case .lineUpsComponent:
            router?.navigateToLineUpComponent()
        case .standingsComponent:
            router?.navigateToStandingsComponent()
        case .matchIncidentsComponent:
            router?.navigateToMatchIncidentsComponent()
        case .matchDetailTabsView:
            router?.navigateToMatchDetailViewTabs()
        case .momentumComponent:
            router?.navigateToMomentumComponent()
        case .statisticsCarousel:
            router?.navigateToStatisticsCarouselComponent()
        }
    }

    func didTapChangeMatch() {
        router?.navigateToChangeMatch()
    }

}
