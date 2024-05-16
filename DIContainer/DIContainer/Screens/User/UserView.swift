//
//  UserView.swift

import SwiftUI

struct UserView: View {
    @ObservedObject private var viewModel: UserViewModel
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        VStack {
            Text(viewModel.welcomeTitle)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .alert(item: $viewModel.error) { error in
            Alert(
                title: Text(
                    error.title
                ),
                message: Text(
                    error.message
                ),
                dismissButton: .default(
                    Text(
                        error.acceptButton
                    ),
                    action: {}
                )
            )
        }
        .task {
            await viewModel.getUser()
        }
    }
}

#Preview {
    UserView(
        viewModel: UserViewModel(
            coordinator: UserFlowCoordinator(
                router: FlowRoutingService(
                    navigationController: UINavigationController()
                ),
                delegate: MockUserFlowCoordinatorDelegate()
            )
        )
    )
}

final class MockUserFlowCoordinatorDelegate: UserFlowCoordinatorDelegate {
    func loginFlowCoordinatorDidFinish() {
        //
    }
}
