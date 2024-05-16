import NetworkClient

protocol UserServiceProtocol {
    func getUser() async throws -> User
}

final class UserService: UserServiceProtocol {
    private let networkClient: NetworkClient
    init(
        networkClient: NetworkClient = MainNetworkClient()
    ) {
        self.networkClient = networkClient
    }
    
    func getUser() async throws -> User {
        let userRequest = UserRequest()
        let api = API.user
        let user = try await APIService().performRequest(
            api: api,
            method: .get(),
            request: userRequest,
            networkClient: networkClient
        )
        return user
    }
}
