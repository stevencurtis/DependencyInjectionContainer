@testable import DIContainer
import XCTest

final class UserRepositoryTests: XCTestCase {
    private var sut: UserRepository!
    private var userDefaults: MockUserDefaults!
    private var userService: MockUserService!
    
    override func setUp() {
        super.setUp()
        userDefaults = MockUserDefaults()
        userService = MockUserService()
        sut = UserRepository(
            userService: userService,
            userDefaults: userDefaults
        )
    }
    
    override func tearDown() {
        sut = nil
        userDefaults = nil
        userService = nil
        super.tearDown()
    }
    
    func testGetUserNotCached() async throws {
        // Given
        let expectedUser = User(name: "my user")
        userService.user = expectedUser
        userDefaults.dataValue = nil
        // When
        let user = try await sut.getUser()
        // Then
        XCTAssertEqual(user.name, expectedUser.name)
    }

    func testGetUserCached() async throws {
        // Given
        let expectedUser = User(name: "my user")
        let encoder = JSONEncoder()
        let userData = try encoder.encode(expectedUser)
        userDefaults.dataValue = userData
        // When
        let user = try await sut.getUser()
        // Then
        XCTAssertEqual(user.name, expectedUser.name)
    }
}
