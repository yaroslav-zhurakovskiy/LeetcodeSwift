//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

import Leetcode
import XCTest

class LeetcodeConstantsTests: XCTestCase {
    func testSessionName() {
        XCTAssertEqual(LeetcodeConstants.sessionCookieName, "LEETCODE_SESSION")
    }
}
