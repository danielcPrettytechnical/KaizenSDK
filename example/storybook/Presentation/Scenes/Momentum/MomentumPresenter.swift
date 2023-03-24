enum MomentumPresenterViewState {
}

protocol MomentumPresentationLogic: AnyObject {
    var viewController: MomentumDisplayLogic? { get set }
    var router: MomentumRoutingLogic? { get set }
    func viewDidLoad()
    func didHaveAnError(with message: String)
}

class MomentumPresenter: MomentumPresentationLogic {
    weak var viewController: MomentumDisplayLogic?
    var router: MomentumRoutingLogic?

    func viewDidLoad() {
    }

    func didHaveAnError(with message: String) {
        router?.showError(with: message)
    }
}
