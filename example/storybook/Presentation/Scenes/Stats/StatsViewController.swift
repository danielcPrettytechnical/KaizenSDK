import UIKit
import KaizenSDK

protocol StatsDisplayLogic: AnyObject {
    func changeViewState(_ state: StatsPresenterViewState)
}
// MARK: Create Method
func buildStatsViewController(with presenter: StatsPresentationLogic) -> StatsViewController {
    // We create the controller
    let controller = StatsViewController()
    // inject presenter to controller
    controller.setupDependencies(with: presenter)
    return controller
}
class StatsViewController: UIViewController, StatsDisplayLogic {
    // MARK: Private Variables
    private var presenter: StatsPresentationLogic!
    // MARK: IBOutlets
    @IBOutlet private weak var statsComponentView: StatsViewComponent!
    // MARK: Object lifecycle
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Clean Code Design Pattern 
    public func setupDependencies(with presenter: StatsPresentationLogic) {
        self.presenter = presenter
        self.presenter.viewController = self
    }
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Stats Component"
        presenter.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        statsComponentView.configure(with:
                                        KZViewModel(identifier: storybookMatchId))
    }
}
extension StatsViewController {
    func changeViewState(_ state: StatsPresenterViewState) {
    }
}
