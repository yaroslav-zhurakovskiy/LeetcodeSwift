import Foundation

public struct LeetcodeHTTPError: Error {
    public let responseBody: Data
    public let response: HTTPURLResponse
}

public struct LeetcodeUnauthorized: Error, CustomDebugStringConvertible {
    public init() {
        
    }
    
    public var localizedDescription: String {
        return "401 Unauthorized"
    }
    
    public var debugDescription: String {
        return localizedDescription
    }
}
