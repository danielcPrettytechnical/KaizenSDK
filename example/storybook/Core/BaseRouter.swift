import Foundation
import UIKit

public protocol BaseRouter: AnyObject {
    var navigationController: UINavigationController! { get }
    func showError(with message: String)
    func start()
}

public extension BaseRouter {
    func showError(with message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Go Back",
                                      style: .default) { _ in
            self.navigationController.popViewController(animated: true)
        })
        navigationController.present(alert, animated: true,
                                     completion: nil)
    }
}
