import Foundation
import XCTest

class HTTPCookieStorageSpy: HTTPCookieStorage {
    private(set) var setCookies: [HTTPCookie] = []
    
    override func setCookie(_ cookie: HTTPCookie) {
        setCookies.append(cookie)
    }
}

class HTTPCookieStorageMock: HTTPCookieStorageSpy {
    func assertSetCookieOnce(_ cookie: HTTPCookie, file: StaticString = #file, line: UInt = #line) {
        assertNumberOfSetCookies(1, file: file, line: line)
        XCTAssertEqual(setCookies[0], cookie, "Set cookie", file: file, line: line)
    }
    
    func assertNoSetCookies(file: StaticString = #file, line: UInt = #line) {
        assertNumberOfSetCookies(0, file: file, line: line)
    }
    
    func assertNumberOfSetCookies(_ number: Int, file: StaticString = #file, line: UInt = #line) {
        XCTAssertEqual(setCookies.count, number, "Number of set cookies", file: file, line: line)
    }
}
