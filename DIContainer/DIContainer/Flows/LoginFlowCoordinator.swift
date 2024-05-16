import SwiftUI

protocol LoginFlowCoordinatorProtocol {
    func loginDidFinish(user: User)
}

protocol LoginFlowCoordinatorDelegate: AnyObject {
    func loginFlowCoordinatorDidFinish()
}

final class LoginFlowCoordinator: LoginFlowCoordinatorProtocol {
    private weak var delegate: LoginFlowCoordinatorDelegate?
    private let dependenciesContainer: DependenciesContainerProtocol
    private let router: FlowRoutingServiceProtocol
    private let screenFactory: LoginFlowScreenFactoryProtocol
    
    init(
        router: FlowRoutingServiceProtocol,
        dependenciesContainer: DependenciesContainerProtocol,
        screenFactory: LoginFlowScreenFactoryProtocol = ScreenFactory(),
        delegate: LoginFlowCoordinatorDelegate
    ) {
        self.delegate = delegate
        self.dependenciesContainer = dependenciesContainer
        self.router = router
        self.screenFactory = screenFactory
    }

    func start() {
        router.showPushed(
            screenFactory.makeLoginScreen(
                coordinator: self,
                dependenciesContainer: dependenciesContainer
            )
        )
    }
    
    func loginDidFinish(user: User) {
        delegate?.loginFlowCoordinatorDidFinish()
    }
}
