@testable import DIContainer
import XCTest

final class AppCoordinatorTests: XCTestCase {
    private var sut: AppCoordinator!
    private var router: MockRouter!

    override func setUp() {
        super.setUp()
        router = MockRouter()
        let mockDependenciesContainer = MockDependenciesContainer()
        sut = AppCoordinator(
            router: router,
            dependenciesContainerProtocol: mockDependenciesContainer
        )
    }
    
    override func tearDown() {
        sut = nil
        router = nil
        super.tearDown()
    }
    
    func testStartPushesLogin() {
        // When
        sut.start()
        // Then
        XCTAssertNotNil(router.pushedController as? SwiftUIViewController<LoginView>)
    }
    
    func testLoginFlowCoordinatorDidFinishPushesUser() {
        // When
        sut.loginFlowCoordinatorDidFinish()
        // Then
        XCTAssertNotNil(router.pushedController as? SwiftUIViewController<UserView>)
    }
}
