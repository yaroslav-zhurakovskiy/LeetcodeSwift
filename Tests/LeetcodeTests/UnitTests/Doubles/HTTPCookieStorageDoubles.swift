//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

import Foundation
import XCTest

class HTTPCookieStorageStub: HTTPCookieStorage {
    fileprivate var cookiesStub: [HTTPCookie]?
    
    func stubCookies(with stub: [HTTPCookie]?) {
        cookiesStub = stub
    }
}

class HTTPCookieStorageSpy: HTTPCookieStorageStub {
    fileprivate var setCookies: [HTTPCookie] = []
    fileprivate var deletedCookies: [HTTPCookie] = []
    
    override func setCookie(_ cookie: HTTPCookie) {
        setCookies.append(cookie)
    }
    
    override func deleteCookie(_ cookie: HTTPCookie) {
        deletedCookies.append(cookie)
    }
    
    override var cookies: [HTTPCookie]? {
        return cookiesStub
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

extension HTTPCookieStorageMock {
    func assertDeleteCookieOnce(_ cookie: HTTPCookie, file: StaticString = #file, line: UInt = #line) {
        assertNumberOfDeletedCookies(1, file: file, line: line)
        XCTAssertEqual(deletedCookies[0], cookie, "Deleted cookie", file: file, line: line)
    }
    
    func assertNoDeletedCookies(file: StaticString = #file, line: UInt = #line) {
        assertNumberOfDeletedCookies(0, file: file, line: line)
    }
    
    func assertNumberOfDeletedCookies(_ number: Int, file: StaticString = #file, line: UInt = #line) {
        XCTAssertEqual(deletedCookies.count, number, "Number of deleted cookies", file: file, line: line)
    }
}
