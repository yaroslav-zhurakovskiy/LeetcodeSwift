import XCTest

func assertLocalizedDescription(
    of error: Error,
    isEqualTo msg: String,
    file: StaticString = #file,
    line: UInt = #line
) {
    XCTAssertEqual(error.localizedDescription, msg, file: file, line: line)
}

func assertDebugDescription<T: CustomDebugStringConvertible> (
    of object: T,
    isEqualTo msg: String,
    file: StaticString = #file,
    line: UInt = #line
) {
    XCTAssertEqual(object.debugDescription, msg, file: file, line: line)
}
