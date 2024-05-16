@testable import DIContainer
import XCTest

final class UserInteractorTests: XCTestCase {
    private var sut: UserInteractor!
    private var repository: MockUserRepository!
    
    override func setUp() {
        super.setUp()
        repository = MockUserRepository()
        sut = UserInteractor(userRepository: repository)
    }
    
    override func tearDown() {
        sut = nil
        repository = nil
        super.tearDown()
    }
    
    func testGetUser() async throws {
        // Given
        let expectedUser = User(name: "UserName")
        repository.fetchUserResponse = .success(expectedUser)
        // When
        let user = try await sut.fetchUser()
        // Then
        XCTAssertEqual(user.name, expectedUser.name)
    }
}
