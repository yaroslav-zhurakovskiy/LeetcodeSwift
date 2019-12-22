public struct Judge: ExpressibleByStringLiteral {
    public typealias StringLiteralType = String
       
    public let value: String
       
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

public extension Judge {
    static let small: Judge = "small"
    static let large: Judge = "large"
}
