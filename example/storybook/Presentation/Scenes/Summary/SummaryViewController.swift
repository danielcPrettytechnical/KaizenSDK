import UIKit
import KaizenSDK

protocol SummaryDisplayLogic: AnyObject {
    func changeViewState(_ state: SummaryPresenterViewState)
}
// MARK: Create Method
func buildSummaryViewController(with presenter: SummaryPresentationLogic) -> SummaryViewController {
    // We create the controller
    let controller = SummaryViewController()
    // inject presenter to controller
    controller.setupDependencies(with: presenter)
    return controller
}
class SummaryViewController: UIViewController, SummaryDisplayLogic {
    // MARK: Private Variables
    private var presenter: SummaryPresentationLogic!
    // MARK: IBOutlets
    @IBOutlet private weak var summaryComponentView: SummaryViewComponent!
    // MARK: Object lifecycle
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Clean Code Design Pattern 
    public func setupDependencies(with presenter: SummaryPresentationLogic) {
        self.presenter = presenter
        self.presenter.viewController = self
    }
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Summary Component"
        presenter.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        summaryComponentView.configure(with:
                                        KZViewModel(identifier: storybookMatchId))
    }
}
extension SummaryViewController {
    func changeViewState(_ state: SummaryPresenterViewState) {
    }
}
