import Foundation

public struct LeetcodeHTTPError: Error {
    public let responseBody: Data
    public let response: HTTPURLResponse
}

public struct LeetcodeUnauthorized: Error, CustomDebugStringConvertible {
    public let responseBody: Data
    public let response: HTTPURLResponse
    
    public var localizedDescription: String {
        return "\(response.statusCode) Unauthorized"
    }
    
    public var debugDescription: String {
        return localizedDescription
    }
}
