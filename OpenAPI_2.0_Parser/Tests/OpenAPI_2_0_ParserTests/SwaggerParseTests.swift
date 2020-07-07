import XCTest
@testable import SwaggerParse

final class SwaggerParseTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwaggerParse().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
