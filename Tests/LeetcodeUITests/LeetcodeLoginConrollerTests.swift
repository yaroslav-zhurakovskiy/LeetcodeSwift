import XCTest
import Foundation
import LeetcodeUI

@available(iOS 11.0, *)
class LeetcodeLoginConrollerTests: XCTestCase {
    func testSmoke() {
        let controller = LeetcodeLoginConroller()
        XCTAssertNotNil(controller)
    }
}
