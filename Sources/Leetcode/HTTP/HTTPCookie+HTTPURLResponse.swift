import Foundation

public extension HTTPCookie {
    final class func cookies(from response: HTTPURLResponse) -> [HTTPCookie] {
        guard
            let headers = response.allHeaderFields as? [String: String],
            let url = response.url
            else {
                return []
        }
        
        return cookies(withResponseHeaderFields: headers, for: url)
    }
}
