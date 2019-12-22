import XCTest
import Leetcode

class DeleteSessionTests: LeetcodeTestCase {
    let sessionID = 1
    
    func testSuccess() throws {
        try urlSessionSpy.setSuccessResult(bodyStub: .createSessionSuccess, statusCode: 200)
        
        var result: Result<Void, Error>!
        leetcode.deleteSession(byID: sessionID) { result = $0 }
        
        assertCorrectRequest()
        XCTAssertNotNil(result)
        assertSuccess(result)
    }
    
    func testFailure() {
        let testError = TestError.shared
        urlSessionSpy.setFailureResult(error: testError)
        
        var result: Result<Void, Error>!
        leetcode.deleteSession(byID: sessionID) { result = $0 }
        
        assertCorrectRequest()
        XCTAssertNotNil(result)
        assertFailure(result)
        let error = retreiveError(fromResult: result, as: TestError.self)
        XCTAssertTrue(error === testError)
    }
    
    private func assertCorrectRequest(line: UInt = #line) {
        urlSessionSpy.assertOneRequest(line: line)
        
        let request = urlSessionSpy.requests[0]
        assertURL(of: request, isEqualToLeetcodePath: "/session", line: line)
        assertMethod(of: request, isEqualTo: "DELETE", line: line)
        assertOrigin(of: request, isEqualToLeetcodePath: "/", line: line)
        assertReferer(of: request, isEqualToLeetcodePath: "/session", line: line)
        assertBody(of: request, isEqualToJSON: ["target": sessionID], line: line)
        assertContentType(of: request, isEqualTo: .applicationJSON, line: line)
    }
}
