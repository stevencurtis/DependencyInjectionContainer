@testable import DIContainer
import XCTest

final class FlowRoutingServiceTests: XCTestCase {
    private var mockNavigationController: MockNavigationController!
    private var sut: FlowRoutingService!
    
    override func setUp() {
        super.setUp()
        mockNavigationController = MockNavigationController()
        sut = FlowRoutingService(navigationController: mockNavigationController)
    }
    
    override func tearDown() {
        mockNavigationController = nil
        sut = nil
        super.tearDown()
    }
    
    func testShowPushed() {
        // Given
        let viewController = UIViewController()
        // When
        sut.showPushed(viewController)
        // Then
        XCTAssertEqual(mockNavigationController.viewControllers.count, 1)
        XCTAssertTrue(mockNavigationController.topViewController === viewController)
    }
}
