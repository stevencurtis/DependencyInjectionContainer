import UIKit

protocol NavigationControllerProtocol: AnyObject {
    func pushViewController(_ viewController: UIViewController, animated: Bool)
    var viewControllers: [UIViewController] { get }
    var topViewController: UIViewController? { get }
}

extension UINavigationController: NavigationControllerProtocol {}

