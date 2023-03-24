import UIKit
import KaizenSDK

protocol PitchDisplayLogic: AnyObject {
    func changeViewState(_ state: PitchPresenterViewState)
}
// MARK: Create Method
func buildPitchViewController(with presenter: PitchPresentationLogic) -> PitchViewController {
    // We create the controller
    let controller = PitchViewController()
    // inject presenter to controller
    controller.setupDependencies(with: presenter)
    return controller
}
class PitchViewController: UIViewController, PitchDisplayLogic, KZStateComponentDelegate {
    // MARK: Private Variables
    private var presenter: PitchPresentationLogic!
    // MARK: IBOutlets
    @IBOutlet private weak var pitchContainerView: UIView!
    // MARK: Object lifecycle
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Clean Code Design Pattern 
    public func setupDependencies(with presenter: PitchPresentationLogic) {
        self.presenter = presenter
        self.presenter.viewController = self
    }
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pitch Component"
        presenter.viewDidLoad()
    }

    func createPitchComponentContainer() {
        let pitch = PitchViewComponent()
        pitch.delegate = self
        pitch.translatesAutoresizingMaskIntoConstraints = false
        pitchContainerView.addSubview(pitch)
        pitchContainerView.translatesAutoresizingMaskIntoConstraints = false
        pitch.trailingAnchor.constraint(equalTo: pitchContainerView.trailingAnchor,
                                        constant: 0).isActive = true
        pitch.leadingAnchor.constraint(equalTo: pitchContainerView.leadingAnchor,
                                       constant: 0).isActive = true
        pitch.bottomAnchor.constraint(equalTo: pitchContainerView.bottomAnchor,
                                      constant: 0).isActive = true
        pitch.topAnchor.constraint(equalTo: pitchContainerView.topAnchor,
                                   constant: 0).isActive = true
        pitch.configure(with: KZViewModel(identifier: storybookMatchId))
    }

    func changeViewState(_ state: KZStateComponentViewState, component: String) {
        debugPrint(state)
        debugPrint(component)
    }
}
extension PitchViewController {
    func changeViewState(_ state: PitchPresenterViewState) {
        createPitchComponentContainer()
    }
}
