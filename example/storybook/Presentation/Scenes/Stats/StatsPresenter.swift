enum StatsPresenterViewState {
}

protocol StatsPresentationLogic {
    var viewController: StatsDisplayLogic? { get set }
    var router: StatsRoutingLogic? { get }
    func viewDidLoad()
}

class StatsPresenter: StatsPresentationLogic {
    weak var viewController: StatsDisplayLogic?
    weak var router: StatsRoutingLogic?

    func viewDidLoad() {
    }
}
