import XCTest
@testable import GlyphInfo

final class GlyphInfoTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(GlyphInfo().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
