import Foundation
import Leetcode

class FakeHttpCookieStorage: HTTPCookieStorage {
    private let session: String
    private let csrftoken: String
    
    init(session: String, csrftoken: String) {
        self.session = session
        self.csrftoken = csrftoken
    }
      
    override var cookies: [HTTPCookie]? {
        return fakeCookies
    }
    
    override func cookies(for URL: URL) -> [HTTPCookie]? {
        return fakeCookies
    }
    
    private var fakeCookies: [HTTPCookie] {
        return [
            HTTPCookie(properties: [
                .name: "LEETCODE_SESSION",
                .value: session,
                .domain: "test",
                .path: "/"
            ])!,
            HTTPCookie(properties: [
                .name: "csrftoken",
                .value: csrftoken,
                .domain: "test",
                .path: "/"
            ])!
        ]
    }
}
