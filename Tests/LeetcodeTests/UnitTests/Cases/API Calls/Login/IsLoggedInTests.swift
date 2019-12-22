import XCTest
@testable import Leetcode
import Foundation

class DateProviderStub: DateProvider {
    private(set) var now: Date = Date()
    
    func stubNow(with date: Date) {
        now = date
    }
}

class IsLoggedInTests: LeetcodeTestCase {
    static let passedTime = Date(timeIntervalSince1970: 0)
    static let now = Date(timeIntervalSince1970: 1_000)
    static let futureTime = Date(timeIntervalSince1970: 1_000_000)
    
    let sessionCookieWithNoExpirationDate = HTTPCookie(
        leetcodeSessionValue: "SESSON_VALUE",
        expires: nil
    )
    let validSessionCookie = HTTPCookie(
        leetcodeSessionValue: "SESSON_VALUE",
        expires: IsLoggedInTests.futureTime
    )
    let expiredSessionCookie = HTTPCookie(
        leetcodeSessionValue: "SESSON_VALUE",
        expires: IsLoggedInTests.passedTime
    )
    let invalidCookie = HTTPCookie(properties: [
        .name: "INVALID",
        .value: "NOTHING",
        .expires: Date(),
        .domain: "fake",
        .path: "/",
        .secure: true
    ])!
    
    var dateProviderStub: DateProviderStub!
    
    override func setUp() {
        super.setUp()
        
        dateProviderStub = DateProviderStub()
        dateProviderStub.stubNow(with: Self.now)
        DateProviderHolder.current = dateProviderStub
    }
    
    override func tearDown() {
        DateProviderHolder.current = SystemDateProvider()
        
        super.tearDown()
    }
    
    func testIsNotLoggedInWhenMissingCookies() throws {
        httpCookieStorageMock.stubCookies(with: nil)
        
        XCTAssertFalse(leetcode.isLoggedIn)
    }
    
    func testIsNotLoggedInWhenContainsInvalidCookie() throws {
        httpCookieStorageMock.stubCookies(with: [invalidCookie])
        
        XCTAssertFalse(leetcode.isLoggedIn)
    }
    
    func testIsNotLoggedInWhenContainsExpiredSessionCookie() throws {
        httpCookieStorageMock.stubCookies(with: [expiredSessionCookie])
        
        XCTAssertFalse(leetcode.isLoggedIn)
    }
    
    func testIsLoggedInWhenContainsValidSessionCookie() {
        httpCookieStorageMock.stubCookies(with: [validSessionCookie])
        
        XCTAssertTrue(leetcode.isLoggedIn)
    }
    
    func testIsLoggedInWhenContainsSessionCookieWithNoExpirationDate() {
        httpCookieStorageMock.stubCookies(with: [sessionCookieWithNoExpirationDate])
        
        XCTAssertTrue(leetcode.isLoggedIn)
    }
}
