@testable import DIContainer
import XCTest

final class UserFlowCoordinatorTests: XCTestCase {
    private var sut: UserFlowCoordinator!
    private var mockRouter: MockRouter!
    private var mockDependenciesContainer: MockDependenciesContainer!
    private var mockScreenFactory: MockScreenFactory!
    private var mockDelegate: MockDelegate!
    
    override func setUp() {
        super.setUp()
        mockRouter = MockRouter()
        mockScreenFactory = MockScreenFactory()
        mockDelegate = MockDelegate()
        sut = UserFlowCoordinator(
            router: mockRouter,
            screenFactory: mockScreenFactory,
            delegate: mockDelegate
        )
    }
    
    override func tearDown() {
        sut = nil
        mockRouter = nil
        mockScreenFactory = nil
        mockDelegate = nil
        super.tearDown()
    }
    
    func testStartPushesUser() {
        // When
        sut.start()
        // Then
        XCTAssertTrue(mockScreenFactory.makeUserScreenCalled)
        XCTAssertNotNil(mockRouter.pushedController)
    }
}
