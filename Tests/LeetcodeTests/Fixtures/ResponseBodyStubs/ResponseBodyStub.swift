struct ResponseBodyStub: ExpressibleByStringLiteral  {
    typealias StringLiteralType = String
    
    public let value: String
    
    init(stringLiteral value: Self.StringLiteralType) {
        self.value = value
    }
}
