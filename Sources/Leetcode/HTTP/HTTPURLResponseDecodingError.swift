import Foundation

public protocol LeetcodeError: Error, CustomDebugStringConvertible {
    
}

public protocol LeetcodeWrappingError: LeetcodeError {
    associatedtype ErrorType: Error = Error
    
    var originalError: ErrorType { get }
}

public extension LeetcodeWrappingError {
    var localizedDescription: String {
        return originalError.localizedDescription
    }
    
    var debugDescription: String {
        return (originalError as CustomDebugStringConvertible).debugDescription
    }
}

public struct HTTPURLResponseDecodingError: LeetcodeWrappingError {
    public let response: HTTPURLResponse
    public let body: String
    public let originalError: Error
    
    init(
        data: Data,
        response: HTTPURLResponse,
        decodingError: Error
    ) {
        self.body = String(data: data, encoding: .utf8) ?? ""
        self.response = response
        self.originalError = decodingError
    }
}

public struct GeneralHTTPURLResponseDecodingError: LeetcodeWrappingError {
    public let body: String
    public let response: HTTPURLResponse
    public let originalError: Error
    
    init(
        data: Data,
        response: HTTPURLResponse,
        originalError: Error
    ) {
        self.body = String(data: data, encoding: .utf8) ?? ""
        self.response = response
        self.originalError = originalError
    }
}
