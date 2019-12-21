import XCTest
import Foundation

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
}

// TODO: Move out
extension HTTPCookie {
    convenience init?(fromString string: String) {
        var properties: [HTTPCookiePropertyKey: Any] = [:]
        
        let map: [String: HTTPCookiePropertyKey] = [
            "Max-Age": .maximumAge,
            "Path": .path,
            "Secure": .secure,
            "Domain": .domain,
            "Expires": .expires,
            "HttpOnly": HTTPCookiePropertyKey("HttpOnly")
        ]
        
        let items = string.split(separator: ";").map { String($0)}
        
        for (index, item) in items.enumerated() {
            let normalizedItem = item.trimmingCharacters(in: .whitespacesAndNewlines)
            let pair = normalizedItem.split(separator: "=").map { String($0)}
            
            if index == 0 {
                properties[.name] = pair[0]
                properties[.value] = pair[1]
            }
            
            if pair.count == 2 {
                let key = pair[0].capitalized
                let value = pair[1]
                
                if let foundProperty = map[key] {
                    properties[foundProperty] = value
                }
            } else if pair.count == 1 {
                let key = String(pair[0])
                if let foundProperty = map[key] {
                    properties[foundProperty] = true
                }
            }
        }
        
        self.init(properties: properties)
    }
}
    
