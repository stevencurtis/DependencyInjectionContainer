import Foundation

protocol UserFlowCoordinatorProtocol {}
protocol UserFlowCoordinatorDelegate: AnyObject {}

final class UserFlowCoordinator: UserFlowCoordinatorProtocol {
    private weak var delegate: UserFlowCoordinatorDelegate?
    private let router: FlowRoutingServiceProtocol
    private let screenFactory: UserFlowScreenFactoryProtocol
    
    init(
        router: FlowRoutingServiceProtocol,
        screenFactory: UserFlowScreenFactoryProtocol = ScreenFactory(),
        delegate: UserFlowCoordinatorDelegate
    ) {
        self.delegate = delegate
        self.router = router
        self.screenFactory = screenFactory
    }
    
    func start() {
        router.showPushed(screenFactory.makeUserScreen(coordinator: self))
    }
}
