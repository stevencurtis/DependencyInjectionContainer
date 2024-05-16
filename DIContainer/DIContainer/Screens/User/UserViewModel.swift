import Foundation

final class UserViewModel: ObservableObject {
    @Published private(set) var welcomeTitle: String = ""
    @Published var error: UserError?
    private let userRepository: UserRepositoryProtocol
    private let coordinator: UserFlowCoordinatorProtocol
    init(
        coordinator: UserFlowCoordinatorProtocol,
        userRepository: UserRepositoryProtocol = UserRepository()
    ) {
        self.coordinator = coordinator
        self.userRepository = userRepository
    }
    
    @MainActor
    func getUser() async {
        do {
            let userName = try await userRepository.getUser(checkCache: true)
            welcomeTitle = "User View!! \(userName.name)"
        } catch {
            self.error = UserError(
                message: "Something went wrong"
            )
        }
    }
}
