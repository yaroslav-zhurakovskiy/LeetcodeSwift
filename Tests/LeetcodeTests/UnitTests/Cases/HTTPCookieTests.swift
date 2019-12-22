//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

import XCTest
import Foundation
import Leetcode

class HTTPCookieTests: XCTestCase {
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
    }
    
    func testCreateFromString() {
        let cookie: HTTPCookie! = HTTPCookie(
            fromString: "name=value" +
                "; Domain=.test.com" +
                "; expires=Sun, 29 Dec 2019 20:13:26 GMT" +
                "; HttpOnly" +
                "; Max-Age=1209600" +
                "; Path=/" +
                "; SameSite=Lax" +
                "; Secure"
        )
        
        XCTAssertNotNil(cookie)
        
        XCTAssertEqual(cookie.name, "name")
        XCTAssertEqual(cookie.value, "value")
        XCTAssertNotNil(cookie.expiresDate)
        XCTAssertTrue(cookie.isHTTPOnly)
        XCTAssertEqual(cookie.path, "/")
        XCTAssertTrue(cookie.isSecure)
        XCTAssertEqual(cookie.domain, ".test.com")
    }
    
    func testCreateFromLeetcodeSession() {
        let expires = Date(timeIntervalSince1970: 0)
        let value = "VALUE"
        let cookie = HTTPCookie(leetcodeSessionValue: value, expires: expires)
        
        XCTAssertEqual(cookie.name, LeetcodeConstants.sessionCookieName)
        XCTAssertEqual(cookie.value, value)
        XCTAssertEqual(cookie.expiresDate, expires)
        XCTAssertEqual(cookie.domain, ".leetcode.com")
        XCTAssertEqual(cookie.path, "/")
        XCTAssertTrue(cookie.isSecure)
        XCTAssertTrue(cookie.isHTTPOnly)
    }
}
