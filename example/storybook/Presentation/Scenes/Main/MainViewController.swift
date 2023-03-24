import UIKit
import KaizenSDK

protocol MainDisplayLogic: AnyObject {
    func changeViewState(_ state: MainPresenterViewState)
}
// MARK: Create Method
func buildMainViewController(with presenter: MainPresentationLogic,
                             router: MainRoutingLogic?) -> MainViewController {
    // We create the controller
    presenter.router = router
    let controller = MainViewController()
    // inject presenter to controller
    controller.setupDependencies(with: presenter)
    return controller
}
class MainViewController: UIViewController, MainDisplayLogic {
    // MARK: Private Variables
    private var presenter: MainPresentationLogic!
    private var componentList: [MainComponentsValue] = []
    // MARK: IBOutlets
    @IBOutlet private weak var componentTableView: UITableView!
    // MARK: Object lifecycle
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Clean Code Design Pattern 
    public func setupDependencies(with presenter: MainPresentationLogic) {
        self.presenter = presenter
        self.presenter.viewController = self
    }
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createTableView()
        title = "Storybook"
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(title: "Change id",
                            style: .done,
                            target: self,
                            action: #selector(addTapped))
        presenter.viewDidLoad()
    }
}
private extension MainViewController {
    @objc func addTapped() {
        presenter?.didTapChangeMatch()
    }
}
extension MainViewController: UITableViewDelegate,
                              UITableViewDataSource {
    func changeViewState(_ state: MainPresenterViewState) {
        switch state {
        case .show(let componentList):
            self.componentList = componentList
            componentTableView.reloadData()
        }
    }

    func createTableView() {
        componentTableView.delegate = self
        componentTableView.dataSource = self
        componentTableView.rowHeight = UITableView.automaticDimension
        componentTableView.allowsSelection = true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return componentList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let uiTableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.default,
                                              reuseIdentifier: "mainController")
        uiTableViewCell.textLabel?.text
            = componentList[indexPath.row].componentTitle
        return uiTableViewCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.sectionSelected(with: componentList[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
