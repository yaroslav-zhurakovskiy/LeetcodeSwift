import Leetcode
import Foundation

// TODO: Add tests
extension HTTPCookie {
    convenience init(leetcodeSessionValue value: String, expires: Date) {
        self.init(properties: [
            .name: LeetcodeConstants.sessionCookieName,
            .value: value,
            .expires: expires,
            .domain: ".leetcode.com",
            .path: "/",
            .secure: true,
            HTTPCookiePropertyKey("SameSite"): "Lax",
            HTTPCookiePropertyKey("HttpOnly"): true
        ])!
    }
}

extension Leetcode {
    func login(usingSessionCookieValue value: String, expires: Date, completion: @escaping (Result<Void, Error>) -> Void) {
        let cookie = HTTPCookie(leetcodeSessionValue: value, expires: expires)
        login(usingSessionCookie: cookie, completion: completion)
    }
}
