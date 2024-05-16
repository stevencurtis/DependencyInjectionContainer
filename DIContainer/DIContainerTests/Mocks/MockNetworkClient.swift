@testable import DIContainer
import Foundation
import NetworkClient

final class MockNetworkClient: NetworkClient {
    var fetchAsyncResult: Any?
    private(set) var fetchAsyncCalled = false

    func fetch<T>(
        api: URLGenerator,
        method: HTTPMethod,
        request: T
    ) async throws -> T.ResponseDataType? where T: APIRequest {
        fetchAsyncCalled = true
        if let result = fetchAsyncResult as? AnyMockResult<T.ResponseDataType> {
            return try result.getResult()
        }
        if api.url == API.user.url {
            return mockUser() as? T.ResponseDataType
        }
        return nil
    }
    
    private func mockUser() -> User {
        return User(name: "name One")
    }
}
