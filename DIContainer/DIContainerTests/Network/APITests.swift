@testable import DIContainer
import XCTest

final class APITests: XCTestCase {
    func testUsers() async {
        XCTAssertEqual(API.user.url, URL(string: "https://jsonplaceholder.typicode.com/users/1"))
    }
}
