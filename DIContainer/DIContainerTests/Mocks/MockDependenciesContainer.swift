@testable import DIContainer
import Foundation

final class MockDependenciesContainer: DependenciesContainerProtocol {
    var errorHandler: DIContainer.ErrorHandlerProtocol = MockErrorHandler()
    var userInteractor: DIContainer.UserInteractorProtocol = MockUserInteractor()
}
