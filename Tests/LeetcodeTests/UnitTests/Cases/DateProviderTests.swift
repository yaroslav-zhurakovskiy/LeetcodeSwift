import Leetcode
import XCTest

class DateProviderTest: XCTestCase {
    func testDefaultDateProvider() {
        XCTAssertTrue(DateProviderHolder.current is SystemDateProvider)
    }
    
    func testSystemDateProvider() {
        let provider: DateProvider = SystemDateProvider()
        XCTAssertNotNil(provider.now)
    }
}
