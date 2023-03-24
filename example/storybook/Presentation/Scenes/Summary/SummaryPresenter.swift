enum SummaryPresenterViewState {
}

protocol SummaryPresentationLogic {
    var viewController: SummaryDisplayLogic? { get set }
    var router: SummaryRoutingLogic? { get }
    func viewDidLoad()
}

class SummaryPresenter: SummaryPresentationLogic {
    weak var viewController: SummaryDisplayLogic?
    weak var router: SummaryRoutingLogic?

    func viewDidLoad() {
    }
}
