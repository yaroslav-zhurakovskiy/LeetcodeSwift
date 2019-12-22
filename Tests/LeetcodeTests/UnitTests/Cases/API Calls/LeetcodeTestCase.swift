import XCTest
@testable import Leetcode
import Foundation

class LeetcodeTestCase: XCTestCase {
    var leetcode: Leetcode!
    var urlSessionSpy: LeetcodeURLSessionMock!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        leetcode = Leetcode()
        urlSessionSpy = LeetcodeURLSessionMock()
        leetcode.urlSession = urlSessionSpy
    }
}
