import Leetcode
import XCTest

class LeetcodeConstantsTests: XCTestCase {
    func testSessionName() {
        XCTAssertEqual(LeetcodeConstants.sessionCookieName, "LEETCODE_SESSION")
    }
}
