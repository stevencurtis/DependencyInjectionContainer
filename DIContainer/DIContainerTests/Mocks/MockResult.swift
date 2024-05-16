import Foundation

protocol MockResult {
    associatedtype DataType
    func getResult() throws -> DataType?
}

struct MockSuccess<T>: MockResult {
    var result: T
    func getResult() throws -> T? { result }
}

struct MockFailure: MockResult {
    var error: Error
    func getResult() throws -> Never? { throw error }
}

final class AnyMockResult<T>: MockResult {
    private let _getResult: () throws -> T?

    init<U: MockResult>(_ wrapped: U) where U.DataType == T {
        _getResult = { try wrapped.getResult() }
    }

    func getResult() throws -> T? {
        try _getResult()
    }
}
