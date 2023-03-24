import UIKit
import KaizenSDK

protocol LineUpsDisplayLogic: AnyObject {
    func changeViewState(_ state: LineUpsPresenterViewState)
}
// MARK: Create Method
func buildLineUpsViewController(with presenter: LineUpsPresentationLogic) -> LineUpsViewController {
    // We create the controller
    let controller = LineUpsViewController()
    // inject presenter to controller
    controller.setupDependencies(with: presenter)
    return controller
}
class LineUpsViewController: UIViewController, LineUpsDisplayLogic, KZStateComponentDelegate {
    // MARK: Private Variables
    private var presenter: LineUpsPresentationLogic?
    // MARK: IBOutlets
    @IBOutlet private weak var lineUpComponent: LineUpsViewComponent!
    // MARK: Object lifecycle
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Clean Code Design Pattern 
    public func setupDependencies(with presenter: LineUpsPresentationLogic) {
        self.presenter = presenter
        self.presenter?.viewController = self
    }
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Lineups Component"
        presenter?.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        lineUpComponent.configure(with:
                                    KZViewModel(identifier: storybookMatchId,
                                                progressIndicatorColor: [.blue]))
        lineUpComponent.delegate = self
    }

    func changeViewState(_ state: KZStateComponentViewState, component: String) {
        guard case .underlying(let context) = state else {
            return
        }
        presenter?.didHaveAnError(with: context)
    }
}
extension LineUpsViewController {
    func changeViewState(_ state: LineUpsPresenterViewState) {
    }
}
