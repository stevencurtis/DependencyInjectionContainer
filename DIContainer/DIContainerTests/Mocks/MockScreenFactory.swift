@testable import DIContainer
import UIKit

final class MockScreenFactory: UserFlowScreenFactoryProtocol, LoginFlowScreenFactoryProtocol {
    private(set) var makeUserScreenCalled = false
    func makeUserScreen(
        coordinator: any DIContainer.UserFlowCoordinatorProtocol
    ) -> UIViewController {
        makeUserScreenCalled = true
        return UIViewController()
    }
    
    private(set) var makeLoginScreenCalled = false
    func makeLoginScreen(
        coordinator: any DIContainer.LoginFlowCoordinatorProtocol,
        dependenciesContainer: any DIContainer.DependenciesContainerProtocol
    ) -> UIViewController {
        makeLoginScreenCalled = true
        return UIViewController()
    }
}
