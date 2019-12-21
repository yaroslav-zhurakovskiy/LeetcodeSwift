import XCTest
import Leetcode

class ProgrammingLanguageTests: XCTestCase {
    func testSmoke() {
        assert(ProgrammingLanguage(value: "xxx"), isEqualTo: "xxx")
    }
    
    func testExpressibleByStringLiteral() {
        let language: ProgrammingLanguage = "mylanguage"
        assert(language, isEqualTo: "mylanguage")
    }
    
    func testValues() {
        assert(.bash, isEqualTo: "bash")
        assert(.clang, isEqualTo: "c")
        assert(.cpp, isEqualTo: "cpp")
        assert(.csharp, isEqualTo: "csharp")
        assert(.golang, isEqualTo: "golang")
        assert(.java, isEqualTo: "java")
        assert(.javascript, isEqualTo: "javascript")
        assert(.kotlin, isEqualTo: "kotlin")
        assert(.mysql, isEqualTo: "mysql")
        assert(.php, isEqualTo: "php")
        assert(.python, isEqualTo: "python")
        assert(.python3, isEqualTo: "python3")
        assert(.ruby, isEqualTo: "ruby")
        assert(.rust, isEqualTo: "rust")
        assert(.scala, isEqualTo: "scala")
        assert(.swift, isEqualTo: "swift")
    }
    
    
    func assert(
        _ language: ProgrammingLanguage,
        isEqualTo value: String,
        line: UInt = #line
    ) {
        XCTAssertEqual(language.value, value, file: #file, line: line)
    }
}
