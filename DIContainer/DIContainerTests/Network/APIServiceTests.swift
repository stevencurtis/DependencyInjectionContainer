@testable import DIContainer
import NetworkClient
import XCTest

final class APIServiceTests: XCTestCase {
    private var sut: APIService!
    private var mockNetworkClient: MockNetworkClient!
    override func setUp() {
        super.setUp()
        sut = APIService()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testPerformRequestSuccess() async {
        // Given
        let mockNetworkClient = MockNetworkClient()
        let userRequest = UserRequest()
        let mockUsers = User(name: "testName")
        mockNetworkClient.fetchAsyncResult = mockUsers

        // When
        do {
            let response = try await sut.performRequest(
                api: .user,
                method: .get(),
                request: userRequest,
                networkClient: mockNetworkClient
            )
            // Then
            XCTAssertNotNil(response)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    func testPerformRequestFailure() async {
        // Given
        let mockNetworkClient = MockNetworkClient()
        let mockRequest = MockRequest()
        let mockUsers = MockModel(name: "testName")
        mockNetworkClient.fetchAsyncResult = [mockUsers]
        // When
        do {
            let response = try await sut.performRequest(
                api: .user,
                method: .get(),
                request: mockRequest,
                networkClient: mockNetworkClient
            )
            
            // Then
            XCTFail("Unexpected data: \(response)")
        } catch {
            XCTAssertNotNil(error)
        }
    }
}
