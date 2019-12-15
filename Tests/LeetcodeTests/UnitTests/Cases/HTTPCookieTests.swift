import XCTest
import Foundation

class HTTPCookieTests: XCTestCase {
    func testCreateFromString() {
        let cookie = HTTPCookie(
            fromString: """
            LEETCODE_SESSION=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJfYXV0aF91c2VyX2lkIjoiMjQ3NjQxOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGFlZTFhMGQ1NDlhNWRjN2YzMjg2ZmExNmE4MGNhODI1NjVhNmY1MSIsImlkIjoyNDc2NDE4LCJlbWFpbCI6Inlhcm9zbGF2LnpodXJha292c2tpeUBnbWFpbC5jb20iLCJ1c2VybmFtZSI6Inlhcm9zbGF2eiIsInVzZXJfc2x1ZyI6Inlhcm9zbGF2eiIsImF2YXRhciI6Imh0dHBzOi8vd3d3LmdyYXZhdGFyLmNvbS9hdmF0YXIvNThkMTdmNzVkNGMxZDk5NWRjNzVkOWY0YmYxMDkyOTMucG5nP3M9MjAwIiwidGltZXN0YW1wIjoiMjAxOS0xMi0xNSAyMDoxMzoyNi4xMjA5NzMrMDA6MDAiLCJJUCI6IjE3Ni4zNi4xNzkuMTg3IiwiSURFTlRJVFkiOiJlOTJmMjA0MTBmOGFiZTg2ZjA5ZGNiYWM4Mzc0NmQyMCIsIl9zZXNzaW9uX2V4cGlyeSI6MTIwOTYwMH0.HQArY8RPpaeXYeAKv7eomoFoXNxhKEf4pr66wHV-o6g; Domain=.leetcode.com; expires=Sun, 29 Dec 2019 20:13:26 GMT; HttpOnly; Max-Age=1209600; Path=/; SameSite=Lax; Secure
            """
        )
        
        XCTAssertNotNil(cookie)
    }
}

extension HTTPCookie {
    convenience init?(fromString string: String) {
        var properties: [HTTPCookiePropertyKey: Any] = [:]
        
        var map: [String: HTTPCookiePropertyKey] = [
            "Max-Age": .maximumAge,
            "Path": .path,
            "Secure": .secure,
            "Domain": .domain,
            "Expires": .expires
        ]
        
        if #available(OSX 10.15, *) {
            map["SameSite"] = .sameSitePolicy
        } else {
            map["SameSite"] = HTTPCookiePropertyKey("SameSite")
        }
        
        let items = string.split(separator: ";").map { String($0)}
        
        for (index, item) in items.enumerated() {
            let normalizedItem = item.trimmingCharacters(in: .whitespacesAndNewlines)
            let pair = normalizedItem.split(separator: "=")
            
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
    
