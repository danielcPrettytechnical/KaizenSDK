enum StatisticsCarouselPresenterViewState {
}

protocol StatisticsCarouselPresentationLogic: AnyObject {
    var viewController: StatisticsCarouselDisplayLogic? { get set }
    var router: StatisticsCarouselRoutingLogic? { get set }
    func viewDidLoad()
    func didHaveAnError(with message: String)
}

class StatisticsCarouselPresenter: StatisticsCarouselPresentationLogic {
    weak var viewController: StatisticsCarouselDisplayLogic?
    var router: StatisticsCarouselRoutingLogic?

    func viewDidLoad() {
    }

    func didHaveAnError(with message: String) {
        // router?.showError(with: message)
    }
}
