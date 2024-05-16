import Foundation

protocol AppCoordinatorProtocol {
    func start()
}

final class AppCoordinator: AppCoordinatorProtocol {
    private let dependenciesContainerProtocol: DependenciesContainerProtocol
    private let router: FlowRoutingServiceProtocol
    
    init(router: FlowRoutingServiceProtocol, dependenciesContainerProtocol: DependenciesContainerProtocol) {
        self.router = router
        self.dependenciesContainerProtocol = dependenciesContainerProtocol
    }
    
    func start() {
        let loginCoordinator = LoginFlowCoordinator(
            router: router,
            dependenciesContainer: dependenciesContainerProtocol,
            delegate: self
        )
        loginCoordinator.start()
    }
    
    private func startMainAppFlow() {
        let userFlowCoordinator = UserFlowCoordinator(
            router: router,
            delegate: self
        )
        userFlowCoordinator.start()
    }
}

extension AppCoordinator: LoginFlowCoordinatorDelegate {
    func loginFlowCoordinatorDidFinish() {
        startMainAppFlow()
    }
}

extension AppCoordinator: UserFlowCoordinatorDelegate {}
