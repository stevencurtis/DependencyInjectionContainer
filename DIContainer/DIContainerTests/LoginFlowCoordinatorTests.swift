@testable import DIContainer
import XCTest

final class LoginFlowCoordinatorTests: XCTestCase {
    private var sut: LoginFlowCoordinator!
    private var mockRouter: MockRouter!
    private var mockDependenciesContainer: MockDependenciesContainer!
    private var mockScreenFactory: MockScreenFactory!
    private var mockDelegate: MockDelegate!

    override func setUp() {
        super.setUp()
        mockRouter = MockRouter()
        mockDependenciesContainer = MockDependenciesContainer()
        mockScreenFactory = MockScreenFactory()
        mockDelegate = MockDelegate()
        sut = LoginFlowCoordinator(
            router: mockRouter,
            dependenciesContainer: mockDependenciesContainer,
            screenFactory: mockScreenFactory,
            delegate: mockDelegate
        )
    }
    
    override func tearDown() {
        sut = nil
        mockRouter = nil
        mockDependenciesContainer = nil
        mockScreenFactory = nil
        mockDelegate = nil
        super.tearDown()
    }
    
    func testStartPushesLogin() {
        // When
        sut.start()
        // Then
        XCTAssertTrue(mockScreenFactory.makeLoginScreenCalled)
        XCTAssertNotNil(mockRouter.pushedController)
    }
    
    func testLoginFlowCoordinatorDidFinishPushesUser() {
        // When
        sut.loginDidFinish(user: User(name: "mock"))
        // Then
        XCTAssertTrue(mockDelegate.loginFlowCoordinatorDidFinishCalled)
    }
}
