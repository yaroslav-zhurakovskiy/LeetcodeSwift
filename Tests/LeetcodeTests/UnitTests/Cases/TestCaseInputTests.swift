import XCTest
import Leetcode

class TestCaseInputTests: XCTestCase {
    func testSmoke() {
        let input = TestCaseInput(rawValue: "2\n2")
        assert(input, isEqualTo: "2\n2")
    }
    
    func testCreateFromConvertibles() {
        let input = TestCaseInput(from: [
            FakeTestCaseInputParamConvertible(value: "v1"),
            FakeTestCaseInputParamConvertible(value: "v2")
        ])
        assert(input, isEqualTo: "v1\nv2")
    }
    
    func testCreateFromDifferentConvertibles() {
        let input = TestCaseInput(from: [
            1,
            "text",
            [1, 2]
        ])
        assert(input, isEqualTo: "1\n\"text\"\n[1,2]")
    }
    
    func testSwiftTypesConvertbiles() {
        assert(Int(1), isEqualTo: "1")
        assert(Int(2), isEqualTo: "2")
        assert(Float(10.10), isEqualTo: "10.1")
        assert(Double(10.10), isEqualTo: "10.1")
        assert(true, isEqualTo: "true")
        assert(false, isEqualTo: "false")
        assert("text", isEqualTo: "\"text\"")
        assert([1, 2, 3], isEqualTo: "[1,2,3]")
        assert(Optional<Int>.none, isEqualTo: "null")
    }
    
    func testFoundationTypesConvertbiles() {
        assert(NSNull(), isEqualTo: "null")
        assert("text" as NSString, isEqualTo: "\"text\"")
        assert(0 as NSNumber, isEqualTo: "0")
        assert(10.2 as NSNumber, isEqualTo: "10.2")
        assert(true as NSNumber, isEqualTo: "1")
        assert(false as NSNumber, isEqualTo: "0")
    }
    
    
    func assert(
        _ convertible: TestCaseInputParamConvertible,
        isEqualTo value: String,
        line: UInt = #line
    ) {
        XCTAssertEqual(convertible.testCaseInputParamValue, value, file: #file, line: line)
    }
    
    func assert(
        _ input: TestCaseInput,
        isEqualTo value: String,
        line: UInt = #line
    ) {
        XCTAssertEqual(input.rawValue, value, file: #file, line: line)
    }
}

struct FakeTestCaseInputParamConvertible: TestCaseInputParamConvertible {
    private let value: String
    
    init(value: String) {
        self.value = value
    }
    
    var testCaseInputParamValue: String {
        return value
    }
}
