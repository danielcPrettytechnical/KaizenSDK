import UIKit
import KaizenSDK

protocol MomentumDisplayLogic: AnyObject {
    func changeViewState(_ state: MomentumPresenterViewState)
}
// MARK: Create Method
func buildMomentumViewController(with presenter: MomentumPresentationLogic) -> MomentumViewController {
    // We create the controller
    let controller = MomentumViewController()
    // inject presenter to controller
    controller.setupDependencies(with: presenter)
    return controller
}
class MomentumViewController: UIViewController, MomentumDisplayLogic, KZStateComponentDelegate {
    // MARK: Private Variables
    private var presenter: MomentumPresentationLogic?
    // MARK: IBOutlets
    @IBOutlet private weak var momentumComponent: MomentumViewComponent!
    // MARK: Object lifecycle
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Setup Clean Code Design Pattern 
    public func setupDependencies(with presenter: MomentumPresentationLogic) {
        self.presenter = presenter
        self.presenter?.viewController = self
    }
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Momentum Component"
        presenter?.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        momentumComponent.configure(with:
                                    KZViewModel(identifier: storybookMatchId))
        momentumComponent.delegate = self
    }

    func changeViewState(_ state: KZStateComponentViewState, component: String) {
        guard case .underlying(let context) = state else {
            return
        }
        presenter?.didHaveAnError(with: context)
    }
}
extension MomentumViewController {
    func changeViewState(_ state: MomentumPresenterViewState) {
    }
}
