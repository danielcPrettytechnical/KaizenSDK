enum PitchPresenterViewState {
    case render
}

protocol PitchPresentationLogic: AnyObject {
    var viewController: PitchDisplayLogic? { get set }
    var router: PitchRoutingLogic? { get }
    func viewDidLoad()
}

final class PitchPresenter: PitchPresentationLogic {
    weak var viewController: PitchDisplayLogic?
    weak var router: PitchRoutingLogic?

    func viewDidLoad() {
        viewController?.changeViewState(.render)
    }
}
