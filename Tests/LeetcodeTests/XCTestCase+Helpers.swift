import XCTest

extension XCTestCase {
    func runTest(
        description: String,
        timeout: TimeInterval = 120,
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
    
    func runTest(
        testName: String = #function,
        timeout: TimeInterval = 120,
        file: StaticString = #file,
        line: UInt = #line,
        test: (XCTestExpectation) -> Void
    ) {
        runTest(
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
