@testable import DIContainer
import Foundation

final class MockLoginFlowCoordinator: LoginFlowCoordinatorProtocol {
    var loginDidFinishCalled: Bool = false
    func loginDidFinish(user: User) {
        loginDidFinishCalled = true
    }
}
