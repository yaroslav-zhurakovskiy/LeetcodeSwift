import XCTest
@testable import Leetcode
import Foundation

class LogoutTests: LeetcodeTestCase {
    let validSessionCookie = HTTPCookie(leetcodeSessionValue: "SESSON_VALUE", expires: Date())
    let invalidCookie = HTTPCookie(properties: [
        .name: "INVALID",
        .value: "NOTHING",
        .expires: Date(),
        .domain: "fake",
        .path: "/",
        .secure: true
    ])!
    
    func testStorageContainsValudCookie() throws {
        httpCookieStorageMock.stubCookies(with: [validSessionCookie])
        
        leetcode.logout()
        
        httpCookieStorageMock.assertDeleteCookieOnce(validSessionCookie)
    }
    
    func testStorageIsMissingCookies() {
        httpCookieStorageMock.stubCookies(with: nil)
        
        leetcode.logout()
        
        httpCookieStorageMock.assertNumberOfDeletedCookies(0)
    }
    
    func testStorageContainsInvalidCookies() {
        httpCookieStorageMock.stubCookies(with: [invalidCookie])
        
        leetcode.logout()
        
        httpCookieStorageMock.assertNoDeletedCookies()
    }
}
