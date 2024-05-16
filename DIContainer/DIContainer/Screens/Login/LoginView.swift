import SwiftUI

struct LoginView: View {
    private let viewModel: LoginViewModel
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        VStack {
            Text(viewModel.welcomeTitle)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .task {
            await viewModel.getUser()
        }
    }
}

#Preview {
    LoginView(
        viewModel: LoginViewModel(
            coordinator: LoginFlowCoordinator(
                router: FlowRoutingService(
                    navigationController: UINavigationController()
                ), 
                dependenciesContainer: DependenciesContainer(), 
                delegate: MockLoginFlowCoordinatorDelegate()
            ),
            errorHandler: DependenciesContainer().errorHandler,
            userInteractor: DependenciesContainer().userInteractor
            
        )
    )
}

final class MockLoginFlowCoordinatorDelegate: LoginFlowCoordinatorDelegate {
    func loginFlowCoordinatorDidFinish() {}
}
