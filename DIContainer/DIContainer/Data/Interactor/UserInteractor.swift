import Foundation

protocol UserInteractorProtocol {
    func fetchUser() async throws -> User
}

final class UserInteractor: UserInteractorProtocol {
    private let userRepository: UserRepositoryProtocol
    init(
        userRepository: UserRepositoryProtocol = UserRepository()
    ) {
        self.userRepository = userRepository
    }
    
    func fetchUser() async throws -> User {
        try await userRepository.getUser()
    }
}
