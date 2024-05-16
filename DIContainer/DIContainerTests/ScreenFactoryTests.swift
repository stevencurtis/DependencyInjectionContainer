@testable import DIContainer
import XCTest

final class ScreenFactoryTests: XCTestCase {
    private var sut: ScreenFactory!

    override func setUp() {
        super.setUp()
        sut = ScreenFactory()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testMakeUserScreen() {
        // When
        let viewController = sut.makeUserScreen(coordinator: MockUserFlowCoordinator())
        // Then
        XCTAssertNotNil(viewController as? SwiftUIViewController<UserView>)
    }
    
    func testMakePostsLoginScreen() {
        // When
        let dependenciesContainer = DependenciesContainer()
        let viewController = sut.makeLoginScreen(
            coordinator: MockLoginFlowCoordinator(),
            dependenciesContainer: dependenciesContainer
        )
        // Then
        XCTAssertNotNil(viewController as? SwiftUIViewController<LoginView>)
    }
}
