import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(keyboard_observerTests.allTests),
    ]
}
#endif
