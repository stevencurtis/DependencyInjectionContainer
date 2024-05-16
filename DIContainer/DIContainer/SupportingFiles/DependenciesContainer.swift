import Foundation

protocol DependenciesContainerProtocol {
    var errorHandler: ErrorHandlerProtocol { get }
    var userInteractor: UserInteractorProtocol { get }
}

final class DependenciesContainer: DependenciesContainerProtocol {
    var errorHandler: ErrorHandlerProtocol { ErrorHandler() }
    var userInteractor: UserInteractorProtocol { UserInteractor() }
}
