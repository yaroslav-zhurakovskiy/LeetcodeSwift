import Foundation

public class Leetcode {
    internal var requestBuilder: LeetcodeRequestBuilder
    internal var cookieStorage: HTTPCookieStorage
    internal var urlSession: LeetcodeURLSession
    
    public init(cookieStorage: HTTPCookieStorage = .shared) {
        self.cookieStorage = cookieStorage
        self.requestBuilder = LeetcodeRequestBuilder(cookieStorage: cookieStorage)
        self.urlSession = LeetcodeURLSessionImpl()
    }
    
    public convenience init() {
        self.init(cookieStorage: .shared)
    }
}
