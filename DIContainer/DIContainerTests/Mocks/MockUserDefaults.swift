@testable import DIContainer
import Foundation

final class MockUserDefaults: UserDefaultsProtocol {
    var boolValue = false
    func bool(forKey defaultName: String) -> Bool {
        return boolValue
    }
    
    var dataValue: Data?
    func data(forKey defaultName: String) -> Data? {
        dataValue
    }
    
    func set(_: Any?, forKey: String) {
    }
    
    
    func synchronize() -> Bool {
        true
    }
    
    var shouldReturnBool: Bool = false
    func data(forKey defaultName: String) -> Bool? {
        shouldReturnBool
    }
}
