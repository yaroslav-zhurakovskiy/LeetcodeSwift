//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

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
