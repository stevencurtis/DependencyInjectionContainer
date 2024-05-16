@testable import DIContainer
import Foundation

final class MockErrorHandler: ErrorHandlerProtocol {
    private(set) var handleCalled = false
    func handle(error: any Error) {
        handleCalled = true
    }
}
