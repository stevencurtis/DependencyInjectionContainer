@testable import DIContainer
import UIKit

final class MockNavigationController: NavigationControllerProtocol {
    var pushedViewController: UIViewController?
    var viewControllers: [UIViewController] = []
    var topViewController: UIViewController? {
        viewControllers.last
    }

    func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedViewController = viewController
        viewControllers.append(viewController)
    }
}
