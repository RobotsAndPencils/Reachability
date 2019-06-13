import XCTest
@testable import Reachability

final class ReachabilityTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertNotNil(TMReachability())
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
