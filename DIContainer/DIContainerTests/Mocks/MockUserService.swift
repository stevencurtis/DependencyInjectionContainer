@testable import DIContainer
import Foundation

final class MockUserService: UserServiceProtocol {
    var user = User(name: "testUser")
    func getUser() async throws -> DIContainer.User { user }
}
