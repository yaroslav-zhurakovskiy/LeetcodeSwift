struct ResponseBodyStub: ExpressibleByStringLiteral  {
    typealias StringLiteralType = String
    
    let value: String
    
    init(stringLiteral value: Self.StringLiteralType) {
        self.value = value
    }
}

extension ResponseBodyStub {
    static let empty: ResponseBodyStub = ""
}
