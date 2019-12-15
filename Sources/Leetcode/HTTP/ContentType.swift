import Foundation

public struct ContentType: ExpressibleByStringLiteral {
    public typealias StringLiteralType = String
    
    public let value: String
    
    public init(stringLiteral value: Self.StringLiteralType) {
        self.value = value
    }
}

public extension ContentType {
    static let applicationJSON: ContentType = "application/json"
    static let multipartFormData: ContentType = "multipart/form-data"
}

extension URLRequest {
    mutating func setContentType(_ type: ContentType) {
        setValue(type.value, forHTTPHeaderField: .contentType)
    }
}
