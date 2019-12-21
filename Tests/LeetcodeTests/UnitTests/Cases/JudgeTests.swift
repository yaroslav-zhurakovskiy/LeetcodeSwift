import XCTest
import Leetcode

class JudgeTests: XCTestCase {
    func testSmoke() {
        assert(Judge("xxx"), isEqualTo: "xxx")
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
