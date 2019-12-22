//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

import XCTest
import Leetcode

class JudgeTests: XCTestCase {
    func testSmoke() {
        let judge = Judge("xxx")
        assert(judge, isEqualTo: "xxx")
    }
    
    func testExpressibleByStringLiteral() {
        let language: Judge = "my-judge"
        assert(language, isEqualTo: "my-judge")
    }
    
    func testValues() {
        assert(.large, isEqualTo: "large")
        assert(.small, isEqualTo: "small")
    }
    
    func assert(
        _ judge: Judge,
        isEqualTo value: String,
        line: UInt = #line
    ) {
        XCTAssertEqual(judge.value, value, file: #file, line: line)
    }
}
