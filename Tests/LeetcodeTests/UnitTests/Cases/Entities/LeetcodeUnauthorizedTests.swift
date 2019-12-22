import Leetcode
import XCTest

class LeetcodeUnauthorizedTests: XCTest {
    func testLocalizedDescription() {
        let error = LeetcodeUnauthorized()
        assertLocalizedDescription(of: error, isEqualTo: "401 Unathorized")
    }
    
    func testDebugDescription() {
        let error = LeetcodeUnauthorized()
        assertDebugDescription(of: error, isEqualTo: "401 Unathorized")
    }
}
