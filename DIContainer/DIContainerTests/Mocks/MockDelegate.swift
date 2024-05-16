@testable import DIContainer
import Foundation

final class MockDelegate: LoginFlowCoordinatorDelegate, UserFlowCoordinatorDelegate {
    private(set) var loginFlowCoordinatorDidFinishCalled = false
    func loginFlowCoordinatorDidFinish() {
        loginFlowCoordinatorDidFinishCalled = true
    }
}
