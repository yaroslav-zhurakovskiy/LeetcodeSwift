//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

import XCTest
@testable import Leetcode
import Foundation

class LeetcodeTestCase: XCTestCase {
    var leetcode: Leetcode!
    var urlSessionSpy: LeetcodeURLSessionMock!
    var httpCookieStorageMock: HTTPCookieStorageMock!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        httpCookieStorageMock = HTTPCookieStorageMock()
        leetcode = Leetcode(cookieStorage: httpCookieStorageMock)
        urlSessionSpy = LeetcodeURLSessionMock()
        leetcode.urlSession = urlSessionSpy
    }
}
