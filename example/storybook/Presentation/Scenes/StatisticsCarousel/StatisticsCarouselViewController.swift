import UIKit
import KaizenSDK

protocol StatisticsCarouselDisplayLogic: AnyObject {
    func changeViewState(_ state: StatisticsCarouselPresenterViewState)
}
// MARK: Create Method
func buildStatisticsCarouselViewController(_ presenter: StatisticsCarouselPresentationLogic)
-> StatisticsCarouselViewController {
    // We create the controller
    let controller = StatisticsCarouselViewController()
    // inject presenter to controller
    controller.setupDependencies(with: presenter)
    return controller
}
class StatisticsCarouselViewController: UIViewController,
                                        StatisticsCarouselDisplayLogic,
                                        KZStateComponentDelegate {
    // MARK: Private Variables
    private var presenter: StatisticsCarouselPresentationLogic?
    // MARK: IBOutlets
    @IBOutlet private weak var statisticsCarouselComponent: StatisticsCarouselComponent!
    // MARK: Object lifecycle
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Clean Code Design Pattern 
    public func setupDependencies(with presenter: StatisticsCarouselPresentationLogic) {
        self.presenter = presenter
        self.presenter?.viewController = self
    }
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "StatisticsCarousel Component"
        presenter?.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        statisticsCarouselComponent.delegate = self
        statisticsCarouselComponent.dataSource = self
        statisticsCarouselComponent.configure(with:
                                    KZViewModel(identifier: storybookMatchId))
    }

    func changeViewState(_ state: KZStateComponentViewState, component: String) {
        guard case .underlying(let context) = state else {
            return
        }
        presenter?.didHaveAnError(with: context)
    }
}
extension StatisticsCarouselViewController {
    func changeViewState(_ state: StatisticsCarouselPresenterViewState) {
    }
}

extension StatisticsCarouselViewController: StatisticsCarouselDataSource {
    func numberOfPagesInStatisticsCarousel() -> [StatisticsCarouselPage] {
        [.momentum, .pitch, .stats]
    }
}
