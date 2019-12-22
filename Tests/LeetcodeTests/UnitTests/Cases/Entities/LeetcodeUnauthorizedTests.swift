//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

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
