import Foundation

protocol UserDefaultsProtocol {
    func bool(forKey defaultName: String) -> Bool
    func data(forKey defaultName: String) -> Data?
    func set(_: Any?, forKey: String)
    @discardableResult func synchronize() -> Bool
}

extension UserDefaults: UserDefaultsProtocol {}
