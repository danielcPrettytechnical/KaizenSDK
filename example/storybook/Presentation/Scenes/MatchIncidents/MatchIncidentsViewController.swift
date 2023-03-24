import UIKit
import KaizenSDK

protocol MatchIncidentsDisplayLogic: AnyObject {
    func changeViewState(_ state: MatchIncidentsPresenterViewState)
}
// MARK: Create Method
func buildMatchIncidentsViewController(
    with presenter: MatchIncidentsPresentationLogic) -> MatchIncidentsViewController {
    // We create the controller
    let controller = MatchIncidentsViewController()
    // inject presenter to controller
    controller.setupDependencies(with: presenter)
    return controller
}
class MatchIncidentsViewController: UIViewController, MatchIncidentsDisplayLogic {
    // MARK: Private Variables
    private var presenter: MatchIncidentsPresentationLogic!
    // MARK: IBOutlets
    @IBOutlet private weak var matchViewComponent: MatchViewComponent!
    // MARK: Object lifecycle
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Clean Code Design Pattern 
    public func setupDependencies(with presenter: MatchIncidentsPresentationLogic) {
        self.presenter = presenter
        self.presenter.viewController = self
    }
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Match Incidents Component"
        presenter.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        matchViewComponent.configure(with: KZViewModel(identifier: storybookMatchId))
    }
}
extension MatchIncidentsViewController {
    func changeViewState(_ state: MatchIncidentsPresenterViewState) {
    }
}
