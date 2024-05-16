@testable import DIContainer
import Combine
import XCTest

final class LoginViewModelTests: XCTestCase {
    private var sut: LoginViewModel!
    private var mockCoordinator: MockLoginFlowCoordinator!
    private var mockErrorHandler: MockErrorHandler!
    private var mockUserInteractor: MockUserInteractor!

    override func setUp() {
        mockCoordinator = MockLoginFlowCoordinator()
        mockErrorHandler = MockErrorHandler()
        mockUserInteractor = MockUserInteractor()
        sut = LoginViewModel(
            coordinator: mockCoordinator,
            errorHandler: mockErrorHandler,
            userInteractor: mockUserInteractor
        )
    }
    
    override func tearDown() {
        mockCoordinator = nil
        mockErrorHandler = nil
        mockUserInteractor = nil
        sut = nil
        super.tearDown()
    }
    
    func testTitle() {
        XCTAssertEqual(sut.welcomeTitle, "Welcome!!")
    }
    
    func testGetUserCallsCoordinator() async {
        // Given
        let mockUser = User(name: "Test User")
        mockUserInteractor.fetchUserResponse = .success(mockUser)
        // When
        await sut.getUser()        
        // Then
        XCTAssertTrue(mockUserInteractor.fetchUserCalled)
        XCTAssertTrue(mockCoordinator.loginDidFinishCalled)
    }
    
    func testGetUserError() async {
        // Given
        mockUserInteractor.fetchUserResponse = .failure
        // When
        await sut.getUser()
        // Then
        XCTAssertTrue(mockUserInteractor.fetchUserCalled)
        XCTAssertTrue(mockErrorHandler.handleCalled)
    }
}
