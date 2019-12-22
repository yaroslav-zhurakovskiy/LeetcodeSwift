import XCTest
@testable import Leetcode
import Foundation

class DeleteFavoriteListTests: LeetcodeTestCase {
    func testStatus204() throws {
        try urlSessionSpy.setSuccessResult(bodyStub: .empty, statusCode: 204)
        
        var result: Result<Void, Error>!
        leetcode.deleteFavoriteList(byHashID: .any) { result = $0 }
        
        assertCorrectRequest(usingID: .any)
        XCTAssertNotNil(result)
        assertSuccess(result)
    }
    
    func testStatusNot204() {
        let data =  Data.test
        let response = HTTPURLResponse(statusCode: 1_000)
        urlSessionSpy.setResult(.success((data: data, response: response)))
        
        var result: Result<Void, Error>!
        leetcode.deleteFavoriteList(byHashID: .any) { result = $0 }
        
        assertCorrectRequest(usingID: .any)
        XCTAssertNotNil(result)
        assertFailure(result)
        let error = retreiveError(fromResult: result, as: LeetcodeHTTPError.self)
        XCTAssertTrue(error.response === response)
        XCTAssertEqual(error.responseBody, data)
    }
    
    func testFailure() {
        let testError = TestError.shared
        urlSessionSpy.setFailureResult(error: testError)
        
        var result: Result<Void, Error>!
        leetcode.deleteFavoriteList(byHashID: .any) { result = $0 }
        
        assertCorrectRequest(usingID: .any)
        XCTAssertNotNil(result)
        assertFailure(result)
        let error = retreiveError(fromResult: result, as: TestError.self)
        XCTAssertTrue(error === testError)
    }
    
    private func assertCorrectRequest(usingID id: String, line: UInt = #line) {
        XCTAssertEqual(urlSessionSpy.requests.count, 1, line: line)
        let request = urlSessionSpy.requests[0]
        assertURL(of: request, isEqualToLeetcodePath: "/list/api/\(id)", line: line)
        assertMethod(of: request, isEqualTo: "DELETE", line: line)
        assertOrigin(of: request, isEqualToLeetcodePath: "/list/", line: line)
        assertReferer(of: request, isEqualToLeetcodePath: "/list/", line: line)
    }
}

extension Int {
    static var any: Int { return 0 }
}

extension Data {
    static var test: Data {
        return "*TEST-DATA*".data(using: .utf8)!
    }
}

extension String {
    static var any: String {
        return "ANY"
    }
}

extension HTTPURLResponse {
    convenience init(statusCode: Int, file: String = #file) {
        self.init(
            url: URL(fileURLWithPath: file),
            statusCode: statusCode,
            httpVersion: nil,
            headerFields: nil
        )!
    }
}
