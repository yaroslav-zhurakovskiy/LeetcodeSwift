import XCTest
@testable import Leetcode
import Foundation

class LoginTests: LeetcodeTestCase {
    let cookie = HTTPCookie(leetcodeSessionValue: "SESSON_VALUE", expires: Date())
    
    func testFetchCookiesSuccess() throws {
        try urlSessionSpy.setSuccessResult(bodyStub: .empty, statusCode: 200)
                                
        var result: Result<Void, Error>!
        leetcode.login(usingSessionCookie: cookie, completion: { result = $0 })
        
        assertNumberOfRequests(isEqualTo: 1)
        assertFetchCookiesRequest(at: 0)
        XCTAssertNotNil(result)
        assertSuccess(result)
        httpCookieStorageMock.assertSetCookieOnce(cookie)
    }
    
    func testFetchCookiesFailuire() throws {
        let testError = TestError.shared
        urlSessionSpy.setFailureResult(error: testError)
        
        var result: Result<Void, Error>!
        leetcode.login(usingSessionCookie: cookie, completion: { result = $0 })
        
        assertNumberOfRequests(isEqualTo: 1)
        assertFetchCookiesRequest(at: 0)
        assertFailure(result)
        let error = retreiveError(fromResult: result, as: TestError.self)
        XCTAssertTrue(error === testError)
        httpCookieStorageMock.assertNoSetCookies()
    }
    
    private func assertNumberOfRequests(isEqualTo number: Int, line: UInt = #line) {
        urlSessionSpy.assertNumberOfRequests(equalsTo: number, line: line)
    }
    
    private func assertFetchCookiesRequest(at index: Int, line: UInt = #line) {
        let request = urlSessionSpy.requests[index]
        assertMethod(of: request, isEqualTo: "HEAD", line: line)
        assertURL(of: request, isEqualToLeetcodePath: "/accounts/login/", line: line)
        assertEmptyBody(of: request, line: line)
    }
}
