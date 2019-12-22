//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

import Leetcode
import Foundation

extension HTTPCookie {
    convenience init(leetcodeSessionValue value: String, expires: Date?) {
        var properties: [HTTPCookiePropertyKey: Any] = [
            .name: LeetcodeConstants.sessionCookieName,
            .value: value,
            .domain: ".leetcode.com",
            .path: "/",
            .secure: true,
            HTTPCookiePropertyKey("SameSite"): "Lax",
            HTTPCookiePropertyKey("HttpOnly"): true
        ]
        if let expires = expires {
            properties[.expires] = expires
        }
        self.init(properties: properties)!
    }
}

extension Leetcode {
    func login(
        usingSessionCookieValue value: String,
        expires: Date, completion: @escaping (Result<Void, Error>) -> Void
    ) {
        let cookie = HTTPCookie(leetcodeSessionValue: value, expires: expires)
        login(usingSessionCookie: cookie, completion: completion)
    }
}
