//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

import XCTest

extension XCTestCase {
    func runAsyncTest(
        description: String,
        timeout: TimeInterval = TestEnvironemt.timeout,
        file: StaticString = #file,
        line: UInt = #line,
        test: (XCTestExpectation) -> Void
    ) {
        let exp = expectation(description: description)
        test(exp)
        waitForExpectations(timeout: timeout, handler: { error in
            XCTAssertNil(error, file: file, line: line)
        })
    }
    
    func runAsyncTest(
        testName: String = #function,
        timeout: TimeInterval = TestEnvironemt.timeout,
        file: StaticString = #file,
        line: UInt = #line,
        test: (XCTestExpectation) -> Void
    ) {
        runAsyncTest(
            description: "\(normalizedTestName(testName))...",
            timeout: timeout,
            file: file,
            line: line,
            test: test
        )
    }

    private func normalizedTestName(_ testName: String) -> String {
        if let range = testName.range(of: "test") {
            var temp = testName
            temp.removeSubrange(range)
            return temp
        } else {
            return testName
        }
    }
}
