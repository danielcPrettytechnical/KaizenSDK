enum MatchIncidentsPresenterViewState {
}

protocol MatchIncidentsPresentationLogic {
    var viewController: MatchIncidentsDisplayLogic? { get set }
    var router: MatchIncidentsRoutingLogic? { get }
    func viewDidLoad()
}

class MatchIncidentsPresenter: MatchIncidentsPresentationLogic {
    weak var viewController: MatchIncidentsDisplayLogic?
    var router: MatchIncidentsRoutingLogic?

    func viewDidLoad() {
    }
}
