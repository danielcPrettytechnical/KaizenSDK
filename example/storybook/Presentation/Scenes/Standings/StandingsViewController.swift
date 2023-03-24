import UIKit
import KaizenSDK

protocol StandingsDisplayLogic: AnyObject {
    func changeViewState(_ state: StandingsPresenterViewState)
}
// MARK: Create Method
func buildStandingsViewController(with presenter: StandingsPresentationLogic) -> StandingsViewController {
    // We create the controller
    let controller = StandingsViewController()
    // inject presenter to controller
    controller.setupDependencies(with: presenter)
    return controller
}
class StandingsViewController: UIViewController, StandingsDisplayLogic {
    // MARK: Private Variables
    private var presenter: StandingsPresentationLogic!
    // MARK: IBOutlets
    @IBOutlet private weak var standingsViewComponent: StandingsViewComponent!
    // MARK: Object lifecycle
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Clean Code Design Pattern 
    public func setupDependencies(with presenter: StandingsPresentationLogic) {
        self.presenter = presenter
        self.presenter.viewController = self
    }
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Standings Component"
        presenter.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        standingsViewComponent.configure(with:
                                            KZViewModel(identifier: storybookMatchId))
    }
}
extension StandingsViewController {
    func changeViewState(_ state: StandingsPresenterViewState) {
    }
}
