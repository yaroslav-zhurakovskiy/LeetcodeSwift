import Foundation

public struct LeetcodeHTTPError: Error {
    public let responseBody: Data
    public let response: HTTPURLResponse
}

