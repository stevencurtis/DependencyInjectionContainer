import UIKit

protocol FlowRoutingServiceProtocol {
    func showPushed(_ controller: UIViewController)
}

final class FlowRoutingService {
    private let navigationController: NavigationControllerProtocol

    init(navigationController: NavigationControllerProtocol) {
        self.navigationController = navigationController
    }
}

extension FlowRoutingService: FlowRoutingServiceProtocol {
    func showPushed(_ controller: UIViewController) {
        navigationController.pushViewController(controller, animated: false)
    }
}
