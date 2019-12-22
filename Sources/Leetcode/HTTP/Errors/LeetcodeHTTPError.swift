import Foundation

public struct LeetcodeHTTPError: LeetcodeError {
    public let responseBody: Data
    public let response: HTTPURLResponse
}

public protocol LeetcodeHTTPResponseError: LeetcodeError {
    var responseBody: String { get }
    var response: HTTPURLResponse { get }
}
