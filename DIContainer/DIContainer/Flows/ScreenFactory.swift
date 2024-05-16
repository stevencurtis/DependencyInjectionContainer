import UIKit

protocol LoginFlowScreenFactoryProtocol {
    func makeLoginScreen(
        coordinator: LoginFlowCoordinatorProtocol,
        dependenciesContainer: DependenciesContainerProtocol
    ) -> UIViewController
}

protocol UserFlowScreenFactoryProtocol {
  func makeUserScreen(coordinator: UserFlowCoordinatorProtocol) -> UIViewController
}

struct ScreenFactory: UserFlowScreenFactoryProtocol {
    func makeUserScreen(
        coordinator: UserFlowCoordinatorProtocol
    ) -> UIViewController {
        let userView = UserView(
            viewModel: UserViewModel(
                coordinator: coordinator
            )
        )
        let swiftUIViewControllerConfiguration = SwiftUIViewConfiguration(view: userView, hidesNavBackButton: true)
        let userViewController = SwiftUIViewController(configuration: swiftUIViewControllerConfiguration)
        return userViewController
    }
}

extension ScreenFactory: LoginFlowScreenFactoryProtocol {
    func makeLoginScreen(
        coordinator: LoginFlowCoordinatorProtocol,
        dependenciesContainer: DependenciesContainerProtocol
    ) -> UIViewController {
        let loginView = LoginView(
            viewModel: LoginViewModel(
                coordinator: coordinator,
                errorHandler: dependenciesContainer.errorHandler,
                userInteractor: dependenciesContainer.userInteractor
            )
        )
        let swiftUIViewControllerConfiguration = SwiftUIViewConfiguration(view: loginView, hidesNavBackButton: false)
        let loginViewController = SwiftUIViewController(configuration: swiftUIViewControllerConfiguration)
        return loginViewController
    }
}
