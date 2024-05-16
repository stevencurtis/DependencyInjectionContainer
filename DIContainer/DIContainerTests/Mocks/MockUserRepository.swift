@testable import DIContainer
import Foundation

final class MockUserRepository: UserRepositoryProtocol {
    var fetchUserResponse: MockUserResponse?
    private(set) var fetchUserCalled = false
    func getUser(checkCache: Bool) async throws -> User {
        guard let fetchUserResponse else {
            return User(name: "mock name")
        }
        fetchUserCalled = true
        switch fetchUserResponse {
        case .failure:
            throw MockError.mockError
        case .success(let user):
            return user
        }
    }
}
