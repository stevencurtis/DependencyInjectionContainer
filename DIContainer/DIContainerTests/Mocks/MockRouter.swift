@testable import DIContainer
import UIKit

final class MockRouter: FlowRoutingServiceProtocol {
    private (set) var pushedController: UIViewController?
    func showPushed(_ controller: UIViewController) {
        pushedController = controller
    }
}
