import XCTest
@testable import keyboard_observer

final class keyboard_observerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(keyboard_observer().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
