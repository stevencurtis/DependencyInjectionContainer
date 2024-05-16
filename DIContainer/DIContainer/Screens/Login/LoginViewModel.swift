import Foundation

final class LoginViewModel {
    let welcomeTitle = "Welcome!!"
    private let coordinator: LoginFlowCoordinatorProtocol
    private let errorHandler: ErrorHandlerProtocol
    private let userInteractor: UserInteractorProtocol
    init(
        coordinator: LoginFlowCoordinatorProtocol,
        errorHandler: ErrorHandlerProtocol,
        userInteractor: UserInteractorProtocol
    ) {
        self.coordinator = coordinator
        self.errorHandler = errorHandler
        self.userInteractor = userInteractor
    }
    
    @MainActor
    func getUser() async {
        do {
            let userName = try await userInteractor.fetchUser()
            coordinator.loginDidFinish(user: userName)
        } catch {
            errorHandler.handle(error: error)
        }
    }
}
