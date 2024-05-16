import Foundation

protocol UserRepositoryProtocol {
    func getUser(checkCache: Bool) async throws -> User
}

extension UserRepositoryProtocol {
    func getUser(checkCache: Bool = false) async throws -> User {
        try await getUser(checkCache: checkCache)
    }
}

final class UserRepository {
    private let userService: UserServiceProtocol
    private let userDefaults: UserDefaultsProtocol
    init(
        userService: UserServiceProtocol = UserService(),
        userDefaults: UserDefaultsProtocol = UserDefaults.standard
    ) {
        self.userService = userService
        self.userDefaults = userDefaults
    }
    
    private func fetchUserFromCache() -> User? {
          if let userData = userDefaults.data(forKey: "cachedUser") {
              return try? JSONDecoder().decode(User.self, from: userData)
          }
          return nil
      }
      
      private func cacheUser(_ user: User) {
          if let userData = try? JSONEncoder().encode(user) {
              userDefaults.set(userData, forKey: "cachedUser")
              userDefaults.synchronize()
          }
      }
}

extension UserRepository: UserRepositoryProtocol {
    @discardableResult
    func getUser(checkCache: Bool = true) async throws -> User {
        if checkCache, let user = fetchUserFromCache() {
            return user
        }
        let user = try await userService.getUser()
        cacheUser(user)
        return user
    }
}
