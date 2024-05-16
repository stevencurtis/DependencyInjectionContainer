@testable import DIContainer
import Combine
import XCTest

final class UserViewModelTests: XCTestCase {
    private var sut: UserViewModel!
    private var mockCoordinator: MockUserFlowCoordinator!
    private var mockRepository: MockUserRepository!
    private var cancellables = Set<AnyCancellable>()
    private let immediateScheduler = ImmediateScheduler.shared

    override func setUp() {
        mockCoordinator = MockUserFlowCoordinator()
        mockRepository = MockUserRepository()
        sut = UserViewModel(coordinator: mockCoordinator, userRepository: mockRepository)
    }
    
    override func tearDown() {
        mockCoordinator = nil
        mockRepository = nil
        sut = nil
        cancellables = []
    }
    
    func testTitle() {
        XCTAssertEqual(sut.welcomeTitle, "")
    }
    
    func testGetUserSetsName() async {
        // Given
        let expectation = XCTestExpectation()
        let mockUser = User(name: "Test User")
        mockRepository.fetchUserResponse = .success(mockUser)
        // When
        await sut.getUser()
        
        sut
            .$welcomeTitle
            .receive(on: immediateScheduler)
            .sink { name in
                // Then
                XCTAssertEqual(name, "User View!! \(mockUser.name)")
                XCTAssertTrue(self.mockRepository.fetchUserCalled)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        await fulfillment(of: [expectation])
    }
    
    func testGetUserError() async {
        // Given
        let expectation = XCTestExpectation()
        mockRepository.fetchUserResponse = .failure
        // When
        await sut.getUser()
        
        sut
            .$error
            .receive(on: immediateScheduler)
            .sink { error in
                // Then
                XCTAssertEqual(error?.message, "Something went wrong")
                XCTAssertTrue(self.mockRepository.fetchUserCalled)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        await fulfillment(of: [expectation])
    }
}
