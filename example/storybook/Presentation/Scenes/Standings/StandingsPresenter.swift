enum StandingsPresenterViewState {
}

protocol StandingsPresentationLogic {
    var viewController: StandingsDisplayLogic? { get set }
    var router: StandingsRoutingLogic? { get }
    func viewDidLoad()
}

class StandingsPresenter: StandingsPresentationLogic {
    weak var viewController: StandingsDisplayLogic?
    var router: StandingsRoutingLogic?

    func viewDidLoad() {
    }
}
